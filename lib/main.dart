import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/store.dart';
import 'l10n/l10n.dart';
import 'models/settings.dart';
import 'platform/platform.dart';
import 'screens/home_shell.dart';
import 'screens/intro_screen.dart';
import 'screens/language_screen.dart';
import 'services/notifications.dart';
import 'theme/app_theme.dart';
import 'widgets/name_dialog.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Danksagung in Einstellungen → Lizenzen.
  LicenseRegistry.addLicense(() => Stream.value(const LicenseEntryWithLineBreaks(
        ['FSRS (Free Spaced Repetition Scheduler)'],
        'Die Formeln und Standard-Parameter der Wiederholungsplanung stammen '
        'aus FSRS von Open Spaced Repetition '
        '(https://github.com/open-spaced-repetition), veröffentlicht unter '
        'der MIT-Lizenz. Die Umsetzung in dieser App ist eigener Code.',
      )));
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
          onGenerateTitle: (context) => context.l10n.appTitle,
          debugShowCheckedModeBanner: false,
          locale: Locale(appLanguageCode),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
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

/// Beim ersten Start: Sprache, Einführung, Name (optional), dann die
/// Erlaubnis für Benachrichtigungen.
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
    final settings = Settings.instance;
    if (settings.language.isEmpty) {
      await Navigator.push(
        context,
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => const LanguageScreen(firstStart: true),
        ),
      );
      if (!mounted) return;
    }
    if (!settings.introSeen) {
      await Navigator.push(
        context,
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => const IntroScreen(),
        ),
      );
      settings.introSeen = true;
      await settings.save();
      if (!mounted) return;
    }
    if (!settings.nameAsked) {
      final name = await showNameDialog(context, firstStart: true);
      settings
        ..userName = name ?? ''
        ..nameAsked = true;
      await settings.save();
    }
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
