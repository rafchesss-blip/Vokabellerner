// Vokabellerner API (Netlify Function)
//
// Bietet Registrierung/Login mit Benutzername + Passwort sowie einen
// Cloud-Speicher pro Konto (Netlify Blobs). Zusätzlich gibt es ein
// fest eingebautes Admin-Konto, das alle Konten verwalten und neue
// Lektionen für alle Nutzer hinzufügen kann.
//
// Endpunkte:
//   POST   /api/auth/register        {username, password}
//   POST   /api/auth/login           {username, password}
//   POST   /api/auth/logout
//   GET    /api/me
//   GET    /api/data
//   PUT    /api/data                 {lessons, lists}
//
//   GET    /api/admin/users
//   GET    /api/admin/users/:name/data
//   DELETE /api/admin/users/:name
//   POST   /api/admin/users/:name/impersonate
//   GET    /api/admin/lessons
//   POST   /api/admin/lessons        {name, boxes:[{name, vocabs:[{latin, middle?, german}]}]}
//   PUT    /api/admin/lessons/:id     {name, boxes:[{name, vocabs:[{id?, latin, middle?, german}]}]}
//   DELETE /api/admin/lessons/:id

const crypto = require('crypto');
const { getStore, connectLambda } = require('@netlify/blobs');

// Der Blob-Store wird pro Funktion-Instanz erst beim ersten Aufruf erzeugt.
// In der „Lambda compatibility mode“ muss vorher `connectLambda(event)`
// aufgerufen werden, damit die Netlify-Blobs-Umgebung verfügbar ist.
let store = null;

function ensureStore(event) {
  // Bei jedem Aufruf neu erzeugen: Der Netlify-Blobs-Token wird pro
  // Funktionsaufruf frisch bereitgestellt und läuft nach einiger Zeit ab.
  // Ein dauerhaft zwischengespeicherter Store würde den alten (abgelaufenen)
  // Token weiterverwenden.
  if (event && event.blobs) {
    try {
      connectLambda(event);
    } catch (_) {
      // Falls die Umgebung bereits konfiguriert ist, ignorieren wir das.
    }
  }
  store = getStore('vokabellerner');
}

const MAX_LISTS = 10;
const MAX_LESSONS = 30; // Admin-Lektionen (zusätzlich zu den Grundlektionen)
const SESSION_MS = 30 * 24 * 60 * 60 * 1000; // 30 Tage

// Fest eingebautes Admin-Konto.
const ADMIN_USERNAME = 'rafchesss';
const ADMIN_SALT = 'a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6';
const ADMIN_HASH =
  '8c4a1c36c091d721d6e522901c659ba25cc0f088ebba8e61d14307e4dbaeeb1c' +
  '503dc897bfb009fe9bb749343aa46b92a26de9e0de51121ffc5d15f3464bebce';

const CORS = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'Content-Type, Authorization',
  'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
};

