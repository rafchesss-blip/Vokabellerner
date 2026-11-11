import 'package:flutter/material.dart';

import '../models/settings.dart';
import '../theme/app_theme.dart';
import '../widgets/name_dialog.dart';
import '../widgets/standard_app_bar.dart';
import 'backup_section.dart';
import '../l10n/l10n.dart';
import 'intro_screen.dart';
import 'language_screen.dart';
import 'notifications_section.dart';
import 'privacy_screen.dart';

/// Einstellungen: Design, Sprachrichtung, Abfrage-Modus und Sicherung.
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
  late bool _askExtras = Settings.instance.askExtras;

  void _apply() {
    Settings.instance.direction = _direction;
    Settings.instance.answerMode = _mode;
    Settings.instance.themeMode = _themeMode;
    Settings.instance.accent = _accent;
    Settings.instance.askExtras = _askExtras;
    Settings.instance.save();
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    final l10n = context.l10n;

    return Scaffold(
      appBar: standardAppBar(context, l10n.commonSettings, showSettings: false),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: const Icon(Icons.language),
              title: Text(context.l10n.settingsLanguage),
              subtitle: Text(appLanguages[Settings.instance.language] ??
                  appLanguages[deviceLanguage()]!),
              trailing: const Icon(Icons.chevron_right),
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LanguageScreen()),
                );
                if (mounted) setState(() {});
              },
            ),
          ),
          Card(
            margin: EdgeInsets.zero,
            child: ListTile(
              leading: const Icon(Icons.person_outline),
              title: Text(l10n.settingsNameTitle),
              subtitle: Text(Settings.instance.userName.isEmpty
                  ? l10n.settingsNameEmpty
                  : l10n.settingsNameSaved(Settings.instance.userName)),
              trailing: const Icon(Icons.edit_outlined),
              onTap: () async {
                final name = await showNameDialog(
                  context,
                  initial: Settings.instance.userName,
                );
                if (name == null) return;
                setState(() => Settings.instance.userName = name);
                await Settings.instance.save();
              },
            ),
          ),
          const Divider(height: 32),
          Text(l10n.settingsDesignTitle, style: titleStyle),
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
          Text(l10n.settingsAccentTitle, style: titleStyle),
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
                l10n.settingsAccentHint,
                style: TextStyle(color: muted(context)),
              ),
            ),
          ),
          const Divider(height: 32),
          Text(l10n.settingsDirectionTitle, style: titleStyle),
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
          Text(l10n.settingsAnswerModeTitle, style: titleStyle),
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
          Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: SwitchListTile(
              value: _askExtras,
              onChanged: (v) => setState(() {
                _askExtras = v;
                _apply();
              }),
              title: Text(l10n.settingsAskExtrasTitle),
              subtitle: Text(l10n.settingsAskExtrasSubtitle),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                l10n.settingsFormsHint,
                style: TextStyle(color: muted(context)),
              ),
            ),
          ),
          const Divider(height: 32),
          const NotificationsSection(),
          const Divider(height: 32),
          const BackupSection(),
          const Divider(height: 32),
          Text(l10n.settingsAboutTitle, style: titleStyle),
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.waving_hand_outlined),
                  title: Text(l10n.settingsShowIntro),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const IntroScreen()),
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.lock_outline),
                  title: Text(l10n.settingsPrivacyTitle),
                  subtitle: Text(l10n.settingsPrivacySubtitle),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const PrivacyScreen()),
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.description_outlined),
                  title: Text(l10n.settingsLicensesTitle),
                  subtitle: Text(l10n.settingsLicensesSubtitle),
                  onTap: () => showLicensePage(
                    context: context,
                    applicationName: 'Vokabeltrainer',
                    applicationLegalese: l10n.settingsLicensesLegalese,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
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
