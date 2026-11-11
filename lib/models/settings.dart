import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../l10n/l10n.dart';

/// Erscheinungsbild der App (Dark/Light/System).
enum AppThemeMode { dark, light, system }

/// Auswählbare Neon-Akzentfarbe für das Design.
enum NeonAccent { violet, cyan, emerald, orange, pink }

extension AppThemeModeX on AppThemeMode {
  String get label => switch (this) {
        AppThemeMode.dark => L.settingsThemeDark,
        AppThemeMode.light => L.settingsThemeLight,
        AppThemeMode.system => L.settingsThemeSystem,
      };

  String get description => switch (this) {
        AppThemeMode.dark => L.settingsThemeDarkDesc,
        AppThemeMode.light => L.settingsThemeLightDesc,
        AppThemeMode.system => L.settingsThemeSystemDesc,
      };
}

extension NeonAccentX on NeonAccent {
  String get label => switch (this) {
        NeonAccent.violet => L.settingsAccentViolet,
        NeonAccent.cyan => L.settingsAccentCyan,
        NeonAccent.emerald => L.settingsAccentEmerald,
        NeonAccent.orange => L.settingsAccentOrange,
        NeonAccent.pink => L.settingsAccentPink,
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
        LanguageDirection.latinToGerman => L.settingsDirectionForward,
        LanguageDirection.germanToLatin => L.settingsDirectionBackward,
      };

  String get description => switch (this) {
        LanguageDirection.latinToGerman => L.settingsDirectionForwardDesc,
        LanguageDirection.germanToLatin => L.settingsDirectionBackwardDesc,
      };
}

extension AnswerModeX on AnswerMode {
  String label(LanguageDirection direction) => switch (this) {
        AnswerMode.translationOnly =>
          direction == LanguageDirection.latinToGerman
              ? L.settingsAnswerTranslationOnly
              : L.settingsAnswerWordOnly,
        AnswerMode.middleOnly => L.settingsAnswerFormsOnly,
        AnswerMode.both => L.settingsAnswerBoth,
      };

  String description(LanguageDirection direction) {
    final forward = direction == LanguageDirection.latinToGerman;
    return switch (this) {
      AnswerMode.translationOnly => forward
          ? L.settingsAnswerTranslationOnlyDesc
          : L.settingsAnswerWordOnlyDesc,
      AnswerMode.middleOnly => L.settingsAnswerFormsOnlyDesc,
      AnswerMode.both => forward
          ? L.settingsAnswerBothTranslationDesc
          : L.settingsAnswerBothWordDesc,
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

  /// Sprache der App (z. B. „de"); leer = noch nicht gewählt (dann die
  /// Sprache des Geräts).
  String language = '';

  /// Name für Begrüßung und Erinnerungen (optional, nur auf dem Gerät).
  String userName = '';

  /// Ob die Einführung beim ersten Start schon gezeigt wurde.
  bool introSeen = false;

  /// Ob beim ersten Start schon nach dem Namen gefragt wurde.
  bool nameAsked = false;

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
    userName = prefs.getString('userName') ?? '';
    language = prefs.getString('language') ?? '';
    setAppLanguage(language.isEmpty ? deviceLanguage() : language);
    nameAsked = prefs.getBool('nameAsked') ?? false;
    introSeen = prefs.getBool('introSeen') ?? false;
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
    await prefs.setString('userName', userName);
    await prefs.setString('language', language);
    await prefs.setBool('nameAsked', nameAsked);
    await prefs.setBool('introSeen', introSeen);
    await prefs.setBool('notificationsEnabled', notificationsEnabled);
    await prefs.setInt('notificationsPerDay', notificationsPerDay);
    revision.value++;
  }
}
