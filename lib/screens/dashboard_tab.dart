import 'package:flutter/material.dart';

import '../data/store.dart';
import '../theme/app_theme.dart';
import 'practice_lists_screen.dart';
import 'tutorial_screen.dart';

/// Dashboard-Tab: Begrüßung, Übersicht und „Lernen starten".
class DashboardTab extends StatefulWidget {
  const DashboardTab({super.key});

  @override
  State<DashboardTab> createState() => _DashboardTabState();
}

class _DashboardTabState extends State<DashboardTab> {
  Future<void> _start() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const PracticeListsScreen()),
    );
    if (mounted) setState(() {}); // Zähler aktualisieren
  }

  void _showHelp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const TutorialScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final store = Store.instance;
    final lessonCount = store.lessons.length;
    final listCount = store.practiceLists.length;
    final vocabCount = store.lessons.fold<int>(
      0,
      (sum, l) => sum + l.allVocabs.length,
    );

    final colorScheme = Theme.of(context).colorScheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [colorScheme.primary, colorScheme.tertiary],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Willkommen!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Latein-Vokabeltrainer',
                style: TextStyle(
                  color: colorScheme.onPrimary.withValues(alpha: 0.9),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 0,
          color: colorScheme.surfaceContainerHighest,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                _StatItem(
                  icon: Icons.book,
                  value: '$lessonCount',
                  label: 'Lektionen',
                ),
                _StatItem(
                  icon: Icons.list_alt,
                  value: '$listCount',
                  label: 'Übungslisten',
                ),
                _StatItem(
                  icon: Icons.style,
                  value: '$vocabCount',
                  label: 'Vokabeln',
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        FilledButton.icon(
          onPressed: _start,
          icon: const Icon(Icons.play_arrow, size: 28),
          label: const Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: Text('Lernen starten', style: TextStyle(fontSize: 18)),
          ),
        ),
        const SizedBox(height: 16),
        OutlinedButton.icon(
          onPressed: _showHelp,
          icon: const Icon(Icons.help_outline),
          label: const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text('Hilfe & Anleitung', style: TextStyle(fontSize: 16)),
          ),
        ),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatItem({required this.icon, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: colorScheme.primary),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(label, style: TextStyle(color: muted(context))),
        ],
      ),
    );
  }
}
