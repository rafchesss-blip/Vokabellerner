import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/store.dart';
import 'models/settings.dart';
import 'platform/platform.dart';
import 'screens/home_shell.dart';
import 'services/notifications.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Settings.instance.load();
  await Store.instance.load();
  // Browser bitten, die Daten nicht automatisch zu löschen.
  requestPersistentStorage();
  _keepNotificationsFresh();

  runApp(const VokabeltrainerApp());
}

Timer? _rescheduleTimer;

/// Plant die Erinnerungen neu, sobald sich etwas ändert (Lernen,
/// Einstellungen, Rückkehr in die App) – gebündelt, damit nicht nach jeder
/// einzelnen Karte neu geplant wird.
void _keepNotificationsFresh() {
  if (!notificationsSupported) return;
  void schedule() {
    _rescheduleTimer?.cancel();
    _rescheduleTimer = Timer(const Duration(seconds: 2), () {
      rescheduleNotifications().catchError((_) {});
    });
  }

  Store.instance.revision.addListener(schedule);
  Settings.revision.addListener(schedule);
  // Meldet sich selbst bei der App an (keine Referenz nötig).
  AppLifecycleListener(onResume: schedule);
  schedule();
}

class VokabeltrainerApp extends StatelessWidget {
  const VokabeltrainerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: Settings.revision,
      builder: (context, _, __) {
        final s = Settings.instance;
        return MaterialApp(
          title: 'Vokabellerner',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(s.accent),
          darkTheme: AppTheme.dark(s.accent),
          themeMode: switch (s.themeMode) {
            AppThemeMode.dark => ThemeMode.dark,
            AppThemeMode.light => ThemeMode.light,
            AppThemeMode.system => ThemeMode.system,
          },
          home: const _Startup(child: HomeShell()),
        );
      },
    );
  }
}

/// Beim ersten Start der Android-App nach der Erlaubnis für
/// Benachrichtigungen fragen.
class _Startup extends StatefulWidget {
  final Widget child;

  const _Startup({required this.child});

  @override
  State<_Startup> createState() => _StartupState();
}

class _StartupState extends State<_Startup> {
  static const _askedKey = 'notifications_permission_asked';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _run());
  }

  Future<void> _run() async {
    if (notificationsSupported) {
      final prefs = await SharedPreferences.getInstance();
      if (!(prefs.getBool(_askedKey) ?? false)) {
        await prefs.setBool(_askedKey, true);
        await requestNotificationPermission();
        unawaited(rescheduleNotifications());
      }
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