exports.handler = async (event) => {
  if (event.httpMethod === 'OPTIONS') {
    return { statusCode: 204, headers: CORS, body: '' };
  }

  const rawUrl = event.rawUrl || `http://localhost${event.path || '/'}`;
  let pathname;
  try {
    pathname = new URL(rawUrl).pathname;
  } catch (_) {
    pathname = event.path || '/';
  }

  // Fallback: falls die Umleitung den Funktionspfad statt des Originalpfads
  // liefert, den `/api/...`-Teil aus dem event.path ziehen.
  if (!pathname.startsWith('/api/')) {
    const match = (event.path || '').match(/\/api\/.*$/);
    if (match) pathname = match[0];
  }

  try {
    ensureStore(event);

    let result;
    const method = event.httpMethod;

    if (method === 'POST' && pathname === '/api/auth/register') {
      result = await register(event);
    } else if (method === 'POST' && pathname === '/api/auth/login') {
      result = await login(event);
    } else if (method === 'POST' && pathname === '/api/auth/logout') {
      result = await logout(event);
    } else if (method === 'GET' && pathname === '/api/me') {
      result = await me(event);
    } else if (method === 'GET' && pathname === '/api/data') {
      result = await getData(event);
    } else if (method === 'PUT' && pathname === '/api/data') {
      result = await putData(event);
    } else if (method === 'GET' && pathname === '/api/admin/users') {
      result = await adminListUsers(event);
    } else if (
      method === 'GET' &&
      /^\/api\/admin\/users\/[^/]+\/data$/.test(pathname)
    ) {
      result = await adminGetUserData(event, userFromPath(pathname));
    } else if (
      method === 'DELETE' &&
      /^\/api\/admin\/users\/[^/]+$/.test(pathname)
    ) {
      result = await adminDeleteUser(event, userFromPath(pathname));
    } else if (method === 'POST' && pathname === '/api/admin/lessons') {
      result = await adminAddLesson(event);
    } else if (method === 'GET' && pathname === '/api/admin/lessons') {
      result = await adminListLessons(event);
    } else if (
      method === 'PUT' &&
      /^\/api\/admin\/lessons\/[^/]+$/.test(pathname)
    ) {
      result = await adminUpdateLesson(event, lessonIdFromPath(pathname));
    } else if (
      method === 'DELETE' &&
      /^\/api\/admin\/lessons\/[^/]+$/.test(pathname)
    ) {
      result = await adminDeleteLesson(event, lessonIdFromPath(pathname));
    } else if (
      method === 'POST' &&
      /^\/api\/admin\/users\/[^/]+\/impersonate$/.test(pathname)
    ) {
      result = await adminImpersonate(event, userFromPath(pathname));
    } else {
      result = { statusCode: 404, body: JSON.stringify({ error: 'Nicht gefunden' }) };
    }

    return { ...result, headers: { ...CORS, ...(result.headers || {}) } };
  } catch (err) {
    console.error(err);
    return {
      statusCode: 500,
      headers: CORS,
      body: JSON.stringify({ error: (err && err.message) || 'Interner Serverfehler' }),
    };
  }
};

function userFromPath(pathname) {
  const parts = pathname.split('/');
  const raw = parts[4] || '';
  try {
    return decodeURIComponent(raw);
  } catch (_) {
    return raw;
  }
}

function lessonIdFromPath(pathname) {
  const parts = pathname.split('/');
  const raw = parts[4] || '';
  try {
    return decodeURIComponent(raw);
  } catch (_) {
    return raw;
  }
}

// ── Auth-Handlers ─────────────────────────────────────────────────────────

async function register(event) {
  await ensureAdmin();

  const body = parseBody(event);
  const username = normalizeUsername(body.username);
  const password = body.password;

  if (!isValidUsername(username)) {
    return err(400, 'Benutzername muss 2–30 Zeichen haben (Buchstaben, Zahlen, Punkt, _ oder -).');
  }
  if (username === ADMIN_USERNAME) {
    return err(409, 'Dieser Benutzername ist bereits vergeben.');
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
    isAdmin: false,
    createdAt: Date.now(),
    tokens: [],
  }));
  await addToIndex(username);

  const token = await createSession(username, userId, false);
  return ok({ token, username, isAdmin: false });
}

async function login(event) {
  await ensureAdmin();

  const body = parseBody(event);
  const username = normalizeUsername(body.username);
  const password = body.password;

  const raw = await store.get(userKey(username));
  if (!raw) return err(401, 'Benutzername oder Passwort ist falsch.');

  const user = JSON.parse(raw);
  if (!verifyPassword(password, user.salt, user.passwordHash)) {
    return err(401, 'Benutzername oder Passwort ist falsch.');
  }

  const token = await createSession(user.username, user.userId, !!user.isAdmin);
  return ok({ token, username: user.username, isAdmin: !!user.isAdmin });
}

async function logout(event) {
  const session = await getSession(event);
  if (session) {
    await store.delete(sessionKey(session.token));
    await removeSessionToken(session.username, session.token);
  }
  return ok({ ok: true });
}

async function me(event) {
  const session = await getSession(event);
  if (!session) return err(401, 'Nicht angemeldet.');
  return ok({ username: session.username, isAdmin: !!session.isAdmin });
}

// ── Daten-Handlers ────────────────────────────────────────────────────────

