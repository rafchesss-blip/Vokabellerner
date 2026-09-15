// Vokabellerner API (Netlify Function)
//
// Bietet Registrierung/Login mit Benutzername + Passwort sowie einen
// einfachen Cloud-Speicher pro Konto. Die Daten liegen in Netlify Blobs.
//
// Endpunkte:
//   POST /api/auth/register  {username, password}
//   POST /api/auth/login     {username, password}
//   POST /api/auth/logout
//   GET  /api/me
//   GET  /api/data
//   PUT  /api/data           {lessons, lists}
//
// Jedes Konto darf höchstens MAX_LISTS Übungslisten gleichzeitig haben.

const crypto = require('crypto');
const { getStore } = require('@netlify/blobs');

const store = getStore('vokabellerner');

const MAX_LISTS = 10;
const SESSION_MS = 30 * 24 * 60 * 60 * 1000; // 30 Tage

const CORS = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'Content-Type, Authorization',
  'Access-Control-Allow-Methods': 'GET, POST, PUT, OPTIONS',
};

exports.handler = async (event) => {
  if (event.httpMethod === 'OPTIONS') {
    return { statusCode: 204, headers: CORS, body: '' };
  }

  const rawUrl = event.rawUrl || `http://localhost${event.path || '/'}`;
  const { pathname } = new URL(rawUrl);

  try {
    let result;
    if (event.httpMethod === 'POST' && pathname === '/api/auth/register') {
      result = await register(event);
    } else if (event.httpMethod === 'POST' && pathname === '/api/auth/login') {
      result = await login(event);
    } else if (event.httpMethod === 'POST' && pathname === '/api/auth/logout') {
      result = await logout(event);
    } else if (event.httpMethod === 'GET' && pathname === '/api/me') {
      result = await me(event);
    } else if (event.httpMethod === 'GET' && pathname === '/api/data') {
      result = await getData(event);
    } else if (event.httpMethod === 'PUT' && pathname === '/api/data') {
      result = await putData(event);
    } else {
      result = { statusCode: 404, body: JSON.stringify({ error: 'Nicht gefunden' }) };
    }

    return { ...result, headers: { ...CORS, ...(result.headers || {}) } };
  } catch (err) {
    console.error(err);
    return {
      statusCode: 500,
      headers: CORS,
      body: JSON.stringify({ error: 'Interner Serverfehler' }),
    };
  }
};

// ── Auth-Handlers ─────────────────────────────────────────────────────────

async function register(event) {
  const body = parseBody(event);
  const username = normalizeUsername(body.username);
  const password = body.password;

  if (!isValidUsername(username)) {
    return err(400, 'Benutzername muss 2–30 Zeichen haben (Buchstaben, Zahlen, Punkt, _ oder -).');
  }
  if (!isValidPassword(password)) {
    return err(400, 'Das Passwort muss mindestens 6 Zeichen haben.');
  }

  const key = userKey(username);
  const existing = await store.get(key);
  if (existing) {
    return err(409, 'Dieser Benutzername ist bereits vergeben.');
  }

  const salt = crypto.randomBytes(16).toString('hex');
  const passwordHash = hashPassword(password, salt);
  const userId = crypto.randomBytes(16).toString('hex');

  await store.set(key, JSON.stringify({
    username,
    passwordHash,
    salt,
    userId,
    createdAt: Date.now(),
  }));

  const token = await createSession(username, userId);
  return ok({ token, username });
}

async function login(event) {
  const body = parseBody(event);
  const username = normalizeUsername(body.username);
  const password = body.password;

  const raw = await store.get(userKey(username));
  if (!raw) return err(401, 'Benutzername oder Passwort ist falsch.');

  const user = JSON.parse(raw);
  if (!verifyPassword(password, user.salt, user.passwordHash)) {
    return err(401, 'Benutzername oder Passwort ist falsch.');
  }

  const token = await createSession(user.username, user.userId);
  return ok({ token, username: user.username });
}

async function logout(event) {
  const session = await getSession(event);
  if (session) {
    await store.delete(sessionKey(session.token));
  }
  return ok({ ok: true });
}

async function me(event) {
  const session = await getSession(event);
  if (!session) return err(401, 'Nicht angemeldet.');
  return ok({ username: session.username });
}

// ── Daten-Handlers ────────────────────────────────────────────────────────

async function getData(event) {
  const session = await getSession(event);
  if (!session) return err(401, 'Nicht angemeldet.');

  const raw = await store.get(dataKey(session.userId));
  const data = raw ? JSON.parse(raw) : { lessons: null, lists: [] };
  return ok(data);
}

async function putData(event) {
  const session = await getSession(event);
  if (!session) return err(401, 'Nicht angemeldet.');

  const body = parseBody(event);
  const lists = Array.isArray(body.lists) ? body.lists : [];

  if (lists.length > MAX_LISTS) {
    return err(400, `Maximal ${MAX_LISTS} Listen sind gleichzeitig erlaubt.`);
  }

  await store.set(dataKey(session.userId), JSON.stringify({
    lessons: body.lessons ?? null,
    lists,
  }));

  return ok({ ok: true, listCount: lists.length });
}

// ── Hilfsfunktionen ───────────────────────────────────────────────────────

function parseBody(event) {
  if (!event.body) return {};
  try {
    return JSON.parse(event.body);
  } catch (_) {
    return {};
  }
}

function ok(obj) {
  return { statusCode: 200, body: JSON.stringify(obj) };
}

function err(statusCode, message) {
  return { statusCode, body: JSON.stringify({ error: message }) };
}

function normalizeUsername(value) {
  return String(value || '').trim().toLowerCase();
}

function isValidUsername(value) {
  return /^[\p{L}\p{N}_.-]{2,30}$/u.test(value);
}

function isValidPassword(value) {
  return typeof value === 'string' && value.length >= 6 && value.length <= 128;
}

function userKey(username) {
  return 'user_' + Buffer.from(username, 'utf8').toString('base64url');
}

function sessionKey(token) {
  return 'session_' + token;
}

function dataKey(userId) {
  return 'data_' + userId;
}

function hashPassword(password, salt) {
  return crypto.scryptSync(password, salt, 64).toString('hex');
}

function verifyPassword(password, salt, expectedHex) {
  const expected = Buffer.from(expectedHex, 'hex');
  const actual = crypto.scryptSync(password, salt, 64);
  return actual.length === expected.length && crypto.timingSafeEqual(actual, expected);
}

async function createSession(username, userId) {
  const token = crypto.randomBytes(32).toString('hex');
  await store.set(sessionKey(token), JSON.stringify({
    token,
    username,
    userId,
    expiresAt: Date.now() + SESSION_MS,
  }));
  return token;
}

async function getSession(event) {
  const auth = event.headers?.authorization || event.headers?.Authorization || '';
  const token = auth.startsWith('Bearer ') ? auth.slice(7).trim() : '';
  if (!token) return null;

  const raw = await store.get(sessionKey(token));
  if (!raw) return null;

  try {
    const session = JSON.parse(raw);
    if (session.expiresAt && session.expiresAt < Date.now()) {
      await store.delete(sessionKey(token));
      return null;
    }
    return session;
  } catch (_) {
    return null;
  }
}
