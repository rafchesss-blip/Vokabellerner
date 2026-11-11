// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get commonCancel => 'Abbrechen';

  @override
  String get commonSave => 'Speichern';

  @override
  String get commonDelete => 'Löschen';

  @override
  String get commonEdit => 'Bearbeiten';

  @override
  String get commonNext => 'Weiter';

  @override
  String get commonBack => 'Zurück';

  @override
  String get commonDone => 'Fertig';

  @override
  String get commonOk => 'OK';

  @override
  String get commonClose => 'Schließen';

  @override
  String get commonLetsGo => 'Los geht\'s';

  @override
  String get commonSkip => 'Überspringen';

  @override
  String get commonUndo => 'Rückgängig';

  @override
  String get commonOptions => 'Optionen';

  @override
  String get commonSettings => 'Einstellungen';

  @override
  String get commonHome => 'Zur Startseite';

  @override
  String get languagePickerTitle => 'Sprache der App';

  @override
  String get languagePickerHint =>
      'Du kannst sie später in den Einstellungen ändern.';

  @override
  String get settingsLanguage => 'Sprache';

  @override
  String get languageGerman => 'Deutsch';

  @override
  String get languageEnglish => 'Englisch';

  @override
  String get languageSpanish => 'Spanisch';

  @override
  String get languageFrench => 'Französisch';

  @override
  String get languageItalian => 'Italienisch';

  @override
  String get languagePortuguese => 'Portugiesisch';

  @override
  String get languagePolish => 'Polnisch';

  @override
  String get languageTurkish => 'Türkisch';

  @override
  String get languageRussian => 'Russisch';

  @override
  String get languageChinese => 'Chinesisch';

  @override
  String get languageLatin => 'Latein';

  @override
  String vocabCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Vokabeln',
      one: '1 Vokabel',
    );
    return '$_temp0';
  }
}
