import 'dart:convert';

import 'package:http/http.dart' as http;

/// Basis-URL der Backend-API.
///
/// Im Web reicht die relative URL `/api`, da die App und die Funktionen auf
/// derselben Netlify-Domain laufen. Für die Android-APK muss beim Bauen eine
/// absolute URL mitgegeben werden, z. B.:
///
///   flutter build apk --dart-define=API_BASE_URL=https://deine-app.netlify.app/api
const String apiBaseUrl =
    String.fromEnvironment('API_BASE_URL', defaultValue: '/api');

/// Fehler der API (mit einer für Nutzer verständlichen Meldung).
class ApiException implements Exception {
  final String message;

  ApiException(this.message);

  @override
  String toString() => message;
}

/// Schlanker HTTP-Client für die Vokabellerner-API.
class Api {
  static Uri _uri(String path) => Uri.parse('$apiBaseUrl$path');

  static Map<String, String> _headers(String? token) => {
        'Content-Type': 'application/json',
        if (token != null && token.isNotEmpty)
          'Authorization': 'Bearer $token',
      };

  static Map<String, dynamic> _decode(http.Response res) {
    final Map<String, dynamic> body = res.body.isEmpty
        ? <String, dynamic>{}
        : jsonDecode(res.body) as Map<String, dynamic>;

    if (res.statusCode >= 200 && res.statusCode < 300) return body;

    throw ApiException(
      (body['error'] as String?) ?? 'Fehler (${res.statusCode})',
    );
  }

  static Future<Map<String, dynamic>> register(
    String username,
    String password,
  ) async {
    final res = await http.post(
      _uri('/auth/register'),
      headers: _headers(null),
      body: jsonEncode({'username': username, 'password': password}),
    );
    return _decode(res);
  }

  static Future<Map<String, dynamic>> login(
    String username,
    String password,
  ) async {
    final res = await http.post(
      _uri('/auth/login'),
      headers: _headers(null),
      body: jsonEncode({'username': username, 'password': password}),
    );
    return _decode(res);
  }

  static Future<void> logout(String token) async {
    await http.post(_uri('/auth/logout'), headers: _headers(token));
  }

  static Future<Map<String, dynamic>> getData(String token) async {
    final res = await http.get(_uri('/data'), headers: _headers(token));
    return _decode(res);
  }

  static Future<void> putData(
    String token,
    Map<String, dynamic> data,
  ) async {
    final res = await http.put(
      _uri('/data'),
      headers: _headers(token),
      body: jsonEncode(data),
    );
    _decode(res);
  }

  // ── Admin ──────────────────────────────────────────────────────────────

  static Future<List<String>> adminListUsers(String token) async {
    final res = await http.get(_uri('/admin/users'), headers: _headers(token));
    final body = _decode(res);
    return (body['users'] as List? ?? []).map((e) => e as String).toList();
  }

  static Future<Map<String, dynamic>> adminGetUserData(
    String token,
    String username,
  ) async {
    final res = await http.get(
      _uri('/admin/users/${Uri.encodeComponent(username)}/data'),
      headers: _headers(token),
    );
    return _decode(res);
  }

  static Future<void> adminDeleteUser(String token, String username) async {
    final res = await http.delete(
      _uri('/admin/users/${Uri.encodeComponent(username)}'),
      headers: _headers(token),
    );
    _decode(res);
  }

  static Future<void> adminAddLesson(
    String token,
    Map<String, dynamic> lesson,
  ) async {
    final res = await http.post(
      _uri('/admin/lessons'),
      headers: _headers(token),
      body: jsonEncode(lesson),
    );
    _decode(res);
  }

  static Future<List<Map<String, dynamic>>> adminListLessons(
    String token,
  ) async {
    final res = await http.get(_uri('/admin/lessons'), headers: _headers(token));
    final body = _decode(res);
    return (body['lessons'] as List? ?? [])
        .map((e) => (e as Map).cast<String, dynamic>())
        .toList();
  }

  static Future<void> adminUpdateLesson(
    String token,
    String lessonId,
    Map<String, dynamic> lesson,
  ) async {
    final res = await http.put(
      _uri('/admin/lessons/${Uri.encodeComponent(lessonId)}'),
      headers: _headers(token),
      body: jsonEncode(lesson),
    );
    _decode(res);
  }

  static Future<void> adminDeleteLesson(
    String token,
    String lessonId,
  ) async {
    final res = await http.delete(
      _uri('/admin/lessons/${Uri.encodeComponent(lessonId)}'),
      headers: _headers(token),
    );
    _decode(res);
  }
}
