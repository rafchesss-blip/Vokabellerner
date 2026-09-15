import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart';

/// Verwaltet den aktuell angemeldeten Benutzer (Singleton).
///
/// Token, Benutzername und Admin-Status werden lokal gespeichert, damit die
/// Anmeldung auch nach einem Neustart erhalten bleibt. Der Admin kann sich
/// zusätzlich in andere Konten „einloggen“ (Impersonation), ohne deren
/// Passwort zu kennen.
class AuthService {
  AuthService._();
  static final AuthService instance = AuthService._();

  static const _tokenKey = 'auth_token_v1';
  static const _usernameKey = 'auth_username_v1';
  static const _isAdminKey = 'auth_is_admin_v1';
  static const _adminTokenKey = 'auth_admin_token_v1';
  static const _adminUsernameKey = 'auth_admin_username_v1';

  /// Wird bei jeder Änderung hochgezählt, damit die UI den Zustand neu baut.
  final ValueNotifier<int> revision = ValueNotifier<int>(0);

  String? token;
  String? username;
  bool isAdmin = false;

  /// Gespeicherte Admin-Anmeldung, solange der Admin ein anderes Konto
  /// übernommen hat (für „Zurück zu Admin“).
  String? adminToken;
  String? adminUsername;

  bool get isLoggedIn => token != null && token!.isNotEmpty;

  bool get isImpersonating => adminToken != null && adminToken!.isNotEmpty;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString(_tokenKey);
    username = prefs.getString(_usernameKey);
    isAdmin = prefs.getBool(_isAdminKey) ?? false;
    adminToken = prefs.getString(_adminTokenKey);
    adminUsername = prefs.getString(_adminUsernameKey);
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

    if (adminToken == null) {
      await prefs.remove(_adminTokenKey);
      await prefs.remove(_adminUsernameKey);
    } else {
      await prefs.setString(_adminTokenKey, adminToken!);
      await prefs.setString(_adminUsernameKey, adminUsername ?? '');
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

  /// Übernimmt ein anderes Konto (nur durch den Admin aufrufbar).
  /// Die eigene Admin-Anmeldung wird für „Zurück zu Admin“ gemerkt.
  Future<void> impersonate(String newToken, String newUsername) async {
    adminToken = token;
    adminUsername = username;
    token = newToken;
    username = newUsername;
    isAdmin = false;
    await _persist();
  }

  /// Wechselt vom übernommenen Konto zurück zum Admin.
  Future<void> restoreAdmin() async {
    final oldImpersonated = token;
    token = adminToken;
    username = adminUsername;
    isAdmin = true;
    adminToken = null;
    adminUsername = null;
    await _persist();

    if (oldImpersonated != null && oldImpersonated.isNotEmpty) {
      try {
        await Api.logout(oldImpersonated);
      } catch (_) {
        // Session läuft serverseitig ohnehin irgendwann ab.
      }
    }
  }

  Future<void> logout() async {
    final oldToken = token;
    token = null;
    username = null;
    isAdmin = false;
    adminToken = null;
    adminUsername = null;
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