async function getData(event) {
  const session = await getSession(event);
  if (!session) return err(401, 'Nicht angemeldet.');

  const raw = await store.get(dataKey(session.userId));
  const data = raw ? JSON.parse(raw) : { lessons: [], lists: [] };
  const lessons = await mergeGlobalLessons(data.lessons || []);

  return ok({ lessons, lists: data.lists || [] });
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
    lessons: sortLessons(body.lessons ?? []),
    lists,
  }));

  return ok({ ok: true, listCount: lists.length });
}

// ── Admin-Handlers ────────────────────────────────────────────────────────

async function adminListUsers(event) {
  const auth = await requireAdmin(event);
  if (auth.error) return auth.error;

  const users = await getIndex();
  return ok({ users });
}

async function adminGetUserData(event, username) {
  const auth = await requireAdmin(event);
  if (auth.error) return auth.error;

  const name = normalizeUsername(username);
  const raw = await store.get(userKey(name));
  if (!raw) return err(404, 'Konto nicht gefunden.');

  const user = JSON.parse(raw);
  const dataRaw = await store.get(dataKey(user.userId));
  const data = dataRaw ? JSON.parse(dataRaw) : { lessons: [], lists: [] };
  const lessons = await mergeGlobalLessons(data.lessons || []);

  return ok({
    username: user.username,
    createdAt: user.createdAt || null,
    lessons,
    lists: data.lists || [],
  });
}

async function adminDeleteUser(event, username) {
  const auth = await requireAdmin(event);
  if (auth.error) return auth.error;

  const name = normalizeUsername(username);
  if (name === ADMIN_USERNAME) {
    return err(400, 'Das Admin-Konto kann nicht gelöscht werden.');
  }

  const raw = await store.get(userKey(name));
  if (!raw) return err(404, 'Konto nicht gefunden.');

  const user = JSON.parse(raw);

  // Alle aktiven Sitzungen des Kontos ungültig machen.
  for (const token of user.tokens || []) {
    await store.delete(sessionKey(token));
  }

  await store.delete(userKey(name));
  await store.delete(dataKey(user.userId));
  await removeFromIndex(name);

  return ok({ ok: true });
}

async function adminAddLesson(event) {
  const auth = await requireAdmin(event);
  if (auth.error) return auth.error;

  const body = parseBody(event);
  const name = String(body.name || '').trim();
  const boxes = Array.isArray(body.boxes) ? body.boxes : [];

  const validationError = validateLesson(name, boxes);
  if (validationError) return err(400, validationError);

  const globals = await getGlobalLessons();
  if (globals.length >= MAX_LESSONS) {
    return err(400, `Maximal ${MAX_LESSONS} Lektionen sind erlaubt.`);
  }
  if (globals.some((l) => l.name === name)) {
    return err(409, 'Eine Lektion mit diesem Namen existiert bereits.');
  }

  const lesson = buildLesson(name, boxes);
  globals.push(lesson);
  await store.set('global_lessons', JSON.stringify(globals));

  return ok({ ok: true, lesson });
}

async function adminListLessons(event) {
  const auth = await requireAdmin(event);
  if (auth.error) return auth.error;

  return ok({ lessons: await getGlobalLessons() });
}

async function adminUpdateLesson(event, lessonId) {
  const auth = await requireAdmin(event);
  if (auth.error) return auth.error;

  const body = parseBody(event);
  const name = String(body.name || '').trim();
  const boxes = Array.isArray(body.boxes) ? body.boxes : [];

  const validationError = validateLesson(name, boxes);
  if (validationError) return err(400, validationError);

  const globals = await getGlobalLessons();
  const index = globals.findIndex((l) => l.id === lessonId);
  if (index === -1) return err(404, 'Lektion nicht gefunden.');

  const lesson = rebuildLesson(lessonId, name, boxes);
  globals[index] = lesson;
  await store.set('global_lessons', JSON.stringify(globals));

  return ok({ ok: true, lesson });
}

async function adminDeleteLesson(event, lessonId) {
  const auth = await requireAdmin(event);
  if (auth.error) return auth.error;

  const globals = await getGlobalLessons();
  const next = globals.filter((l) => l.id !== lessonId);
  if (next.length === globals.length) return err(404, 'Lektion nicht gefunden.');

  await store.set('global_lessons', JSON.stringify(next));
  return ok({ ok: true });
}

