import 'package:flutter/material.dart';

import '../navigation.dart';
import '../widgets/changelog_button.dart';
import 'analyse_tab.dart';
import 'dashboard_tab.dart';
import 'lessons_tab.dart';
import 'settings_screen.dart';

/// Rahmen der App: unten zwischen Start, Lektionen und Analyse wechseln.
class HomeShell extends StatelessWidget {
  const HomeShell({super.key});

  static const _titles = ['Vokabeltrainer', 'Lektionen', 'Analyse'];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: shellTabIndex,
      builder: (context, index, _) => Scaffold(
        appBar: AppBar(
          title: Text(_titles[index]),
          actions: [
            const ChangelogButton(),
            IconButton(
              icon: const Icon(Icons.settings_outlined),
              tooltip: 'Einstellungen',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              ),
            ),
          ],
        ),
        // Am PC nicht über die ganze Breite ziehen.
        body: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: switch (index) {
              1 => const LessonsTab(),
              2 => const AnalyseTab(),
              _ => const DashboardTab(),
            },
          ),
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (i) => shellTabIndex.value = i,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Start',
            ),
            NavigationDestination(
              icon: Icon(Icons.menu_book_outlined),
              selectedIcon: Icon(Icons.menu_book),
              label: 'Lektionen',
            ),
            NavigationDestination(
              icon: Icon(Icons.insights_outlined),
              selectedIcon: Icon(Icons.insights),
              label: 'Analyse',
            ),
          ],
        ),
      ),
    );
  }
}
