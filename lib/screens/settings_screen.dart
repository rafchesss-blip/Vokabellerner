import 'package:flutter/material.dart';

import '../models/settings.dart';
import '../theme/app_theme.dart';
import '../widgets/standard_app_bar.dart';

/// Einstellungen: Sprachrichtung und Abfrage-Modus (mittlere Spalte).
///
/// Änderungen werden sofort übernommen und gespeichert.
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late LanguageDirection _direction = Settings.instance.direction;
  late AnswerMode _mode = Settings.instance.answerMode;
  late AppThemeMode _themeMode = Settings.instance.themeMode;
  late NeonAccent _accent = Settings.instance.accent;

  void _apply() {
    Settings.instance.direction = _direction;
    Settings.instance.answerMode = _mode;
    Settings.instance.themeMode = _themeMode;
    Settings.instance.accent = _accent;
    Settings.instance.save();
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return Scaffold(
      appBar: standardAppBar(context, 'Einstellungen', showSettings: false),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Design', style: titleStyle),
          const SizedBox(height: 8),
          for (final mode in AppThemeMode.values)
            _optionTile(
              title: mode.label,
              subtitle: mode.description,
              selected: _themeMode == mode,
              onTap: () => setState(() {
                _themeMode = mode;
                _apply();
              }),
            ),
          const Divider(height: 32),
          Text('Akzentfarbe (Neon)', style: titleStyle),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              for (final accent in NeonAccent.values) _accentDot(accent),
            ],
          ),
          const SizedBox(height: 12),
          Card(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                'Die Akzentfarbe gilt für Buttons, Schalter und '
                'Hervorhebungen. Im Dark Mode leuchten die Farben, im '
                'Light Mode werden sie automatisch etwas abgedunkelt, '
                'damit alles gut lesbar bleibt.',
                style: TextStyle(color: muted(context)),
              ),
            ),
          ),
          const Divider(height: 32),
          Text('Sprachrichtung', style: titleStyle),
          const SizedBox(height: 8),
          _optionTile(
            title: LanguageDirection.latinToGerman.label,
            subtitle: LanguageDirection.latinToGerman.description,
            selected: _direction == LanguageDirection.latinToGerman,
            onTap: () => setState(() {
              _direction = LanguageDirection.latinToGerman;
              _apply();
            }),
          ),
          _optionTile(
            title: LanguageDirection.germanToLatin.label,
            subtitle: LanguageDirection.germanToLatin.description,
            selected: _direction == LanguageDirection.germanToLatin,
            onTap: () => setState(() {
              _direction = LanguageDirection.germanToLatin;
              _apply();
            }),
          ),
          const Divider(height: 32),
          Text('Abfrage-Modus im Test', style: titleStyle),
          const SizedBox(height: 8),
          for (final mode in AnswerMode.values)
            _optionTile(
              title: mode.label(_direction),
              subtitle: mode.description(_direction),
              selected: _mode == mode,
              onTap: () => setState(() {
                _mode = mode;
                _apply();
              }),
            ),
          const SizedBox(height: 16),
          Card(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                'Die mittlere Spalte enthält die Formen des lateinischen '
                'Wortes (z. B. Genitiv oder Stammformen). Hat eine Vokabel '
                'keine mittlere Spalte, wird automatisch nur die Übersetzung '
                'abgefragt. Der Abfrage-Modus gilt für den Test-Modus.',
                style: TextStyle(color: muted(context)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _accentDot(NeonAccent accent) {
    final selected = _accent == accent;
    final color = neonColor(accent);
    final onSurface = Theme.of(context).colorScheme.onSurface;

    return GestureDetector(
      onTap: () => setState(() {
        _accent = accent;
        _apply();
      }),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(
                color: selected ? onSurface : Colors.transparent,
                width: selected ? 3 : 0,
              ),
              boxShadow: selected
                  ? [
                      BoxShadow(
                        color: color.withValues(alpha: 0.6),
                        blurRadius: 14,
                      ),
                    ]
                  : null,
            ),
            child: selected
                ? const Icon(Icons.check, color: Color(0xFF0A0A0F), size: 24)
                : null,
          ),
          const SizedBox(height: 6),
          Text(
            accent.label,
            style: TextStyle(
              fontSize: 12,
              color: onSurface.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _optionTile({
    required String title,
    required String subtitle,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(
          selected ? Icons.radio_button_checked : Icons.radio_button_off,
          color: selected ? Theme.of(context).colorScheme.primary : null,
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        selected: selected,
        onTap: onTap,
      ),
    );
  }
}
