import 'package:flutter/material.dart';

import '../data/store.dart';
import '../navigation.dart';
import '../services/auth.dart';
import 'admin_screen.dart';
import 'analyse_tab.dart';
import 'dashboard_tab.dart';
import 'settings_screen.dart';

/// Rahmen der App: unten zwischen Dashboard und Analyse wechseln.
/// Für Admins gibt es zusätzlich den Bereich „Admin".
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

    shellTabIndex.value = 0;
    await AuthService.instance.logout();
    await Store.instance.resetLocal();
  }

  Future<void> _backToAdmin() async {
    shellTabIndex.value = 0;
    await AuthService.instance.restoreAdmin();
    await Store.instance.resetLocal();
    await Store.instance.pullFromCloud();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: AuthService.instance.revision,
      builder: (context, _, __) => ValueListenableBuilder<int>(
        valueListenable: shellTabIndex,
        builder: (context, index, _) {
          final auth = AuthService.instance;
          final isAdmin = auth.isAdmin;
          final isViewing = auth.isViewing;

          final destinations = <NavigationDestination>[
            const NavigationDestination(
              icon: Icon(Icons.dashboard_outlined),
              selectedIcon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            const NavigationDestination(
              icon: Icon(Icons.insights_outlined),
              selectedIcon: Icon(Icons.insights),
              label: 'Analyse',
            ),
            if (isAdmin)
              const NavigationDestination(
                icon: Icon(Icons.admin_panel_settings_outlined),
                selectedIcon: Icon(Icons.admin_panel_settings),
                label: 'Admin',
              ),
          ];

          final body = switch (index) {
            0 => const DashboardTab(),
            1 => const AnalyseTab(),
            _ => isAdmin ? const AdminScreen() : const DashboardTab(),
          };

          final title = switch (index) {
            0 => 'Dashboard',
            1 => 'Analyse',
            _ => 'Admin',
          };

          return Scaffold(
            appBar: AppBar(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  Text(
                    auth.username ?? '',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              actions: [
                if (isViewing)
                  IconButton(
                    icon: const Icon(Icons.undo),
                    tooltip: 'Zurück zu Admin',
                    onPressed: _backToAdmin,
                  ),
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
            body: body,
            bottomNavigationBar: NavigationBar(
              selectedIndex: index,
              onDestinationSelected: (i) => shellTabIndex.value = i,
              destinations: destinations,
            ),
          );
        },
      ),
    );
  }
}
