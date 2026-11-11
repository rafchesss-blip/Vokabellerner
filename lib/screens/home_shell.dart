import 'package:flutter/material.dart';

import '../l10n/l10n.dart';
import '../navigation.dart';
import '../widgets/changelog_button.dart';
import 'analyse_tab.dart';
import 'dashboard_tab.dart';
import 'lessons_tab.dart';
import 'settings_screen.dart';

/// Rahmen der App: unten zwischen Start, Lektionen und Analyse wechseln.
class HomeShell extends StatelessWidget {
  const HomeShell({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final titles = [l.appTitle, l.homeTabLessons, l.homeTabAnalysis];
    return ValueListenableBuilder<int>(
      valueListenable: shellTabIndex,
      builder: (context, index, _) => Scaffold(
        appBar: AppBar(
          title: Text(titles[index]),
          actions: [
            const ChangelogButton(),
            IconButton(
              icon: const Icon(Icons.settings_outlined),
              tooltip: l.commonSettings,
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
          destinations: [
            NavigationDestination(
              icon: const Icon(Icons.home_outlined),
              selectedIcon: const Icon(Icons.home),
              label: l.homeTabStart,
            ),
            NavigationDestination(
              icon: const Icon(Icons.menu_book_outlined),
              selectedIcon: const Icon(Icons.menu_book),
              label: l.homeTabLessons,
            ),
            NavigationDestination(
              icon: const Icon(Icons.insights_outlined),
              selectedIcon: const Icon(Icons.insights),
              label: l.homeTabAnalysis,
            ),
          ],
        ),
      ),
    );
  }
}
