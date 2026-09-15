import 'package:flutter/material.dart';

import 'data/store.dart';
import 'models/settings.dart';
import 'screens/auth_screen.dart';
import 'screens/home_shell.dart';
import 'services/auth.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Settings.instance.load();
  await AuthService.instance.load();
  await Store.instance.load();

  if (AuthService.instance.isLoggedIn) {
    await Store.instance.pullFromCloud();
  }

  runApp(const VokabeltrainerApp());
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
          title: 'Latein-Vokabeltrainer',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(s.accent),
          darkTheme: AppTheme.dark(s.accent),
          themeMode: switch (s.themeMode) {
            AppThemeMode.dark => ThemeMode.dark,
            AppThemeMode.light => ThemeMode.light,
            AppThemeMode.system => ThemeMode.system,
          },
          home: ValueListenableBuilder<int>(
            valueListenable: AuthService.instance.revision,
            builder: (context, _, __) => AuthService.instance.isLoggedIn
                ? const HomeShell()
                : const AuthScreen(),
          ),
        );
      },
    );
  }
}
