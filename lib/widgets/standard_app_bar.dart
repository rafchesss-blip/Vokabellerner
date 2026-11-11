import 'package:flutter/material.dart';

import '../l10n/l10n.dart';
import '../navigation.dart';
import '../screens/settings_screen.dart';

/// Einheitliche AppBar für alle Unterseiten:
/// links ein Home-Button (zurück zur Startseite), rechts die Einstellungen.
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
      tooltip: context.l10n.commonHome,
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
          tooltip: context.l10n.commonSettings,
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const SettingsScreen()),
          ),
        ),
    ],
  );
}
