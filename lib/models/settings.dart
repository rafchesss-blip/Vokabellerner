import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Erscheinungsbild der App (Dark/Light/System).
enum AppThemeMode { dark, light, system }

/// Auswählbare Neon-Akzentfarbe für das Design.
enum NeonAccent { violet, cyan, emerald, orange, pink }

extension AppThemeModeX on AppThemeMode {
  String get label => switch (this) {
        AppThemeMode.dark => 'Dark Mode',
        AppThemeMode.light => 'Light Mode',
        AppThemeMode.system => 'System (automatisch)',
      };

  String get description => switch (this) {
        AppThemeMode.dark =>
          'Dunkler Hintergrund mit leuchtenden Neon-Farben.',
        AppThemeMode.light =>
          'Helles, minimalistisches Design mit Weiß- und Hellgrautönen.',
        AppThemeMode.system =>
          'Richtet sich nach der Einstellung deines Geräts.',
      };
}

extension NeonAccentX on NeonAccent {
  String get label => switch (this) {
        NeonAccent.violet => 'Neon-Violett',
        NeonAccent.cyan => 'Neon-Cyan',
        NeonAccent.emerald => 'Neon-Smaragd',
        NeonAccent.orange => 'Neon-Orange',
        NeonAccent.pink => 'Neon-Pink',
      };
}

/// Sprachrichtung der Abfrage.
///
/// [latinToGerman] (normal):
///   Die App zeigt das lateinische Wort, geantwortet werden die mittlere
///   Spalte und/oder die deutsche Übersetzung.
///
/// [germanToLatin]:
///   Die App zeigt das deutsche Wort, geantwortet werden die mittlere
///   Spalte und/oder das lateinische Wort.
enum LanguageDirection { latinToGerman, germanToLatin }

/// Was im Test eingegeben werden muss.
///
/// [translationOnly]  nur die Übersetzung (deutsch bzw. lateinisch)
/// [middleOnly]       nur die mittlere Spalte (Formen)
/// [both]             Übersetzung und mittlere Spalte
enum AnswerMode { translationOnly, middleOnly, both }

extension LanguageDirectionX on LanguageDirection {
  String get label => switch (this) {
        LanguageDirection.latinToGerman => 'Latein → Deutsch',
        LanguageDirection.germanToLatin => 'Deutsch → Latein',
      };

  String get description => switch (this) {
        LanguageDirection.latinToGerman =>
          'Die App zeigt das lateinische Wort, du antwortest die Bedeutung.',
        LanguageDirection.germanToLatin =>
          'Die App zeigt das deutsche Wort, du antwortest lateinisch.',
      };

  /// Das Wort, das in dieser Richtung die „Übersetzung" ist.
  String get translationWord => switch (this) {
        LanguageDirection.latinToGerman => 'deutsche Wort',
        LanguageDirection.germanToLatin => 'lateinische Wort',
      };
}

extension AnswerModeX on AnswerMode {
  String label(LanguageDirection direction) => switch (this) {
        AnswerMode.translationOnly =>
          direction == LanguageDirection.latinToGerman
              ? 'Nur deutsches Wort'
              : 'Nur lateinisches Wort',
        AnswerMode.middleOnly => 'Nur mittlere Spalte',
        AnswerMode.both => 'Beides',
      };

  String description(LanguageDirection direction) {
    final word = direction.translationWord;
    return switch (this) {
      AnswerMode.translationOnly => 'Du antwortest nur das $word.',
      AnswerMode.middleOnly =>
        'Du antwortest nur die Formen aus der mittleren Spalte.',
      AnswerMode.both => 'Du antwortest das $word und die mittlere Spalte.',
    };
  }
}

/// Globale Einstellungen (Singleton). Werden beim Start geladen und bei
/// jeder Änderung gespeichert.
class Settings {
  Settings._();
  static final Settings instance = Settings._();

  /// Wird bei jeder Änderung hochgezählt, damit die App das Theme neu baut.
  static final ValueNotifier<int> revision = ValueNotifier<int>(0);

  LanguageDirection direction = LanguageDirection.latinToGerman;
  AnswerMode answerMode = AnswerMode.both;
  AppThemeMode themeMode = AppThemeMode.dark;
  NeonAccent accent = NeonAccent.violet;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();

    direction =
        prefs.getString('direction') == LanguageDirection.germanToLatin.name
            ? LanguageDirection.germanToLatin
            : LanguageDirection.latinToGerman;

    answerMode = AnswerMode.values.firstWhere(
      (m) => m.name == prefs.getString('answerMode'),
      orElse: () => AnswerMode.both,
    );

    themeMode = AppThemeMode.values.firstWhere(
      (m) => m.name == prefs.getString('themeMode'),
      orElse: () => AppThemeMode.dark,
    );

    accent = NeonAccent.values.firstWhere(
      (a) => a.name == prefs.getString('accent'),
      orElse: () => NeonAccent.violet,
    );
  }

  Future<void> save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('direction', direction.name);
    await prefs.setString('answerMode', answerMode.name);
    await prefs.setString('themeMode', themeMode.name);
    await prefs.setString('accent', accent.name);
    revision.value++;
  }
}
