// Lokaler Test-Server für den Vokabellerner (ohne Netlify).
//
// Start:
//   1. flutter build web
//   2. node server.js
//   3. Browser öffnen: http://localhost:8888
//
// Er bedient die gebaute Web-App aus `build/web` und stellt die komplette
// `/api`-Schnittstelle bereit. Die Daten liegen in `local-data.json`.

const http = require('http');
const fs = require('fs');
const path = require('path');
const crypto = require('crypto');

const PORT = Number(process.env.PORT || 8888);
const WEB_DIR = path.join(__dirname, 'build', 'web');
const DATA_FILE = path.join(__dirname, 'local-data.json');

const MAX_LISTS = 10;
const MAX_LESSONS = 30;
const SESSION_MS = 30 * 24 * 60 * 60 * 1000;

// Festes Admin-Konto (wie in der Netlify-Version).
const ADMIN_USERNAME = 'rafchesss';
const ADMIN_SALT = 'a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6';
const ADMIN_HASH =
  '8c4a1c36c091d721d6e522901c659ba25cc0f088ebba8e61d14307e4dbaeeb1c' +
  '503dc897bfb009fe9bb749343aa46b92a26de9e0de51121ffc5d15f3464bebce';

// ── Speicher (lokale JSON-Datei) ──────────────────────────────────────────

function loadDb() {
  try {
    return JSON.parse(fs.readFileSync(DATA_FILE, 'utf8'));
  } catch (_) {
    return {
      users: {},
      sessions: {},
      data: {},
      index: [],
      globalLessons: [],
    };
  }
}

let db = loadDb();

function saveDb() {
  fs.writeFileSync(DATA_FILE, JSON.stringify(db, null, 2));
}

// ── Hilfsfunktionen ───────────────────────────────────────────────────────

function ok(obj) {
  return { statusCode: 200, body: obj };
}

