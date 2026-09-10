import 'package:flutter/material.dart';

import '../navigation.dart';
import 'analyse_tab.dart';
import 'dashboard_tab.dart';
import 'settings_screen.dart';

/// Rahmen der App: unten zwischen Dashboard und Analyse wechseln.
class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  void _openSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const SettingsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: shellTabIndex,
      builder: (context, index, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text(index == 0 ? 'Dashboard' : 'Analyse'),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings_outlined),
                tooltip: 'Einstellungen',
                onPressed: _openSettings,
              ),
            ],
          ),
          body: index == 0 ? const DashboardTab() : const AnalyseTab(),
          bottomNavigationBar: NavigationBar(
            selectedIndex: index,
            onDestinationSelected: (i) => shellTabIndex.value = i,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.dashboard_outlined),
                selectedIcon: Icon(Icons.dashboard),
                label: 'Dashboard',
              ),
              NavigationDestination(
                icon: Icon(Icons.insights_outlined),
                selectedIcon: Icon(Icons.insights),
                label: 'Analyse',
              ),
            ],
          ),
        );
      },
    );
  }
}
