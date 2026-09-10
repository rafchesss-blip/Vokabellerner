import 'package:flutter/material.dart';

import 'data/store.dart';
import 'models/settings.dart';
import 'screens/home_shell.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Settings.instance.load();
  await Store.instance.load();
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
          home: const HomeShell(),
        );
      },
    );
  }
}