function err(statusCode, message) {
  return { statusCode, body: { error: message } };
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

function hashPassword(password, salt) {
  return crypto.scryptSync(password, salt, 64).toString('hex');
}

function verifyPassword(password, salt, expectedHex) {
  const expected = Buffer.from(expectedHex, 'hex');
  const actual = crypto.scryptSync(password, salt, 64);
  return actual.length === expected.length && crypto.timingSafeEqual(actual, expected);
}

function ensureAdmin() {
  if (db.users[ADMIN_USERNAME]) return;
  db.users[ADMIN_USERNAME] = {
    username: ADMIN_USERNAME,
    passwordHash: ADMIN_HASH,
    salt: ADMIN_SALT,
    userId: 'admin',
    isAdmin: true,
    createdAt: Date.now(),
    tokens: [],
  };
}

function createSession(username, userId, isAdmin) {
  const token = crypto.randomBytes(32).toString('hex');
  db.sessions[token] = {
    token,
    username,
    userId,
    isAdmin: !!isAdmin,
    expiresAt: Date.now() + SESSION_MS,
  };
  if (db.users[username]) {
    db.users[username].tokens = db.users[username].tokens || [];
    db.users[username].tokens.push(token);
  }
  return token;
}

function getSession(req) {
  const auth = req.headers.authorization || '';
  const token = auth.startsWith('Bearer ') ? auth.slice(7).trim() : '';
  if (!token) return null;
  const session = db.sessions[token];
  if (!session) return null;
  if (session.expiresAt && session.expiresAt < Date.now()) {
    delete db.sessions[token];
    saveDb();
    return null;
  }
  if (!db.users[session.username]) {
    delete db.sessions[token];
    saveDb();
    return null;
  }
  return session;
}

function requireAdmin(req) {
  const session = getSession(req);
  if (!session) return { error: err(401, 'Nicht angemeldet.') };
  if (!session.isAdmin) return { error: err(403, 'Keine Admin-Berechtigung.') };
  return { session };
}

// ── Lektionen ─────────────────────────────────────────────────────────────

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

function mergeGlobalLessons(userLessons) {
  const list = Array.isArray(userLessons) ? userLessons : [];
  const base = list.filter((l) => !String(l.id || '').startsWith('admin-'));
  const userAdmin = new Map(
    list
      .filter((l) => String(l.id || '').startsWith('admin-'))
      .map((l) => [l.id, l]),
  );
  const merged = [...base];
  for (const global of db.globalLessons) {
    merged.push(mergeLessonProgress(global, userAdmin.get(global.id) || null));
  }
  return sortLessons(merged);
}

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

function buildLesson(name, boxes) {
  const stamp = Date.now();
  const rand = crypto.randomBytes(4).toString('hex');
  return rebuildLesson(`admin-${stamp}-${rand}`, name, boxes);
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

// ── API-Handler ───────────────────────────────────────────────────────────

function register(body) {
  ensureAdmin();
  const username = normalizeUsername(body.username);
  const password = body.password;
  if (!isValidUsername(username)) {
    return err(400, 'Benutzername muss 2–30 Zeichen haben (Buchstaben, Zahlen, Punkt, _ oder -).');
  }
  if (username === ADMIN_USERNAME) return err(409, 'Dieser Benutzername ist bereits vergeben.');
  if (!isValidPassword(password)) return err(400, 'Das Passwort muss mindestens 6 Zeichen haben.');
  if (db.users[username]) return err(409, 'Dieser Benutzername ist bereits vergeben.');

  const salt = crypto.randomBytes(16).toString('hex');
  const userId = crypto.randomBytes(16).toString('hex');
  db.users[username] = {
    username,
    passwordHash: hashPassword(password, salt),
    salt,
    userId,
    isAdmin: false,
    createdAt: Date.now(),
    tokens: [],
  };
  if (!db.index.includes(username)) db.index.push(username);

  const token = createSession(username, userId, false);
  saveDb();
  return ok({ token, username, isAdmin: false });
}

function login(body) {
  ensureAdmin();
  const username = normalizeUsername(body.username);
  const password = body.password;
  const user = db.users[username];
  if (!user) return err(401, 'Benutzername oder Passwort ist falsch.');
  if (!verifyPassword(password, user.salt, user.passwordHash)) {
    return err(401, 'Benutzername oder Passwort ist falsch.');
  }
  const token = createSession(user.username, user.userId, !!user.isAdmin);
  saveDb();
  return ok({ token, username: user.username, isAdmin: !!user.isAdmin });
}

function logout(req) {
  const session = getSession(req);
  if (session) {
    delete db.sessions[session.token];
    const user = db.users[session.username];
    if (user) user.tokens = (user.tokens || []).filter((t) => t !== session.token);
    saveDb();
  }
  return ok({ ok: true });
}

function me(req) {
  const session = getSession(req);
  if (!session) return err(401, 'Nicht angemeldet.');
  return ok({ username: session.username, isAdmin: !!session.isAdmin });
}

function getData(req) {
  const session = getSession(req);
  if (!session) return err(401, 'Nicht angemeldet.');
  const data = db.data[session.userId] || { lessons: [], lists: [] };
  return ok({ lessons: mergeGlobalLessons(data.lessons || []), lists: data.lists || [] });
}

function putData(req, body) {
  const session = getSession(req);
  if (!session) return err(401, 'Nicht angemeldet.');
  const lists = Array.isArray(body.lists) ? body.lists : [];
  if (lists.length > MAX_LISTS) {
    return err(400, `Maximal ${MAX_LISTS} Listen sind gleichzeitig erlaubt.`);
  }
  db.data[session.userId] = { lessons: sortLessons(body.lessons || []), lists };
  saveDb();
  return ok({ ok: true, listCount: lists.length });
}

function adminListUsers(req) {
  const auth = requireAdmin(req);
  if (auth.error) return auth.error;
  return ok({ users: db.index });
}

function adminGetUserData(req, username) {
  const auth = requireAdmin(req);
  if (auth.error) return auth.error;
  const name = normalizeUsername(username);
  const user = db.users[name];
  if (!user) return err(404, 'Konto nicht gefunden.');
  const data = db.data[user.userId] || { lessons: [], lists: [] };
  return ok({
    username: user.username,
    createdAt: user.createdAt || null,
    lessons: mergeGlobalLessons(data.lessons || []),
    lists: data.lists || [],
  });
}

function adminDeleteUser(req, username) {
  const auth = requireAdmin(req);
  if (auth.error) return auth.error;
  const name = normalizeUsername(username);
  if (name === ADMIN_USERNAME) return err(400, 'Das Admin-Konto kann nicht gelöscht werden.');
  const user = db.users[name];
  if (!user) return err(404, 'Konto nicht gefunden.');

  for (const token of user.tokens || []) delete db.sessions[token];
  delete db.users[name];
  delete db.data[user.userId];
  db.index = db.index.filter((u) => u !== name);
  saveDb();
  return ok({ ok: true });
}

function adminListLessons(req) {
  const auth = requireAdmin(req);
  if (auth.error) return auth.error;
  return ok({ lessons: db.globalLessons });
}

function adminAddLesson(req, body) {
  const auth = requireAdmin(req);
  if (auth.error) return auth.error;
  const name = String(body.name || '').trim();
  const boxes = Array.isArray(body.boxes) ? body.boxes : [];
  const validationError = validateLesson(name, boxes);
  if (validationError) return err(400, validationError);
  if (db.globalLessons.length >= MAX_LESSONS) {
    return err(400, `Maximal ${MAX_LESSONS} Lektionen sind erlaubt.`);
  }
  if (db.globalLessons.some((l) => l.name === name)) {
    return err(409, 'Eine Lektion mit diesem Namen existiert bereits.');
  }
  const lesson = buildLesson(name, boxes);
  db.globalLessons.push(lesson);
  saveDb();
  return ok({ ok: true, lesson });
}

function adminUpdateLesson(req, lessonId, body) {
  const auth = requireAdmin(req);
  if (auth.error) return auth.error;
  const name = String(body.name || '').trim();
  const boxes = Array.isArray(body.boxes) ? body.boxes : [];
  const validationError = validateLesson(name, boxes);
  if (validationError) return err(400, validationError);
  const index = db.globalLessons.findIndex((l) => l.id === lessonId);
  if (index === -1) return err(404, 'Lektion nicht gefunden.');
  db.globalLessons[index] = rebuildLesson(lessonId, name, boxes);
  saveDb();
  return ok({ ok: true, lesson: db.globalLessons[index] });
}

function adminDeleteLesson(req, lessonId) {
  const auth = requireAdmin(req);
  if (auth.error) return auth.error;
  const next = db.globalLessons.filter((l) => l.id !== lessonId);
  if (next.length === db.globalLessons.length) return err(404, 'Lektion nicht gefunden.');
  db.globalLessons = next;
  saveDb();
  return ok({ ok: true });
}

function adminImpersonate(req, username) {
  const auth = requireAdmin(req);
  if (auth.error) return auth.error;
  const name = normalizeUsername(username);
  const user = db.users[name];
  if (!user) return err(404, 'Konto nicht gefunden.');
  if (user.isAdmin) return err(400, 'Das Admin-Konto kann nicht übernommen werden.');
  const token = createSession(user.username, user.userId, false);
  saveDb();
  return ok({ token, username: user.username, isAdmin: false });
}

// ── Routing ───────────────────────────────────────────────────────────────

function routeApi(req, pathname, body) {
  const method = req.method;

  if (method === 'POST' && pathname === '/api/auth/register') return register(body);
  if (method === 'POST' && pathname === '/api/auth/login') return login(body);
  if (method === 'POST' && pathname === '/api/auth/logout') return logout(req);
  if (method === 'GET' && pathname === '/api/me') return me(req);
  if (method === 'GET' && pathname === '/api/data') return getData(req);
  if (method === 'PUT' && pathname === '/api/data') return putData(req, body);

  if (method === 'GET' && pathname === '/api/admin/users') return adminListUsers(req);
  if (method === 'POST' && /^\/api\/admin\/users\/[^/]+\/impersonate$/.test(pathname)) {
    return adminImpersonate(req, pathname.split('/')[4]);
  }
  if (method === 'GET' && /^\/api\/admin\/users\/[^/]+\/data$/.test(pathname)) {
    return adminGetUserData(req, pathname.split('/')[4]);
  }
  if (method === 'DELETE' && /^\/api\/admin\/users\/[^/]+$/.test(pathname)) {
    return adminDeleteUser(req, pathname.split('/')[4]);
  }

  if (method === 'GET' && pathname === '/api/admin/lessons') return adminListLessons(req);
  if (method === 'POST' && pathname === '/api/admin/lessons') return adminAddLesson(req, body);
  if (method === 'PUT' && /^\/api\/admin\/lessons\/[^/]+$/.test(pathname)) {
    return adminUpdateLesson(req, pathname.split('/')[4], body);
  }
  if (method === 'DELETE' && /^\/api\/admin\/lessons\/[^/]+$/.test(pathname)) {
    return adminDeleteLesson(req, pathname.split('/')[4]);
  }

  return err(404, 'Nicht gefunden');
}

// ── HTTP-Server ───────────────────────────────────────────────────────────

const MIME = {
  '.html': 'text/html; charset=utf-8',
  '.js': 'text/javascript',
  '.css': 'text/css',
  '.json': 'application/json',
  '.png': 'image/png',
  '.ico': 'image/x-icon',
  '.svg': 'image/svg+xml',
  '.wasm': 'application/wasm',
  '.otf': 'font/otf',
  '.ttf': 'font/ttf',
  '.woff': 'font/woff',
  '.woff2': 'font/woff2',
  '.jpg': 'image/jpeg',
  '.jpeg': 'image/jpeg',
};

function serveStatic(res, pathname) {
  const rel = pathname === '/' ? 'index.html' : pathname.replace(/^\/+/, '');
  let filePath = path.resolve(WEB_DIR, rel);
  if (!filePath.startsWith(WEB_DIR)) filePath = path.join(WEB_DIR, 'index.html');

  fs.readFile(filePath, (err, data) => {
    if (err) {
      fs.readFile(path.join(WEB_DIR, 'index.html'), (e2, d2) => {
        if (e2) {
          res.writeHead(500, { 'Content-Type': 'text/plain' });
          res.end('Fehler: index.html nicht gefunden. Bitte zuerst `flutter build web` ausführen.');
        } else {
          res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' });
          res.end(d2);
        }
      });
    } else {
      const ext = path.extname(filePath).toLowerCase();
      res.writeHead(200, { 'Content-Type': MIME[ext] || 'application/octet-stream' });
      res.end(data);
    }
  });
}

function readBody(req) {
  return new Promise((resolve) => {
    let data = '';
    req.on('data', (c) => (data += c));
    req.on('end', () => {
      try {
        resolve(JSON.parse(data || '{}'));
      } catch (_) {
        resolve({});
      }
    });
  });
}

const server = http.createServer(async (req, res) => {
  const url = new URL(req.url, 'http://localhost');
  const pathname = decodeURIComponent(url.pathname);

  const cors = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'Content-Type, Authorization',
    'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
  };

  if (req.method === 'OPTIONS') {
    res.writeHead(204, cors);
    res.end();
    return;
  }

  if (pathname.startsWith('/api/')) {
    try {
      const body = req.method === 'GET' ? {} : await readBody(req);
      const result = routeApi(req, pathname, body);
      res.writeHead(result.statusCode, { ...cors, 'Content-Type': 'application/json; charset=utf-8' });
      res.end(JSON.stringify(result.body));
    } catch (e) {
      console.error(e);
      res.writeHead(500, { ...cors, 'Content-Type': 'application/json; charset=utf-8' });
      res.end(JSON.stringify({ error: (e && e.message) || 'Interner Serverfehler' }));
    }
  } else {
    serveStatic(res, pathname);
  }
});

server.listen(PORT, () => {
  console.log('');
  console.log('  Vokabellerner läuft lokal:');
  console.log(`  ➜  http://localhost:${PORT}`);
  console.log('');
  console.log('  Admin:   Rafchesss / WCAraf1o!!');
  console.log('  Daten:   local-data.json');
  console.log('  Beenden: Strg + C');
  console.log('');
});
