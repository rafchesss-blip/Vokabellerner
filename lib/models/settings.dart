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
///   Die App zeigt das Wort, geantwortet werden die Formen und/oder die
///   Übersetzung.
///
/// [germanToLatin]:
///   Die App zeigt die Übersetzung, geantwortet werden die Formen und/oder
///   das Wort. (Die Namen stammen aus der Latein-Version.)
enum LanguageDirection { latinToGerman, germanToLatin }

/// Was im Test eingegeben werden muss.
///
/// [translationOnly]  nur die Übersetzung (bzw. das Wort)
/// [middleOnly]       nur die Formen
/// [both]             Übersetzung und Formen
enum AnswerMode { translationOnly, middleOnly, both }

extension LanguageDirectionX on LanguageDirection {
  String get label => switch (this) {
        LanguageDirection.latinToGerman => 'Wort → Übersetzung',
        LanguageDirection.germanToLatin => 'Übersetzung → Wort',
      };

  String get description => switch (this) {
        LanguageDirection.latinToGerman =>
          'Die App zeigt das Wort, du antwortest die Bedeutung.',
        LanguageDirection.germanToLatin =>
          'Die App zeigt die Übersetzung, du antwortest das Wort.',
      };

  /// Was in dieser Richtung geantwortet wird.
  String get translationWord => switch (this) {
        LanguageDirection.latinToGerman => 'die Übersetzung',
        LanguageDirection.germanToLatin => 'das Wort',
      };
}

extension AnswerModeX on AnswerMode {
  String label(LanguageDirection direction) => switch (this) {
        AnswerMode.translationOnly =>
          direction == LanguageDirection.latinToGerman
              ? 'Nur Übersetzung'
              : 'Nur Wort',
        AnswerMode.middleOnly => 'Nur Formen',
        AnswerMode.both => 'Beides',
      };

  String description(LanguageDirection direction) {
    final word = direction.translationWord;
    return switch (this) {
      AnswerMode.translationOnly => 'Du antwortest nur $word.',
      AnswerMode.middleOnly => 'Du antwortest nur die Formen.',
      AnswerMode.both => 'Du antwortest $word und die Formen.',
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

  /// Im Test auch die „Sonstiges"-Felder abfragen.
  bool askExtras = false;

  /// Lern-Erinnerungen (nur Android-App).
  bool notificationsEnabled = true;

  /// Wie oft pro Tag erinnert wird (1–3).
  int notificationsPerDay = 3;

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

    askExtras = prefs.getBool('askExtras') ?? false;
    notificationsEnabled = prefs.getBool('notificationsEnabled') ?? true;
    notificationsPerDay =
        (prefs.getInt('notificationsPerDay') ?? 3).clamp(1, 3).toInt();
  }

  Future<void> save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('direction', direction.name);
    await prefs.setString('answerMode', answerMode.name);
    await prefs.setString('themeMode', themeMode.name);
    await prefs.setString('accent', accent.name);
    await prefs.setBool('askExtras', askExtras);
    await prefs.setBool('notificationsEnabled', notificationsEnabled);
    await prefs.setInt('notificationsPerDay', notificationsPerDay);
    revision.value++;
  }
}
