import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('de')];

  /// No description provided for @commonCancel.
  ///
  /// In de, this message translates to:
  /// **'Abbrechen'**
  String get commonCancel;

  /// No description provided for @commonSave.
  ///
  /// In de, this message translates to:
  /// **'Speichern'**
  String get commonSave;

  /// No description provided for @commonDelete.
  ///
  /// In de, this message translates to:
  /// **'Löschen'**
  String get commonDelete;

  /// No description provided for @commonEdit.
  ///
  /// In de, this message translates to:
  /// **'Bearbeiten'**
  String get commonEdit;

  /// No description provided for @commonNext.
  ///
  /// In de, this message translates to:
  /// **'Weiter'**
  String get commonNext;

  /// No description provided for @commonBack.
  ///
  /// In de, this message translates to:
  /// **'Zurück'**
  String get commonBack;

  /// No description provided for @commonDone.
  ///
  /// In de, this message translates to:
  /// **'Fertig'**
  String get commonDone;

  /// No description provided for @commonOk.
  ///
  /// In de, this message translates to:
  /// **'OK'**
  String get commonOk;

  /// No description provided for @commonClose.
  ///
  /// In de, this message translates to:
  /// **'Schließen'**
  String get commonClose;

  /// No description provided for @commonLetsGo.
  ///
  /// In de, this message translates to:
  /// **'Los geht\'s'**
  String get commonLetsGo;

  /// No description provided for @commonSkip.
  ///
  /// In de, this message translates to:
  /// **'Überspringen'**
  String get commonSkip;

  /// No description provided for @commonUndo.
  ///
  /// In de, this message translates to:
  /// **'Rückgängig'**
  String get commonUndo;

  /// No description provided for @commonOptions.
  ///
  /// In de, this message translates to:
  /// **'Optionen'**
  String get commonOptions;

  /// No description provided for @commonSettings.
  ///
  /// In de, this message translates to:
  /// **'Einstellungen'**
  String get commonSettings;

  /// No description provided for @commonHome.
  ///
  /// In de, this message translates to:
  /// **'Zur Startseite'**
  String get commonHome;

  /// Überschrift der Sprachauswahl (erster Start und Einstellungen).
  ///
  /// In de, this message translates to:
  /// **'Sprache der App'**
  String get languagePickerTitle;

  /// No description provided for @languagePickerHint.
  ///
  /// In de, this message translates to:
  /// **'Du kannst sie später in den Einstellungen ändern.'**
  String get languagePickerHint;

  /// No description provided for @settingsLanguage.
  ///
  /// In de, this message translates to:
  /// **'Sprache'**
  String get settingsLanguage;

  /// Name der Sprache Deutsch in der App-Sprache, z. B. für die Sprache einer Lektion.
  ///
  /// In de, this message translates to:
  /// **'Deutsch'**
  String get languageGerman;

  /// No description provided for @languageEnglish.
  ///
  /// In de, this message translates to:
  /// **'Englisch'**
  String get languageEnglish;

  /// No description provided for @languageSpanish.
  ///
  /// In de, this message translates to:
  /// **'Spanisch'**
  String get languageSpanish;

  /// No description provided for @languageFrench.
  ///
  /// In de, this message translates to:
  /// **'Französisch'**
  String get languageFrench;

  /// No description provided for @languageItalian.
  ///
  /// In de, this message translates to:
  /// **'Italienisch'**
  String get languageItalian;

  /// No description provided for @languagePortuguese.
  ///
  /// In de, this message translates to:
  /// **'Portugiesisch'**
  String get languagePortuguese;

  /// No description provided for @languagePolish.
  ///
  /// In de, this message translates to:
  /// **'Polnisch'**
  String get languagePolish;

  /// No description provided for @languageTurkish.
  ///
  /// In de, this message translates to:
  /// **'Türkisch'**
  String get languageTurkish;

  /// No description provided for @languageRussian.
  ///
  /// In de, this message translates to:
  /// **'Russisch'**
  String get languageRussian;

  /// No description provided for @languageChinese.
  ///
  /// In de, this message translates to:
  /// **'Chinesisch'**
  String get languageChinese;

  /// No description provided for @languageLatin.
  ///
  /// In de, this message translates to:
  /// **'Latein'**
  String get languageLatin;

  /// No description provided for @vocabCount.
  ///
  /// In de, this message translates to:
  /// **'{count, plural, =1{1 Vokabel} other{{count} Vokabeln}}'**
  String vocabCount(int count);

  /// Theme option: dark design.
  ///
  /// In de, this message translates to:
  /// **'Dark Mode'**
  String get settingsThemeDark;

  /// Theme option: light design.
  ///
  /// In de, this message translates to:
  /// **'Light Mode'**
  String get settingsThemeLight;

  /// Theme option: follow the device setting.
  ///
  /// In de, this message translates to:
  /// **'System (automatisch)'**
  String get settingsThemeSystem;

  /// Description of the dark theme option.
  ///
  /// In de, this message translates to:
  /// **'Dunkler Hintergrund mit leuchtenden Neon-Farben.'**
  String get settingsThemeDarkDesc;

  /// Description of the light theme option.
  ///
  /// In de, this message translates to:
  /// **'Helles, minimalistisches Design mit Weiß- und Hellgrautönen.'**
  String get settingsThemeLightDesc;

  /// Description of the system theme option.
  ///
  /// In de, this message translates to:
  /// **'Richtet sich nach der Einstellung deines Geräts.'**
  String get settingsThemeSystemDesc;

  /// Name of an accent color (shown under a color dot).
  ///
  /// In de, this message translates to:
  /// **'Neon-Violett'**
  String get settingsAccentViolet;

  /// Name of an accent color.
  ///
  /// In de, this message translates to:
  /// **'Neon-Cyan'**
  String get settingsAccentCyan;

  /// Name of an accent color (emerald green).
  ///
  /// In de, this message translates to:
  /// **'Neon-Smaragd'**
  String get settingsAccentEmerald;

  /// Name of an accent color.
  ///
  /// In de, this message translates to:
  /// **'Neon-Orange'**
  String get settingsAccentOrange;

  /// Name of an accent color.
  ///
  /// In de, this message translates to:
  /// **'Neon-Pink'**
  String get settingsAccentPink;

  /// Quiz direction: the app shows the foreign word, the user answers the translation.
  ///
  /// In de, this message translates to:
  /// **'Wort → Übersetzung'**
  String get settingsDirectionForward;

  /// Quiz direction: the app shows the translation, the user answers the foreign word.
  ///
  /// In de, this message translates to:
  /// **'Übersetzung → Wort'**
  String get settingsDirectionBackward;

  /// Description of the word → translation direction.
  ///
  /// In de, this message translates to:
  /// **'Die App zeigt das Wort, du antwortest die Bedeutung.'**
  String get settingsDirectionForwardDesc;

  /// Description of the translation → word direction.
  ///
  /// In de, this message translates to:
  /// **'Die App zeigt die Übersetzung, du antwortest das Wort.'**
  String get settingsDirectionBackwardDesc;

  /// Test answer mode: only the translation is asked (direction word → translation).
  ///
  /// In de, this message translates to:
  /// **'Nur Übersetzung'**
  String get settingsAnswerTranslationOnly;

  /// Test answer mode: only the foreign word is asked (direction translation → word).
  ///
  /// In de, this message translates to:
  /// **'Nur Wort'**
  String get settingsAnswerWordOnly;

  /// Test answer mode: only the grammatical forms are asked.
  ///
  /// In de, this message translates to:
  /// **'Nur Formen'**
  String get settingsAnswerFormsOnly;

  /// Test answer mode: translation/word and forms are asked.
  ///
  /// In de, this message translates to:
  /// **'Beides'**
  String get settingsAnswerBoth;

  /// Description of the 'only translation' answer mode.
  ///
  /// In de, this message translates to:
  /// **'Du antwortest nur die Übersetzung.'**
  String get settingsAnswerTranslationOnlyDesc;

  /// Description of the 'only word' answer mode.
  ///
  /// In de, this message translates to:
  /// **'Du antwortest nur das Wort.'**
  String get settingsAnswerWordOnlyDesc;

  /// Description of the 'only forms' answer mode.
  ///
  /// In de, this message translates to:
  /// **'Du antwortest nur die Formen.'**
  String get settingsAnswerFormsOnlyDesc;

  /// Description of the 'both' answer mode in direction word → translation.
  ///
  /// In de, this message translates to:
  /// **'Du antwortest die Übersetzung und die Formen.'**
  String get settingsAnswerBothTranslationDesc;

  /// Description of the 'both' answer mode in direction translation → word.
  ///
  /// In de, this message translates to:
  /// **'Du antwortest das Wort und die Formen.'**
  String get settingsAnswerBothWordDesc;

  /// Settings tile for the user's (optional) name.
  ///
  /// In de, this message translates to:
  /// **'Dein Name'**
  String get settingsNameTitle;

  /// Subtitle of the name tile when no name is set.
  ///
  /// In de, this message translates to:
  /// **'Nicht angegeben – nur auf diesem Handy gespeichert'**
  String get settingsNameEmpty;

  /// Subtitle of the name tile showing the stored name.
  ///
  /// In de, this message translates to:
  /// **'{name} · nur auf diesem Handy gespeichert'**
  String settingsNameSaved(String name);

  /// Section heading for the theme options.
  ///
  /// In de, this message translates to:
  /// **'Design'**
  String get settingsDesignTitle;

  /// Section heading for the accent color choice.
  ///
  /// In de, this message translates to:
  /// **'Akzentfarbe (Neon)'**
  String get settingsAccentTitle;

  /// Info box below the accent colors.
  ///
  /// In de, this message translates to:
  /// **'Die Akzentfarbe gilt für Buttons, Schalter und Hervorhebungen. Im Dark Mode leuchten die Farben, im Light Mode werden sie automatisch etwas abgedunkelt, damit alles gut lesbar bleibt.'**
  String get settingsAccentHint;

  /// Section heading for the quiz direction.
  ///
  /// In de, this message translates to:
  /// **'Sprachrichtung'**
  String get settingsDirectionTitle;

  /// Section heading for what has to be typed in test mode.
  ///
  /// In de, this message translates to:
  /// **'Abfrage-Modus im Test'**
  String get settingsAnswerModeTitle;

  /// Switch: also ask the custom extra fields in test mode.
  ///
  /// In de, this message translates to:
  /// **'Sonstiges mit abfragen'**
  String get settingsAskExtrasTitle;

  /// Subtitle of the 'ask extras' switch.
  ///
  /// In de, this message translates to:
  /// **'z. B. Beispielsatz oder Merkhilfe – wenn die Vokabel welche hat.'**
  String get settingsAskExtrasSubtitle;

  /// Info box explaining grammatical forms and the answer mode.
  ///
  /// In de, this message translates to:
  /// **'Formen sind z. B. Stammformen, Genitiv oder Geschlecht. Hat eine Vokabel keine Formen, wird automatisch nur die Übersetzung abgefragt. Der Abfrage-Modus gilt für den Test-Modus.'**
  String get settingsFormsHint;

  /// Section heading 'About the app'.
  ///
  /// In de, this message translates to:
  /// **'Über die App'**
  String get settingsAboutTitle;

  /// Tile that opens the intro screen again.
  ///
  /// In de, this message translates to:
  /// **'Einführung ansehen'**
  String get settingsShowIntro;

  /// Tile that opens the privacy policy.
  ///
  /// In de, this message translates to:
  /// **'Datenschutz'**
  String get settingsPrivacyTitle;

  /// Subtitle of the privacy tile.
  ///
  /// In de, this message translates to:
  /// **'Alles bleibt auf deinem Handy'**
  String get settingsPrivacySubtitle;

  /// Tile that opens the open-source licenses page.
  ///
  /// In de, this message translates to:
  /// **'Lizenzen'**
  String get settingsLicensesTitle;

  /// Subtitle of the licenses tile.
  ///
  /// In de, this message translates to:
  /// **'Verwendete Software'**
  String get settingsLicensesSubtitle;

  /// Short legal line shown on the licenses page.
  ///
  /// In de, this message translates to:
  /// **'Kostenlos, ohne Werbung und ohne In-App-Käufe.'**
  String get settingsLicensesLegalese;

  /// Snackbar after exporting a backup as a download.
  ///
  /// In de, this message translates to:
  /// **'Sicherung wird heruntergeladen.'**
  String get backupExported;

  /// Snackbar after copying the backup to the clipboard.
  ///
  /// In de, this message translates to:
  /// **'Sicherung in die Zwischenablage kopiert – z. B. in eine Notiz einfügen.'**
  String get backupCopied;

  /// Confirmation dialog title before restoring a backup.
  ///
  /// In de, this message translates to:
  /// **'Sicherung wiederherstellen?'**
  String get backupRestoreTitle;

  /// Confirmation dialog text before restoring a backup.
  ///
  /// In de, this message translates to:
  /// **'Dein aktueller Lernfortschritt und deine Übungslisten werden durch die Sicherung ersetzt.'**
  String get backupRestoreMessage;

  /// Button: restore the backup.
  ///
  /// In de, this message translates to:
  /// **'Wiederherstellen'**
  String get backupRestoreAction;

  /// Snackbar after a successful restore.
  ///
  /// In de, this message translates to:
  /// **'Sicherung wiederhergestellt. ✅'**
  String get backupRestored;

  /// Confirmation dialog title before resetting learning progress.
  ///
  /// In de, this message translates to:
  /// **'Lernfortschritt zurücksetzen?'**
  String get backupResetTitle;

  /// Confirmation dialog text before resetting learning progress.
  ///
  /// In de, this message translates to:
  /// **'Alle Lernstufen und Wiederholungstermine werden gelöscht. Lektionen und Übungslisten bleiben erhalten.'**
  String get backupResetMessage;

  /// Button: reset learning progress.
  ///
  /// In de, this message translates to:
  /// **'Zurücksetzen'**
  String get backupResetAction;

  /// Snackbar after resetting the progress.
  ///
  /// In de, this message translates to:
  /// **'Lernfortschritt zurückgesetzt.'**
  String get backupResetDone;

  /// Dialog title: paste backup text.
  ///
  /// In de, this message translates to:
  /// **'Sicherung einfügen'**
  String get backupPasteTitle;

  /// Settings section heading for data and backup.
  ///
  /// In de, this message translates to:
  /// **'Daten & Sicherung'**
  String get backupTitle;

  /// Explanation in the backup section.
  ///
  /// In de, this message translates to:
  /// **'Dein Fortschritt wird nur in diesem Browser gespeichert. Mach ab und zu eine Sicherung – damit kannst du auch auf ein anderes Gerät umziehen.'**
  String get backupHint;

  /// Tile: export a backup.
  ///
  /// In de, this message translates to:
  /// **'Sicherung exportieren'**
  String get backupExportTitle;

  /// Subtitle of the export tile (file download).
  ///
  /// In de, this message translates to:
  /// **'Als Datei herunterladen'**
  String get backupExportFile;

  /// Subtitle of the export tile (copy to clipboard).
  ///
  /// In de, this message translates to:
  /// **'In die Zwischenablage kopieren'**
  String get backupExportClipboard;

  /// Tile: import a backup.
  ///
  /// In de, this message translates to:
  /// **'Sicherung importieren'**
  String get backupImportTitle;

  /// Subtitle of the import tile (pick a file).
  ///
  /// In de, this message translates to:
  /// **'Sicherungsdatei auswählen'**
  String get backupImportFile;

  /// Subtitle of the import tile (paste text).
  ///
  /// In de, this message translates to:
  /// **'Gesicherten Text einfügen'**
  String get backupImportPaste;

  /// Tile: reset learning progress.
  ///
  /// In de, this message translates to:
  /// **'Lernfortschritt zurücksetzen'**
  String get backupResetTile;

  /// Error when the imported text is not a backup.
  ///
  /// In de, this message translates to:
  /// **'Das ist keine gültige Sicherungsdatei.'**
  String get storeBackupInvalid;

  /// Error when the imported backup cannot be read.
  ///
  /// In de, this message translates to:
  /// **'Die Sicherungsdatei ist beschädigt.'**
  String get storeBackupCorrupt;

  /// Snackbar when notification permission is denied.
  ///
  /// In de, this message translates to:
  /// **'Benachrichtigungen sind blockiert. Erlaube sie in den Android-Einstellungen für den Vokabellerner.'**
  String get notifSectionBlocked;

  /// Settings section heading for reminders.
  ///
  /// In de, this message translates to:
  /// **'Erinnerungen'**
  String get notifSectionTitle;

  /// Hint shown where notifications are not supported.
  ///
  /// In de, this message translates to:
  /// **'📱 Echte Erinnerungen gibt es in der Android-App: mehrmals am Tag, mit aktuellen Zahlen und nie nach 21 Uhr.'**
  String get notifSectionAndroidOnly;

  /// Switch to turn study reminders on/off.
  ///
  /// In de, this message translates to:
  /// **'Lern-Erinnerungen'**
  String get notifSectionSwitchTitle;

  /// Subtitle of the reminders switch.
  ///
  /// In de, this message translates to:
  /// **'Mit aktuellen Zahlen – nie nach 21 Uhr. Ist für heute alles gelernt, ist Ruhe.'**
  String get notifSectionSwitchSubtitle;

  /// Label above the 1×/2×/3× choice.
  ///
  /// In de, this message translates to:
  /// **'Wie oft am Tag?'**
  String get notifSectionHowOften;

  /// Times of the reminders, e.g. 'um 14:30, 17:30, 20:15 Uhr'.
  ///
  /// In de, this message translates to:
  /// **'um {times} Uhr'**
  String notifSectionTimes(String times);

  /// Tile: send a test notification now.
  ///
  /// In de, this message translates to:
  /// **'Test-Benachrichtigung senden'**
  String get notifSectionSendTest;

  /// Android notification channel name.
  ///
  /// In de, this message translates to:
  /// **'Lern-Erinnerungen'**
  String get notifChannelName;

  /// Android notification channel description.
  ///
  /// In de, this message translates to:
  /// **'Erinnert dich ans Vokabellernen (nie nach 21 Uhr).'**
  String get notifChannelDescription;

  /// Title of the test notification.
  ///
  /// In de, this message translates to:
  /// **'👋 Hallo! So sehen deine Erinnerungen aus'**
  String get notifTestTitle;

  /// Body of the test notification.
  ///
  /// In de, this message translates to:
  /// **'Ich melde mich, wenn Vokabeln auf dich warten – nie nach 21 Uhr.'**
  String get notifTestBody;

  /// First reminder of the day (variant 1), title. n = number of vocabulary words to learn today (always >= 1).
  ///
  /// In de, this message translates to:
  /// **'{n, plural, =1{🧠 1 Vokabel wartet auf dich} other{🧠 {n} Vokabeln warten auf dich}}'**
  String notifFirst1Title(int n);

  /// First reminder (variant 1), body.
  ///
  /// In de, this message translates to:
  /// **'Ein paar Minuten reichen – los geht\'s!'**
  String get notifFirst1Body;

  /// First reminder (variant 2), title.
  ///
  /// In de, this message translates to:
  /// **'⚔️ Die Vokabeln greifen an!'**
  String get notifFirst2Title;

  /// First reminder (variant 2), body. n = number of vocabulary words to learn today (always >= 1).
  ///
  /// In de, this message translates to:
  /// **'{n, plural, =1{1 Stück will heute besiegt werden.} other{{n} Stück wollen heute besiegt werden.}}'**
  String notifFirst2Body(int n);

  /// First reminder (variant 3), title.
  ///
  /// In de, this message translates to:
  /// **'🕵️ Geheimauftrag für heute'**
  String get notifFirst3Title;

  /// First reminder (variant 3), body. n = number of vocabulary words to learn today (always >= 1).
  ///
  /// In de, this message translates to:
  /// **'{n, plural, =1{1 Wort entschlüsseln. Bereit?} other{{n} Wörter entschlüsseln. Bereit?}}'**
  String notifFirst3Body(int n);

  /// First reminder (variant 4), title.
  ///
  /// In de, this message translates to:
  /// **'📚 Deine Vokabeln rufen!'**
  String get notifFirst4Title;

  /// First reminder (variant 4), body. n = number of vocabulary words to learn today (always >= 1).
  ///
  /// In de, this message translates to:
  /// **'{n, plural, =1{Heute steht 1 Vokabel auf dem Plan.} other{Heute stehen {n} Vokabeln auf dem Plan.}}'**
  String notifFirst4Body(int n);

  /// First reminder (variant 5), title.
  ///
  /// In de, this message translates to:
  /// **'🎯 Mission des Tages'**
  String get notifFirst5Title;

  /// First reminder (variant 5), body. n = number of vocabulary words to learn today (always >= 1).
  ///
  /// In de, this message translates to:
  /// **'{n, plural, =1{1 Vokabel knacken – schaffst du sie?} other{{n} Vokabeln knacken – schaffst du sie alle?}}'**
  String notifFirst5Body(int n);

  /// First reminder (variant 6), title.
  ///
  /// In de, this message translates to:
  /// **'🦉 Die Lerneule hat Hunger'**
  String get notifFirst6Title;

  /// First reminder (variant 6), body. n = number of vocabulary words to learn today (always >= 1).
  ///
  /// In de, this message translates to:
  /// **'{n, plural, =1{Füttere sie mit 1 Vokabel!} other{Füttere sie mit {n} Vokabeln!}}'**
  String notifFirst6Body(int n);

  /// First reminder (variant 7), title.
  ///
  /// In de, this message translates to:
  /// **'🎲 Kleine Wette?'**
  String get notifFirst7Title;

  /// First reminder (variant 7), body. n = number of vocabulary words to learn today (always >= 1).
  ///
  /// In de, this message translates to:
  /// **'{n, plural, =1{Ich wette, du schaffst die eine Vokabel in 5 Minuten.} other{Ich wette, du schaffst die {n} Vokabeln in 5 Minuten.}}'**
  String notifFirst7Body(int n);

  /// First reminder addressing the user by name (variant 1), title.
  ///
  /// In de, this message translates to:
  /// **'👋 Hey {name}!'**
  String notifNamed1Title(String name);

  /// Named first reminder (variant 1), body. n = number of vocabulary words to learn today (always >= 1).
  ///
  /// In de, this message translates to:
  /// **'{n, plural, =1{1 Vokabel wartet heute auf dich.} other{{n} Vokabeln warten heute auf dich.}}'**
  String notifNamed1Body(int n);

  /// Named first reminder (variant 2), title.
  ///
  /// In de, this message translates to:
  /// **'🎯 {name}, deine Mission für heute'**
  String notifNamed2Title(String name);

  /// Named first reminder (variant 2), body. n = number of vocabulary words to learn today (always >= 1).
  ///
  /// In de, this message translates to:
  /// **'{n, plural, =1{1 Vokabel knacken – los geht\'s!} other{{n} Vokabeln knacken – los geht\'s!}}'**
  String notifNamed2Body(int n);

  /// Named first reminder (variant 3), title.
  ///
  /// In de, this message translates to:
  /// **'🧠 {name}, kurz lernen?'**
  String notifNamed3Title(String name);

  /// Named first reminder (variant 3), body. n = number of vocabulary words to learn today (always >= 1).
  ///
  /// In de, this message translates to:
  /// **'{n, plural, =1{Heute steht 1 Vokabel auf dem Plan.} other{Heute stehen {n} Vokabeln auf dem Plan.}}'**
  String notifNamed3Body(int n);

  /// Middle reminder of the day (a bit more urgent, variant 1), title.
  ///
  /// In de, this message translates to:
  /// **'⏰ Psst… deine Vokabeln warten noch'**
  String get notifMiddle1Title;

  /// Middle reminder (variant 1), body. n = number of vocabulary words to learn today (always >= 1).
  ///
  /// In de, this message translates to:
  /// **'{n, plural, =1{1 Stück ist heute noch offen.} other{{n} Stück sind heute noch offen.}}'**
  String notifMiddle1Body(int n);

  /// Middle reminder (variant 2), title.
  ///
  /// In de, this message translates to:
  /// **'🐢 Die Vokabeln werden ungeduldig'**
  String get notifMiddle2Title;

  /// Middle reminder (variant 2), body. n = number of vocabulary words to learn today (always >= 1).
  ///
  /// In de, this message translates to:
  /// **'{n, plural, =1{Noch 1 wartet – nur ein paar Minuten!} other{Noch {n} warten – nur ein paar Minuten!}}'**
  String notifMiddle2Body(int n);

  /// Middle reminder (variant 3), title.
  ///
  /// In de, this message translates to:
  /// **'💬 Deine Karten fragen, wo du bleibst'**
  String get notifMiddle3Title;

  /// Middle reminder (variant 3), body. n = number of vocabulary words to learn today (always >= 1).
  ///
  /// In de, this message translates to:
  /// **'{n, plural, =1{1 Vokabel ist noch übrig.} other{{n} Vokabeln sind noch übrig.}}'**
  String notifMiddle3Body(int n);

  /// Middle reminder (variant 4), title.
  ///
  /// In de, this message translates to:
  /// **'🧩 Fast vergessen?'**
  String get notifMiddle4Title;

  /// Middle reminder (variant 4), body. n = number of vocabulary words to learn today (always >= 1).
  ///
  /// In de, this message translates to:
  /// **'{n, plural, =1{1 Vokabel will heute noch wiederholt werden.} other{{n} Vokabeln wollen heute noch wiederholt werden.}}'**
  String notifMiddle4Body(int n);

  /// Middle reminder (variant 5), title.
  ///
  /// In de, this message translates to:
  /// **'🚀 Kurzer Boost gefällig?'**
  String get notifMiddle5Title;

  /// Middle reminder (variant 5), body. n = number of vocabulary words to learn today (always >= 1).
  ///
  /// In de, this message translates to:
  /// **'{n, plural, =1{1 Karte, dann hast du Ruhe.} other{{n} Karten, dann hast du Ruhe.}}'**
  String notifMiddle5Body(int n);

  /// Last reminder of the day before 9 pm (variant 1), title.
  ///
  /// In de, this message translates to:
  /// **'🌙 Letzte Chance für heute!'**
  String get notifLast1Title;

  /// Last reminder (variant 1), body. n = number of vocabulary words to learn today (always >= 1).
  ///
  /// In de, this message translates to:
  /// **'{n, plural, =1{Noch 1 Vokabel – danach ist Feierabend.} other{Noch {n} Vokabeln – danach ist Feierabend.}}'**
  String notifLast1Body(int n);

  /// Last reminder (variant 2), title.
  ///
  /// In de, this message translates to:
  /// **'⌛ Der Tag ist fast vorbei'**
  String get notifLast2Title;

  /// Last reminder (variant 2), body. n = number of vocabulary words to learn today (always >= 1).
  ///
  /// In de, this message translates to:
  /// **'{n, plural, =1{1 Vokabel, dann bist du für heute durch.} other{{n} Vokabeln, dann bist du für heute durch.}}'**
  String notifLast2Body(int n);

  /// Last reminder (variant 3), title.
  ///
  /// In de, this message translates to:
  /// **'🛡️ Endspurt für heute'**
  String get notifLast3Title;

  /// Last reminder (variant 3), body. n = number of vocabulary words to learn today (always >= 1).
  ///
  /// In de, this message translates to:
  /// **'{n, plural, =1{Noch 1 Vokabel bis zum Feierabend.} other{Noch {n} Vokabeln bis zum Feierabend.}}'**
  String notifLast3Body(int n);

  /// Last reminder when the daily learning streak would break. streak = number of days in a row.
  ///
  /// In de, this message translates to:
  /// **'🔥 Deine {streak}-Tage-Serie ist in Gefahr!'**
  String notifStreakTitle(int streak);

  /// Same as notifStreakTitle, addressing the user by name.
  ///
  /// In de, this message translates to:
  /// **'🔥 {name}, deine {streak}-Tage-Serie ist in Gefahr!'**
  String notifStreakTitleNamed(String name, int streak);

  /// Body of the streak-in-danger reminder. n = number of vocabulary words to learn today (always >= 1).
  ///
  /// In de, this message translates to:
  /// **'{n, plural, =1{Noch 1 Vokabel – lern heute, damit sie nicht reißt.} other{Noch {n} Vokabeln – lern heute, damit sie nicht reißt.}}'**
  String notifStreakBody(int n);

  /// Reminder on the day before a vocabulary test. list = name of the test/practice list.
  ///
  /// In de, this message translates to:
  /// **'🚨 Morgen ist „{list}\"!'**
  String notifExamTomorrowTitle(String list);

  /// Body of the last reminder on the day before a test. n = number of vocabulary words to learn today (always >= 1).
  ///
  /// In de, this message translates to:
  /// **'{n, plural, =1{Letzte Chance: noch 1 Vokabel wiederholen!} other{Letzte Chance: noch {n} Vokabeln wiederholen!}}'**
  String notifExamTomorrowBodyLast(int n);

  /// Body of earlier reminders on the day before a test. n = number of vocabulary words to learn today (always >= 1).
  ///
  /// In de, this message translates to:
  /// **'{n, plural, =1{Heute ist der letzte Lerntag – 1 Vokabel wartet.} other{Heute ist der letzte Lerntag – {n} Vokabeln warten.}}'**
  String notifExamTomorrowBody(int n);

  /// First reminder 2–3 days before a test. days = days left (2 or 3), list = name of the test.
  ///
  /// In de, this message translates to:
  /// **'⚡ Noch {days} Tage bis „{list}\"'**
  String notifExamSoonTitle(int days, String list);

  /// Body of the reminder 2–3 days before a test. n = number of vocabulary words to learn today (always >= 1).
  ///
  /// In de, this message translates to:
  /// **'{n, plural, =1{Endspurt! Heute ist 1 Vokabel dran.} other{Endspurt! Heute sind {n} Vokabeln dran.}}'**
  String notifExamSoonBody(int n);

  /// Morning notification on the day of the test. list = name of the test.
  ///
  /// In de, this message translates to:
  /// **'🍀 Heute ist „{list}\"!'**
  String notifExamDayTitle(String list);

  /// Body of the good-luck notification on the test day.
  ///
  /// In de, this message translates to:
  /// **'Du hast geübt – jetzt zeig, was du kannst. Viel Erfolg! 💪'**
  String get notifExamDayBody;

  /// Analysis tab when there are no practice lists.
  ///
  /// In de, this message translates to:
  /// **'Noch keine Übungslisten'**
  String get analyseEmptyTitle;

  /// Analysis tab hint when there are no practice lists.
  ///
  /// In de, this message translates to:
  /// **'Erstelle eine Übungsliste, um hier deine Fortschritte zu sehen.'**
  String get analyseEmptyText;

  /// Summary of a practice list: total words and how many are good/neutral/weak.
  ///
  /// In de, this message translates to:
  /// **'{total, plural, =1{1 Vokabel} other{{total} Vokabeln}} · {good} gut · {neutral} neutral · {weak} schwach'**
  String analyseSummary(int total, int good, int neutral, int weak);

  /// Heading of the goal card. date = formatted test date.
  ///
  /// In de, this message translates to:
  /// **'Ziel bis {date}'**
  String analyseGoalUntil(String date);

  /// Label of the overall goal progress bar.
  ///
  /// In de, this message translates to:
  /// **'Gesamtziel'**
  String get analyseOverallGoal;

  /// Overall goal progress, e.g. '12/30 Vokabeln gewusst'.
  ///
  /// In de, this message translates to:
  /// **'{known}/{total} Vokabeln gewusst'**
  String analyseKnown(int known, int total);

  /// Label of the daily goal progress bar.
  ///
  /// In de, this message translates to:
  /// **'Tagesziel'**
  String get analyseDailyGoal;

  /// Daily goal value when everything is learned.
  ///
  /// In de, this message translates to:
  /// **'alles geschafft'**
  String get analyseAllDone;

  /// Daily goal progress, e.g. '3/10 heute gelernt'.
  ///
  /// In de, this message translates to:
  /// **'{learned}/{target} heute gelernt'**
  String analyseLearnedToday(int learned, int target);

  /// Shown when all words of the list are known.
  ///
  /// In de, this message translates to:
  /// **'Alle Vokabeln gewusst! 🎉'**
  String get analyseAllKnown;

  /// Days until the test and words still to learn.
  ///
  /// In de, this message translates to:
  /// **'Noch {days, plural, =1{1 Tag} other{{days} Tage}} · {remaining, plural, =1{1 Vokabel} other{{remaining} Vokabeln}} offen.'**
  String analyseRemaining(int days, int remaining);

  /// Memory info for a word that was never practiced.
  ///
  /// In de, this message translates to:
  /// **'Noch nie geübt'**
  String get vocabDetailNeverPracticed;

  /// Memory info: recall probability in percent, due now, number of reviews.
  ///
  /// In de, this message translates to:
  /// **'Gedächtnis: {percent} % · jetzt fällig · {reps}× geübt'**
  String vocabDetailMemoryDue(int percent, int reps);

  /// Memory info: recall probability, time until next review (e.g. '3 T'), number of reviews.
  ///
  /// In de, this message translates to:
  /// **'Gedächtnis: {percent} % · wieder in {interval} · {reps}× geübt'**
  String vocabDetailMemoryNext(int percent, String interval, int reps);

  /// Shown instead of the level chart when there is no history.
  ///
  /// In de, this message translates to:
  /// **'Noch keine Verläufe vorhanden.'**
  String get vocabDetailNoHistory;

  /// Button: lower the learning level of the word.
  ///
  /// In de, this message translates to:
  /// **'Schlechter'**
  String get vocabDetailWorse;

  /// Button: raise the learning level of the word.
  ///
  /// In de, this message translates to:
  /// **'Besser'**
  String get vocabDetailBetter;

  /// Learning level +5.
  ///
  /// In de, this message translates to:
  /// **'Sehr gut'**
  String get levelVeryGood;

  /// Learning level +4.
  ///
  /// In de, this message translates to:
  /// **'Gut'**
  String get levelGood;

  /// Learning level +3.
  ///
  /// In de, this message translates to:
  /// **'Ziemlich gut'**
  String get levelQuiteGood;

  /// Learning level +2.
  ///
  /// In de, this message translates to:
  /// **'Ganz okay'**
  String get levelOkay;

  /// Learning level +1.
  ///
  /// In de, this message translates to:
  /// **'Leicht gut'**
  String get levelSlightlyGood;

  /// Learning level 0.
  ///
  /// In de, this message translates to:
  /// **'Neutral'**
  String get levelNeutral;

  /// Learning level -1.
  ///
  /// In de, this message translates to:
  /// **'Leicht schwach'**
  String get levelSlightlyWeak;

  /// Learning level -2.
  ///
  /// In de, this message translates to:
  /// **'Schwach'**
  String get levelWeak;

  /// Learning level -3.
  ///
  /// In de, this message translates to:
  /// **'Ziemlich schwach'**
  String get levelQuiteWeak;

  /// Learning level -4.
  ///
  /// In de, this message translates to:
  /// **'Schlecht'**
  String get levelBad;

  /// Learning level -5.
  ///
  /// In de, this message translates to:
  /// **'Sehr schlecht'**
  String get levelVeryBad;

  /// App bar title of the tutorial.
  ///
  /// In de, this message translates to:
  /// **'So funktioniert die App'**
  String get tutorialTitle;

  /// Tutorial page 1 title.
  ///
  /// In de, this message translates to:
  /// **'So funktioniert der Vokabeltrainer'**
  String get tutorialPage1Title;

  /// Tutorial page 1 text. „Weiter" = commonNext button.
  ///
  /// In de, this message translates to:
  /// **'Diese App hilft dir, Vokabeln in jeder Sprache zu lernen – mit Karteikarten, Tests und cleverer Wiederholung. Wische nach links oder tippe auf „Weiter\", um alles kennenzulernen.'**
  String get tutorialPage1Text;

  /// Tutorial page 2 title.
  ///
  /// In de, this message translates to:
  /// **'Lektion anlegen'**
  String get tutorialPage2Title;

  /// Tutorial page 2 text. Quoted names must match the app's tab label.
  ///
  /// In de, this message translates to:
  /// **'Im Tab „Lektionen\" legst du eine Lektion an: Name, Sprache und was du lernen willst – Wort und Übersetzung, auf Wunsch Formen und bis zu drei eigene Felder wie Beispielsatz oder Merkhilfe.'**
  String get tutorialPage2Text;

  /// Tutorial page 3 title.
  ///
  /// In de, this message translates to:
  /// **'Vokabeln scannen'**
  String get tutorialPage3Title;

  /// Tutorial page 3 text.
  ///
  /// In de, this message translates to:
  /// **'Tippe die Vokabeln selbst ein – oder tippe auf „Scannen\" und fotografiere die Liste aus deinem Buch. Eine KI-App wie ChatGPT oder Gemini liest sie ab. Kopiere ihre Antwort, komm zurück, fertig.'**
  String get tutorialPage3Text;

  /// Tutorial page 4 title.
  ///
  /// In de, this message translates to:
  /// **'Übungslisten erstellen'**
  String get tutorialPage4Title;

  /// Tutorial page 4 text.
  ///
  /// In de, this message translates to:
  /// **'Tippe auf der Startseite auf „Übungslisten\" und dann auf „Neue Liste\". Gib der Liste einen Namen, optional das Datum deines Vokabeltests, und wähle die Vokabeln aus deinen Lektionen aus.'**
  String get tutorialPage4Text;

  /// Tutorial page 5 title.
  ///
  /// In de, this message translates to:
  /// **'Jeden Tag lernen'**
  String get tutorialPage5Title;

  /// Tutorial page 5 text.
  ///
  /// In de, this message translates to:
  /// **'Auf der Startseite steht unter „Heute\", was aus deinen Listen gerade dran ist: fällige Wiederholungen zuerst, dazu bis zu 15 neue Vokabeln. Tippe auf „Los geht\'s\" zum Starten.'**
  String get tutorialPage5Text;

  /// Tutorial page 6 title.
  ///
  /// In de, this message translates to:
  /// **'Karteikarten'**
  String get tutorialPage6Title;

  /// Tutorial page 6 text. Quoted names must match the flashcard rating buttons.
  ///
  /// In de, this message translates to:
  /// **'Tippe auf die Karte, um sie umzudrehen, und bewerte dich ehrlich: „Nochmal\", „Schwer\", „Gut\" oder „Leicht\". Unter jedem Knopf steht, wann die Karte wiederkommt. Am PC: Leertaste zum Umdrehen, 1–4 zum Bewerten.'**
  String get tutorialPage6Text;

  /// Tutorial page 7 title.
  ///
  /// In de, this message translates to:
  /// **'Clever wiederholen'**
  String get tutorialPage7Title;

  /// Tutorial page 7 text.
  ///
  /// In de, this message translates to:
  /// **'Die App fragt jede Vokabel genau dann ab, kurz bevor du sie vergessen würdest (Spaced Repetition mit FSRS, wie bei Anki). Gut gekonnte Wörter kommen seltener, schwierige öfter. Lerne jeden Tag ein bisschen – das hält deine 🔥 Lernserie am Leben.'**
  String get tutorialPage7Text;

  /// Tutorial page 8 title.
  ///
  /// In de, this message translates to:
  /// **'Vokabeltest im Blick'**
  String get tutorialPage8Title;

  /// Tutorial page 8 text.
  ///
  /// In de, this message translates to:
  /// **'Gib beim Erstellen einer Liste das Datum deines Tests an. Die App verteilt die neuen Vokabeln so auf die Tage, dass du am Tag VOR dem Test fertig bist – dort wird alles noch einmal wiederholt. Je näher der Test, desto öfter kommen die Vokabeln dran.'**
  String get tutorialPage8Text;

  /// Tutorial page 9 title.
  ///
  /// In de, this message translates to:
  /// **'Erinnerungen'**
  String get tutorialPage9Title;

  /// Tutorial page 9 text.
  ///
  /// In de, this message translates to:
  /// **'Die App erinnert dich bis zu 3-mal am Tag – mit den aktuellen Zahlen und nie nach 21 Uhr. Hast du für heute alles gelernt, ist Ruhe. Einstellen kannst du das unter Einstellungen → Erinnerungen.'**
  String get tutorialPage9Text;

  /// Tutorial page 10 title.
  ///
  /// In de, this message translates to:
  /// **'Test-Modus'**
  String get tutorialPage10Title;

  /// Tutorial page 10 text. Mentions German articles; adapt to the target language.
  ///
  /// In de, this message translates to:
  /// **'Hier tippst du die Übersetzung und/oder die Formen selbst ein – auf Wunsch auch die eigenen Felder (Einstellungen). Beim Prüfen sind Groß-/Kleinschreibung und Artikel (der/die/das) egal.'**
  String get tutorialPage10Text;

  /// Tutorial page 11 title.
  ///
  /// In de, this message translates to:
  /// **'Lernfortschritt sehen'**
  String get tutorialPage11Title;

  /// Tutorial page 11 text.
  ///
  /// In de, this message translates to:
  /// **'Im Tab „Analyse\" siehst du jede Vokabel mit ihrer Lernstufe: 5 Grüntöne (gut), Grau (neutral) und 5 Rottöne (schwach). Tippe auf eine Vokabel für die Verlaufs-Grafik und zum manuellen Verbessern oder Verschlechtern mit +/−.'**
  String get tutorialPage11Text;

  /// Tutorial page 12 title.
  ///
  /// In de, this message translates to:
  /// **'Deine Daten'**
  String get tutorialPage12Title;

  /// Tutorial page 12 text.
  ///
  /// In de, this message translates to:
  /// **'Alles wird nur auf diesem Gerät gespeichert – ohne Konto, ohne Internet. Mach in den Einstellungen ab und zu eine Sicherung. Damit kannst du auch auf ein anderes Gerät umziehen.'**
  String get tutorialPage12Text;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
