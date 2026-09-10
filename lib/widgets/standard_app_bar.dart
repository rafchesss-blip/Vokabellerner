import 'package:flutter/material.dart';

import '../navigation.dart';
import '../screens/settings_screen.dart';

/// Einheitliche AppBar für alle Unterseiten:
/// links ein Home-Button (zurück zum Dashboard), rechts die Einstellungen.
AppBar standardAppBar(
  BuildContext context,
  String title, {
  List<Widget>? actions,
  bool showSettings = true,
}) {
  return AppBar(
    title: Text(title),
    leading: IconButton(
      icon: const Icon(Icons.home_outlined),
      tooltip: 'Zum Dashboard',
      onPressed: () {
        shellTabIndex.value = 0;
        Navigator.of(context).popUntil((route) => route.isFirst);
      },
    ),
    actions: [
      if (actions != null) ...actions,
      if (showSettings)
        IconButton(
          icon: const Icon(Icons.settings_outlined),
          tooltip: 'Einstellungen',
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const SettingsScreen()),
          ),
        ),
    ],
  );
}
