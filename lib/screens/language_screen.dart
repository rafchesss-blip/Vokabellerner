import 'package:flutter/material.dart';

import '../l10n/l10n.dart';
import '../models/settings.dart';

/// Sprache der App wählen – beim ersten Start und in den Einstellungen.
class LanguageScreen extends StatelessWidget {
  /// Beim ersten Start ohne Zurück-Knopf.
  final bool firstStart;

  const LanguageScreen({super.key, this.firstStart = false});

  Future<void> _choose(BuildContext context, String code) async {
    final settings = Settings.instance;
    settings.language = code;
    setAppLanguage(code);
    await settings.save();
    if (context.mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final current = Settings.instance.language.isEmpty
        ? deviceLanguage()
        : Settings.instance.language;

    return PopScope(
      canPop: !firstStart,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: !firstStart,
          title: Text(context.l10n.languagePickerTitle),
        ),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          children: [
            const Center(child: Text('🌍', style: TextStyle(fontSize: 56))),
            const SizedBox(height: 8),
            for (final entry in appLanguages.entries)
              if (AppLocalizations.supportedLocales
                  .any((l) => l.languageCode == entry.key))
              Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  title: Text(
                    entry.value,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: entry.key == current
                      ? Icon(Icons.check_circle,
                          color: Theme.of(context).colorScheme.primary)
                      : null,
                  onTap: () => _choose(context, entry.key),
                ),
              ),
            const SizedBox(height: 8),
            Text(
              context.l10n.languagePickerHint,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
