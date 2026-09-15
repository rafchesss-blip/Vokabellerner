import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart';

/// Verwaltet den aktuell angemeldeten Benutzer (Singleton).
///
/// Token, Benutzername und Admin-Status werden lokal gespeichert, damit die
/// Anmeldung auch nach einem Neustart erhalten bleibt.
class AuthService {
  AuthService._();
  static final AuthService instance = AuthService._();

  static const _tokenKey = 'auth_token_v1';
  static const _usernameKey = 'auth_username_v1';
  static const _isAdminKey = 'auth_is_admin_v1';

  /// Wird bei jeder Änderung hochgezählt, damit die UI den Zustand neu baut.
  final ValueNotifier<int> revision = ValueNotifier<int>(0);

  String? token;
  String? username;
  bool isAdmin = false;

  bool get isLoggedIn => token != null && token!.isNotEmpty;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString(_tokenKey);
    username = prefs.getString(_usernameKey);
    isAdmin = prefs.getBool(_isAdminKey) ?? false;
    revision.value++;
  }

  Future<void> _persist() async {
    final prefs = await SharedPreferences.getInstance();
    if (token == null) {
      await prefs.remove(_tokenKey);
      await prefs.remove(_usernameKey);
      await prefs.remove(_isAdminKey);
    } else {
      await prefs.setString(_tokenKey, token!);
      await prefs.setString(_usernameKey, username ?? '');
      await prefs.setBool(_isAdminKey, isAdmin);
    }
    revision.value++;
  }

  Future<void> register(String name, String password) async {
    final res = await Api.register(name, password);
    token = res['token'] as String;
    username = res['username'] as String;
    isAdmin = (res['isAdmin'] as bool?) ?? false;
    await _persist();
  }

  Future<void> login(String name, String password) async {
    final res = await Api.login(name, password);
    token = res['token'] as String;
    username = res['username'] as String;
    isAdmin = (res['isAdmin'] as bool?) ?? false;
    await _persist();
  }

  Future<void> logout() async {
    final oldToken = token;
    token = null;
    username = null;
    isAdmin = false;
    await _persist();
    if (oldToken != null && oldToken.isNotEmpty) {
      try {
        await Api.logout(oldToken);
      } catch (_) {
        // Session läuft serverseitig ohnehin irgendwann ab.
      }
    }
  }
}