async function adminImpersonate(event, username) {
  const auth = await requireAdmin(event);
  if (auth.error) return auth.error;

  const name = normalizeUsername(username);
  const raw = await store.get(userKey(name));
  if (!raw) return err(404, 'Konto nicht gefunden.');

  const user = JSON.parse(raw);
  if (user.isAdmin) {
    return err(400, 'Das Admin-Konto kann nicht übernommen werden.');
  }

  const token = await createSession(user.username, user.userId, false);
  return ok({ token, username: user.username, isAdmin: false });
}

// ── Admin-Konto ───────────────────────────────────────────────────────────

async function ensureAdmin() {
  const key = userKey(ADMIN_USERNAME);
  const existing = await store.get(key);
  if (existing) return;

  await store.set(key, JSON.stringify({
    username: ADMIN_USERNAME,
    passwordHash: ADMIN_HASH,
    salt: ADMIN_SALT,
    userId: 'admin',
    isAdmin: true,
    createdAt: Date.now(),
    tokens: [],
  }));
}

async function requireAdmin(event) {
  const session = await getSession(event);
  if (!session) return { error: err(401, 'Nicht angemeldet.') };
  if (!session.isAdmin) return { error: err(403, 'Keine Admin-Berechtigung.') };
  return { session };
}

// ── Globale Lektionen ─────────────────────────────────────────────────────

async function getGlobalLessons() {
  const raw = await store.get('global_lessons');
  const list = raw ? JSON.parse(raw) : [];
  return Array.isArray(list) ? list : [];
}

async function mergeGlobalLessons(userLessons) {
  const globals = await getGlobalLessons();
  const list = Array.isArray(userLessons) ? userLessons : [];

  // Grundlektionen (nicht vom Admin) bleiben unverändert. Admin-Lektionen
  // werden über ihre ID aktualisiert: Änderungen/Ergänzungen des Admins
  // kommen an, gelöschte Admin-Lektionen verschwinden, der Lernfortschritt
  // bleibt anhand der Vokabel-IDs erhalten.
  const base = list.filter((l) => !String(l.id || '').startsWith('admin-'));
  const userAdmin = new Map(
    list
      .filter((l) => String(l.id || '').startsWith('admin-'))
      .map((l) => [l.id, l]),
  );

  const merged = [...base];
  for (const global of globals) {
    merged.push(mergeLessonProgress(global, userAdmin.get(global.id) || null));
  }

  return sortLessons(merged);
}

function mergeLessonProgress(globalLesson, oldLesson) {
  if (!oldLesson) return globalLesson;

  const oldVocabs = new Map();
  for (const box of oldLesson.boxes || []) {
    for (const v of box.vocabs || []) {
      oldVocabs.set(v.id, v);
    }
  }

  const boxes = (globalLesson.boxes || []).map((box) => ({
    ...box,
    vocabs: (box.vocabs || []).map((v) => {
      const old = oldVocabs.get(v.id);
      if (!old) return v;
      return { ...v, level: old.level ?? 0, history: old.history ?? [] };
    }),
  }));

  return { ...globalLesson, boxes };
}

/// Sortiert Lektionen numerisch nach der Nummer im Namen (aufsteigend).
/// Namen ohne erkennbare Nummer kommen alphabetisch ans Ende.
function sortLessons(lessons) {
  const number = (lesson) => {
    const name = String((lesson && lesson.name) || '').trim();
    const match = name.match(/^lektion\s*(\d+)/i);
    return match ? parseInt(match[1], 10) : null;
  };

  return [...lessons].sort((a, b) => {
    const na = number(a);
    const nb = number(b);
    if (na === null && nb === null) {
      return String(a.name).localeCompare(String(b.name));
    }
    if (na === null) return 1;
    if (nb === null) return -1;
    return na - nb;
  });
}

function buildLesson(name, boxes) {
  const stamp = Date.now();
  const rand = crypto.randomBytes(4).toString('hex');
  const lessonId = `admin-${stamp}-${rand}`;
  return rebuildLesson(lessonId, name, boxes);
}

