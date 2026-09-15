import 'package:flutter/material.dart';

import '../data/store.dart';
import '../navigation.dart';
import '../services/auth.dart';
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

  Future<void> _logout() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Abmelden?'),
        content: const Text(
          'Deine Daten bleiben in deinem Konto gespeichert und sind beim '
          'nächsten Anmelden wieder da.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Abbrechen'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Abmelden'),
          ),
        ],
      ),
    );

    if (confirmed != true || !mounted) return;

    await AuthService.instance.logout();
    await Store.instance.resetLocal();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: shellTabIndex,
      builder: (context, index, _) {
        return Scaffold(
          appBar: AppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(index == 0 ? 'Dashboard' : 'Analyse'),
                Text(
                  AuthService.instance.username ?? '',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings_outlined),
                tooltip: 'Einstellungen',
                onPressed: _openSettings,
              ),
              IconButton(
                icon: const Icon(Icons.logout),
                tooltip: 'Abmelden',
                onPressed: _logout,
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