/// Baut eine Lektion neu auf und erhält dabei vorhandene Vokabel-IDs
/// (damit der Lernfortschritt erhalten bleibt). Fehlende IDs werden neu
/// erzeugt.
function rebuildLesson(lessonId, name, boxes) {
  const builtBoxes = boxes.map((box, bi) => {
    const vocabs = (box.vocabs || []).map((v) => ({
      id:
        v.id ||
        `${lessonId}-b${bi + 1}-v${crypto.randomBytes(3).toString('hex')}`,
      latin: String(v.latin || '').trim(),
      german: String(v.german || '').trim(),
      middleColumn: v.middle ? String(v.middle).trim() : null,
      level: 0,
      history: [],
    }));

    return {
      id: box.id || `${lessonId}-b${bi + 1}`,
      name: String(box.name || '').trim() || `Kasten ${bi + 1}`,
      vocabs,
    };
  });

  return { id: lessonId, name, boxes: builtBoxes };
}

function validateLesson(name, boxes) {
  if (name.length < 2 || name.length > 60) {
    return 'Der Lektionsname muss 2–60 Zeichen haben.';
  }
  if (boxes.length < 1 || boxes.length > 20) {
    return 'Eine Lektion braucht 1–20 Kästen.';
  }
  for (const box of boxes) {
    const vocabs = Array.isArray(box.vocabs) ? box.vocabs : [];
    if (vocabs.length === 0) {
      return `„${box.name || 'Kasten'}" enthält keine Vokabeln.`;
    }
    for (const v of vocabs) {
      if (!String(v.latin || '').trim() || !String(v.german || '').trim()) {
        return 'Jede Vokabel braucht ein lateinisches Wort und eine Übersetzung.';
      }
    }
  }
  return null;
}

// ── Benutzer-Index ────────────────────────────────────────────────────────

async function getIndex() {
  const raw = await store.get('index_users');
  const list = raw ? JSON.parse(raw) : [];
  return Array.isArray(list) ? list : [];
}

async function addToIndex(username) {
  const index = await getIndex();
  if (!index.includes(username)) {
    index.push(username);
    await store.set('index_users', JSON.stringify(index));
  }
}

async function removeFromIndex(username) {
  const index = await getIndex();
  await store.set(
    'index_users',
    JSON.stringify(index.filter((u) => u !== username)),
  );
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

async function createSession(username, userId, isAdmin) {
  const token = crypto.randomBytes(32).toString('hex');
  await store.set(sessionKey(token), JSON.stringify({
    token,
    username,
    userId,
    isAdmin: !!isAdmin,
    expiresAt: Date.now() + SESSION_MS,
  }));

  // Token im Benutzerkonto vermerken, damit Sitzungen z. B. beim Löschen
  // eines Kontos gezielt beendet werden können.
  try {
    const raw = await store.get(userKey(username));
    if (raw) {
      const user = JSON.parse(raw);
      user.tokens = user.tokens || [];
      user.tokens.push(token);
      await store.set(userKey(username), JSON.stringify(user));
    }
  } catch (_) {
    // Nicht kritisch.
  }

  return token;
}

async function removeSessionToken(username, token) {
  try {
    const raw = await store.get(userKey(username));
    if (raw) {
      const user = JSON.parse(raw);
      user.tokens = (user.tokens || []).filter((t) => t !== token);
      await store.set(userKey(username), JSON.stringify(user));
    }
  } catch (_) {
    // Nicht kritisch.
  }
}

async function getSession(event) {
  const auth = event.headers?.authorization || event.headers?.Authorization || '';
  const token = auth.startsWith('Bearer ') ? auth.slice(7).trim() : '';
  if (!token) return null;

  const raw = await store.get(sessionKey(token));
  if (!raw) return null;

  let session;
  try {
    session = JSON.parse(raw);
  } catch (_) {
    return null;
  }

  if (session.expiresAt && session.expiresAt < Date.now()) {
    await store.delete(sessionKey(token));
    return null;
  }

  // Prüfen, dass das zugehörige Konto noch existiert (z. B. nicht vom
  // Admin gelöscht wurde).
  const userRaw = await store.get(userKey(session.username));
  if (!userRaw) {
    await store.delete(sessionKey(token));
    return null;
  }

  return session;
}
