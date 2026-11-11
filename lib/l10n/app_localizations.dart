import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_zh.dart';

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
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('it'),
    Locale('pl'),
    Locale('pt'),
    Locale('ru'),
    Locale('tr'),
    Locale('zh')
  ];

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

  /// Title of the one-time tip shown before typing in vocabulary by hand.
  ///
  /// In de, this message translates to:
  /// **'Vokabeln eintippen'**
  String get lessonScreenManualHintTitle;

  /// Body of the one-time tip shown before typing in vocabulary by hand.
  ///
  /// In de, this message translates to:
  /// **'Du bekommst ein Feld für jede Angabe dieser Lektion. Nur Wort und Übersetzung müssen ausgefüllt sein. Später kannst du jede Vokabel antippen, um sie zu ändern.'**
  String get lessonScreenManualHintText;

  /// Snackbar after a vocabulary item was added.
  ///
  /// In de, this message translates to:
  /// **'„{word}\" hinzugefügt.'**
  String lessonScreenVocabAdded(String word);

  /// Snackbar after a vocabulary item was deleted (with undo action).
  ///
  /// In de, this message translates to:
  /// **'„{word}\" gelöscht.'**
  String lessonScreenVocabDeleted(String word);

  /// Title of the one-time tip explaining scanning a vocabulary list with an AI app.
  ///
  /// In de, this message translates to:
  /// **'So funktioniert Scannen'**
  String get lessonScreenScanHintTitle;

  /// Body of the scanning tip. Keep the line breaks.
  ///
  /// In de, this message translates to:
  /// **'1. Fotografiere die Vokabelliste – gerade und gut lesbar.\n2. Wähle eine KI-App. Sie öffnet sich mit dem Foto und der Anleitung.\n3. Schick die Nachricht ab.\n4. Kopiere die Antwort und komm zurück – die Vokabeln werden automatisch erkannt.\n\nAbgelesen wird: {columns}'**
  String lessonScreenScanHintText(String columns);

  /// Title of the one-time tip before choosing an AI app.
  ///
  /// In de, this message translates to:
  /// **'Am besten eine kostenlose KI'**
  String get lessonScreenFreeAiHintTitle;

  /// Body of the one-time tip before choosing an AI app.
  ///
  /// In de, this message translates to:
  /// **'ChatGPT, Gemini und Co. lesen Vokabeln auch in der kostenlosen Version zuverlässig ab – du brauchst kein Abo. Die Anleitung für die KI wird automatisch eingefügt.'**
  String get lessonScreenFreeAiHintText;

  /// Snackbar when the chosen AI app could not be opened.
  ///
  /// In de, this message translates to:
  /// **'{app} ließ sich nicht öffnen.'**
  String lessonScreenAiOpenFailed(String app);

  /// Snackbar when the clipboard contains no recognizable AI answer.
  ///
  /// In de, this message translates to:
  /// **'Keine Vokabeln in der Zwischenablage. Kopiere in der KI-App die ganze Antwort und versuch es noch einmal.'**
  String get lessonScreenNothingInClipboard;

  /// Snackbar after scanned vocabulary was imported.
  ///
  /// In de, this message translates to:
  /// **'{count, plural, =1{1 Vokabel übernommen. Tippe sie an, um sie zu korrigieren.} other{{count} Vokabeln übernommen. Tippe eine an, um sie zu korrigieren.}}'**
  String lessonScreenImported(int count);

  /// Title of the confirmation dialog for deleting a lesson.
  ///
  /// In de, this message translates to:
  /// **'„{name}\" löschen?'**
  String lessonScreenDeleteLessonTitle(String name);

  /// Body of the confirmation dialog for deleting a lesson.
  ///
  /// In de, this message translates to:
  /// **'Die Lektion und alle ihre Vokabeln werden gelöscht – auch aus deinen Übungslisten.'**
  String get lessonScreenDeleteLessonText;

  /// Menu item: edit the lesson's settings.
  ///
  /// In de, this message translates to:
  /// **'Lektion einstellen'**
  String get lessonScreenMenuSettings;

  /// Menu item: delete the lesson.
  ///
  /// In de, this message translates to:
  /// **'Lektion löschen'**
  String get lessonScreenMenuDelete;

  /// No description provided for @lessonScreenEmpty.
  ///
  /// In de, this message translates to:
  /// **'Noch keine Vokabeln in dieser Lektion.'**
  String get lessonScreenEmpty;

  /// Shown while the photo was sent to an AI app and the answer is pending.
  ///
  /// In de, this message translates to:
  /// **'Warte auf die Antwort der KI …'**
  String get lessonScreenWaitingForAi;

  /// Explanation below the waiting indicator.
  ///
  /// In de, this message translates to:
  /// **'Kopiere in der KI-App die Antwort (Kopieren-Knopf am Textblock) und komm zurück – die Vokabeln werden dann automatisch erkannt.'**
  String get lessonScreenWaitingHelp;

  /// Button: paste the AI answer from the clipboard.
  ///
  /// In de, this message translates to:
  /// **'Antwort einfügen'**
  String get lessonScreenPasteAnswer;

  /// Heading of the card with the add buttons.
  ///
  /// In de, this message translates to:
  /// **'Vokabeln hinzufügen'**
  String get lessonScreenAddTitle;

  /// Button: type in vocabulary by hand.
  ///
  /// In de, this message translates to:
  /// **'Selbst eingeben'**
  String get lessonScreenAddManually;

  /// Button: scan a vocabulary list with an AI app.
  ///
  /// In de, this message translates to:
  /// **'Scannen'**
  String get lessonScreenScan;

  /// Tip below the add buttons. „Scannen" must match lessonScreenScan.
  ///
  /// In de, this message translates to:
  /// **'Tipp: Mit „Scannen\" fotografierst du die Vokabelliste aus deinem Buch. Eine KI-App wie ChatGPT oder Gemini liest sie für dich ab – kein Abtippen nötig.'**
  String get lessonScreenScanTip;

  /// Button: take a photo with the camera.
  ///
  /// In de, this message translates to:
  /// **'Foto aufnehmen'**
  String get lessonScreenTakePhoto;

  /// Button: pick a photo from the gallery.
  ///
  /// In de, this message translates to:
  /// **'Foto aus der Galerie'**
  String get lessonScreenPhotoFromGallery;

  /// Title of the AI app picker.
  ///
  /// In de, this message translates to:
  /// **'Mit welcher KI?'**
  String get lessonScreenWhichAi;

  /// AI app picker: no AI app is installed. „Scannen" must match lessonScreenScan.
  ///
  /// In de, this message translates to:
  /// **'Auf deinem Handy ist noch keine KI-App. Installiere eine – kostenlos – und tippe danach noch einmal auf „Scannen\".'**
  String get lessonScreenNoAiInstalled;

  /// AI app picker: install an AI app that is missing.
  ///
  /// In de, this message translates to:
  /// **'{app} installieren'**
  String lessonScreenInstallApp(String app);

  /// Subtitle below the install entry of a missing AI app.
  ///
  /// In de, this message translates to:
  /// **'kostenlos im Play Store'**
  String get lessonScreenFreeInPlayStore;

  /// Small print at the bottom of the AI app picker.
  ///
  /// In de, this message translates to:
  /// **'Der Vokabeltrainer ist nicht mit diesen Apps oder ihren Anbietern verbunden. Für sie gilt ihre eigene Datenschutzerklärung.'**
  String get lessonScreenAiDisclaimer;

  /// Title of the import preview after scanning.
  ///
  /// In de, this message translates to:
  /// **'{count, plural, =1{1 Vokabel erkannt} other{{count} Vokabeln erkannt}}'**
  String lessonScreenRecognized(int count);

  /// Import preview: number of scanned vocabulary items already in the lesson.
  ///
  /// In de, this message translates to:
  /// **'{count, plural, =1{1 war schon in der Lektion und wird übersprungen.} other{{count} waren schon in der Lektion und werden übersprungen.}}'**
  String lessonScreenDuplicatesSkipped(int count);

  /// Import preview button: take over the selected vocabulary items.
  ///
  /// In de, this message translates to:
  /// **'{count} übernehmen'**
  String lessonScreenImportButton(int count);

  /// App bar title when creating a lesson.
  ///
  /// In de, this message translates to:
  /// **'Neue Lektion'**
  String get lessonSetupTitleNew;

  /// App bar title when editing a lesson's settings.
  ///
  /// In de, this message translates to:
  /// **'Lektion einstellen'**
  String get lessonSetupTitleEdit;

  /// No description provided for @lessonSetupNameLabel.
  ///
  /// In de, this message translates to:
  /// **'Name der Lektion'**
  String get lessonSetupNameLabel;

  /// Example lesson names in the name field.
  ///
  /// In de, this message translates to:
  /// **'z. B. Unit 3 oder Lektion 5'**
  String get lessonSetupNameHint;

  /// Field: the foreign language of the words in the lesson.
  ///
  /// In de, this message translates to:
  /// **'Sprache der Wörter'**
  String get lessonSetupLanguageLabel;

  /// Field: the language of the translations (e.g. „Übersetzung auf: Deutsch").
  ///
  /// In de, this message translates to:
  /// **'Übersetzung auf'**
  String get lessonSetupTranslationLabel;

  /// Heading: which fields each vocabulary item has.
  ///
  /// In de, this message translates to:
  /// **'Was wird eingegeben?'**
  String get lessonSetupFieldsTitle;

  /// No description provided for @lessonSetupFieldsHelp.
  ///
  /// In de, this message translates to:
  /// **'Danach richtet sich das Eingeben, das Scannen mit KI und der Test.'**
  String get lessonSetupFieldsHelp;

  /// Field of a vocabulary item: the word in the foreign language.
  ///
  /// In de, this message translates to:
  /// **'Wort'**
  String get lessonSetupWord;

  /// Field of a vocabulary item: its translation.
  ///
  /// In de, this message translates to:
  /// **'Übersetzung'**
  String get lessonSetupTranslation;

  /// Subtitle of fields that are always part of a vocabulary item.
  ///
  /// In de, this message translates to:
  /// **'immer dabei'**
  String get lessonSetupAlwaysIncluded;

  /// Field of a vocabulary item: grammatical forms.
  ///
  /// In de, this message translates to:
  /// **'Formen'**
  String get lessonSetupForms;

  /// No description provided for @lessonSetupFormsSubtitle.
  ///
  /// In de, this message translates to:
  /// **'z. B. Stammformen, Genitiv, Geschlecht'**
  String get lessonSetupFormsSubtitle;

  /// No description provided for @lessonSetupWhichForms.
  ///
  /// In de, this message translates to:
  /// **'Welche Formen?'**
  String get lessonSetupWhichForms;

  /// Chip: all grammatical information from the book.
  ///
  /// In de, this message translates to:
  /// **'Alles'**
  String get lessonSetupAllForms;

  /// No description provided for @lessonSetupAllFormsHelp.
  ///
  /// In de, this message translates to:
  /// **'Alles, was im Buch zum Wort steht: Stammformen, Plural, Geschlecht, Steigerung, Fall und mehr.'**
  String get lessonSetupAllFormsHelp;

  /// Error when forms are on but no kind of form is selected.
  ///
  /// In de, this message translates to:
  /// **'Wähle mindestens eine Art aus.'**
  String get lessonSetupPickOneKind;

  /// Heading of the custom fields section.
  ///
  /// In de, this message translates to:
  /// **'Sonstiges (bis zu 3)'**
  String get lessonSetupExtrasTitle;

  /// No description provided for @lessonSetupExtrasHelp.
  ///
  /// In de, this message translates to:
  /// **'Eigene Felder, z. B. Beispielsatz oder Merkhilfe.'**
  String get lessonSetupExtrasHelp;

  /// Label of the text field for the name of custom field number {number}.
  ///
  /// In de, this message translates to:
  /// **'Sonstiges {number} – Name'**
  String lessonSetupExtraFieldLabel(int number);

  /// Name of custom field number {number} when the user left it empty.
  ///
  /// In de, this message translates to:
  /// **'Sonstiges {number}'**
  String lessonSetupExtraDefaultName(int number);

  /// Tooltip: remove a custom field.
  ///
  /// In de, this message translates to:
  /// **'Entfernen'**
  String get lessonSetupRemove;

  /// Chip: add an empty custom field.
  ///
  /// In de, this message translates to:
  /// **'Sonstiges'**
  String get lessonSetupExtraChip;

  /// Suggested custom field: example sentence.
  ///
  /// In de, this message translates to:
  /// **'Beispielsatz'**
  String get lessonSetupSuggestionExample;

  /// Suggested custom field: mnemonic.
  ///
  /// In de, this message translates to:
  /// **'Merkhilfe'**
  String get lessonSetupSuggestionMnemonic;

  /// Suggested custom field: pronunciation.
  ///
  /// In de, this message translates to:
  /// **'Aussprache'**
  String get lessonSetupSuggestionPronunciation;

  /// Suggested custom field: opposite / antonym.
  ///
  /// In de, this message translates to:
  /// **'Gegenteil'**
  String get lessonSetupSuggestionOpposite;

  /// Title of the one-time tip before creating a lesson.
  ///
  /// In de, this message translates to:
  /// **'Neue Lektion'**
  String get lessonsTabNewLessonHintTitle;

  /// Body of the one-time tip before creating a lesson.
  ///
  /// In de, this message translates to:
  /// **'Gib der Lektion einen Namen und wähle die Sprache. Dann legst du fest, was du lernen willst: Wort und Übersetzung sind immer dabei, dazu auf Wunsch Formen und bis zu drei eigene Felder wie Beispielsatz oder Merkhilfe.'**
  String get lessonsTabNewLessonHintText;

  /// No description provided for @lessonsTabEmptyTitle.
  ///
  /// In de, this message translates to:
  /// **'Noch keine Lektionen'**
  String get lessonsTabEmptyTitle;

  /// Shown in the lessons tab while there are no lessons.
  ///
  /// In de, this message translates to:
  /// **'Leg deine erste Lektion an. Die Vokabeln tippst du selbst ein – oder du fotografierst die Seite aus deinem Buch und lässt eine KI-App wie ChatGPT oder Gemini sie ablesen.'**
  String get lessonsTabEmptyText;

  /// Button: create a new lesson.
  ///
  /// In de, this message translates to:
  /// **'Neue Lektion'**
  String get lessonsTabNewLesson;

  /// Lesson card: number of vocabulary items and how many of them are known.
  ///
  /// In de, this message translates to:
  /// **'{count, plural, =1{1 Vokabel} other{{count} Vokabeln}} · {known} gewusst'**
  String lessonsTabCardStats(int count, int known);

  /// No description provided for @vocabFormDialogTitleNew.
  ///
  /// In de, this message translates to:
  /// **'Neue Vokabel'**
  String get vocabFormDialogTitleNew;

  /// No description provided for @vocabFormDialogTitleEdit.
  ///
  /// In de, this message translates to:
  /// **'Vokabel bearbeiten'**
  String get vocabFormDialogTitleEdit;

  /// Field label: the word in the foreign language (lesson has no language set).
  ///
  /// In de, this message translates to:
  /// **'Wort'**
  String get vocabFormDialogWord;

  /// Field label: the word in the foreign language.
  ///
  /// In de, this message translates to:
  /// **'Wort ({language})'**
  String vocabFormDialogWordWithLanguage(String language);

  /// Field label: the translation.
  ///
  /// In de, this message translates to:
  /// **'Übersetzung ({language})'**
  String vocabFormDialogTranslation(String language);

  /// Field label: grammatical forms.
  ///
  /// In de, this message translates to:
  /// **'Formen'**
  String get vocabFormDialogForms;

  /// Hint in the forms field when the lesson wants all forms.
  ///
  /// In de, this message translates to:
  /// **'alle Formen'**
  String get vocabFormDialogAllForms;

  /// No description provided for @introWelcomeTitle.
  ///
  /// In de, this message translates to:
  /// **'Willkommen beim Vokabeltrainer'**
  String get introWelcomeTitle;

  /// No description provided for @introWelcomeText.
  ///
  /// In de, this message translates to:
  /// **'Lerne Vokabeln in jeder Sprache – mit Karteikarten, Tests und cleverer Wiederholung. Jede Vokabel kommt genau dann wieder, kurz bevor du sie vergessen würdest.'**
  String get introWelcomeText;

  /// No description provided for @introScanTitle.
  ///
  /// In de, this message translates to:
  /// **'Eintippen oder scannen'**
  String get introScanTitle;

  /// No description provided for @introScanText.
  ///
  /// In de, this message translates to:
  /// **'Leg Lektionen an und tippe die Vokabeln ein. Oder fotografiere die Liste aus deinem Buch: Eine KI-App wie ChatGPT oder Gemini liest sie für dich ab.'**
  String get introScanText;

  /// No description provided for @introTestTitle.
  ///
  /// In de, this message translates to:
  /// **'Bereit für den Test'**
  String get introTestTitle;

  /// Intro page about the test date. Reminders never come after 9 pm.
  ///
  /// In de, this message translates to:
  /// **'Gib das Datum deines Vokabeltests an. Die App verteilt die Vokabeln auf die Tage davor und erinnert dich ans Lernen – nie nach 21 Uhr.'**
  String get introTestText;

  /// No description provided for @introPrivacyTitle.
  ///
  /// In de, this message translates to:
  /// **'Alles bleibt auf deinem Handy'**
  String get introPrivacyTitle;

  /// No description provided for @introPrivacyText.
  ///
  /// In de, this message translates to:
  /// **'Kein Konto, keine Cloud: Deine Lektionen und dein Lernstand werden nirgends im Internet gespeichert. Nur wenn du scannst, geht das Foto an die KI-App, die du selbst auswählst.'**
  String get introPrivacyText;

  /// No description provided for @introFreeTitle.
  ///
  /// In de, this message translates to:
  /// **'Komplett kostenlos'**
  String get introFreeTitle;

  /// Intro page; the developer speaks in first person.
  ///
  /// In de, this message translates to:
  /// **'Ich verdiene mit dieser App nichts: keine Werbung, keine In-App-Käufe, kein Abo. Sie ist einfach zum Lernen da.'**
  String get introFreeText;

  /// App bar title of the privacy policy screen.
  ///
  /// In de, this message translates to:
  /// **'Datenschutz'**
  String get privacyScreenTitle;

  /// Title of the name dialog on first start.
  ///
  /// In de, this message translates to:
  /// **'Willkommen!'**
  String get nameDialogWelcome;

  /// Title of the name dialog when opened from the settings.
  ///
  /// In de, this message translates to:
  /// **'Dein Name'**
  String get nameDialogTitle;

  /// No description provided for @nameDialogIntro.
  ///
  /// In de, this message translates to:
  /// **'Wie heißt du? Dann begrüßt dich die App mit Namen – auch in den Erinnerungen. Das ist freiwillig.'**
  String get nameDialogIntro;

  /// No description provided for @nameDialogLabel.
  ///
  /// In de, this message translates to:
  /// **'Dein Name (optional)'**
  String get nameDialogLabel;

  /// No description provided for @nameDialogLocalOnly.
  ///
  /// In de, this message translates to:
  /// **'Dein Name wird nur auf diesem Handy gespeichert.'**
  String get nameDialogLocalOnly;

  /// Checkbox in tip dialogs: don't show this tip again.
  ///
  /// In de, this message translates to:
  /// **'Nicht mehr anzeigen'**
  String get hintDialogDontShowAgain;

  /// Kind of grammatical form (lesson setup chips and AI scan prompt).
  ///
  /// In de, this message translates to:
  /// **'Verbformen'**
  String get formKindVerbLabel;

  /// No description provided for @formKindNounLabel.
  ///
  /// In de, this message translates to:
  /// **'Nomenformen'**
  String get formKindNounLabel;

  /// No description provided for @formKindPluralLabel.
  ///
  /// In de, this message translates to:
  /// **'Plural'**
  String get formKindPluralLabel;

  /// No description provided for @formKindAdjectiveLabel.
  ///
  /// In de, this message translates to:
  /// **'Adjektivformen'**
  String get formKindAdjectiveLabel;

  /// No description provided for @formKindComparisonLabel.
  ///
  /// In de, this message translates to:
  /// **'Steigerung'**
  String get formKindComparisonLabel;

  /// No description provided for @formKindGenderLabel.
  ///
  /// In de, this message translates to:
  /// **'Geschlecht'**
  String get formKindGenderLabel;

  /// No description provided for @formKindInflectionClassLabel.
  ///
  /// In de, this message translates to:
  /// **'Deklination/Konjugation'**
  String get formKindInflectionClassLabel;

  /// Which case or preposition a word requires.
  ///
  /// In de, this message translates to:
  /// **'Fall/Präposition'**
  String get formKindGovernmentLabel;

  /// Part of speech.
  ///
  /// In de, this message translates to:
  /// **'Wortart'**
  String get formKindWordClassLabel;

  /// Explanation/example for the AI scan prompt. Keep the foreign-language examples.
  ///
  /// In de, this message translates to:
  /// **'Stammformen bzw. unregelmäßige Formen, z. B. vocō, vocāvī, vocātum oder go, went, gone'**
  String get formKindVerbExample;

  /// No description provided for @formKindNounExample.
  ///
  /// In de, this message translates to:
  /// **'z. B. Genitiv: lūnae'**
  String get formKindNounExample;

  /// No description provided for @formKindPluralExample.
  ///
  /// In de, this message translates to:
  /// **'z. B. mice, les chevaux'**
  String get formKindPluralExample;

  /// No description provided for @formKindAdjectiveExample.
  ///
  /// In de, this message translates to:
  /// **'Formen der anderen Geschlechter, z. B. bonus, -a, -um'**
  String get formKindAdjectiveExample;

  /// No description provided for @formKindComparisonExample.
  ///
  /// In de, this message translates to:
  /// **'z. B. good, better, best'**
  String get formKindComparisonExample;

  /// No description provided for @formKindGenderExample.
  ///
  /// In de, this message translates to:
  /// **'bei Nomen, z. B. m, f, n oder der/die/das'**
  String get formKindGenderExample;

  /// No description provided for @formKindInflectionClassExample.
  ///
  /// In de, this message translates to:
  /// **'z. B. a-Deklination, e-Konjugation'**
  String get formKindInflectionClassExample;

  /// No description provided for @formKindGovernmentExample.
  ///
  /// In de, this message translates to:
  /// **'welcher Fall oder welche Präposition folgt, z. B. + Dat., sich freuen über'**
  String get formKindGovernmentExample;

  /// No description provided for @formKindWordClassExample.
  ///
  /// In de, this message translates to:
  /// **'z. B. Verb, Nomen, Adjektiv, Adverb'**
  String get formKindWordClassExample;

  /// Name of the (single) box that holds a lesson's vocabulary.
  ///
  /// In de, this message translates to:
  /// **'Vokabeln'**
  String get vocabModelDefaultBoxName;

  /// Column name in the AI scan prompt and the AI's answer: the word in the foreign language. Keep it short and without '|'.
  ///
  /// In de, this message translates to:
  /// **'Wort'**
  String get aiScanColumnWord;

  /// Column name in the AI scan prompt: the translation. Keep it short and without '|'.
  ///
  /// In de, this message translates to:
  /// **'Übersetzung'**
  String get aiScanColumnTranslation;

  /// Column name in the AI scan prompt: grammatical forms. Keep it short and without '|'.
  ///
  /// In de, this message translates to:
  /// **'Formen'**
  String get aiScanColumnForms;

  /// Used in aiScanPromptIntro as {language} when the lesson has no language set ("Wörter auf der Fremdsprache").
  ///
  /// In de, this message translates to:
  /// **'der Fremdsprache'**
  String get aiScanForeignLanguage;

  /// First line of the instructions sent to an AI app together with a photo of a vocabulary list.
  ///
  /// In de, this message translates to:
  /// **'Lies alle Vokabeln auf dem Foto ab (Wörter auf {language}, Übersetzung auf {translationLanguage}).'**
  String aiScanPromptIntro(String language, String translationLanguage);

  /// AI scan prompt. Must be unique text: the app uses it to tell its own prompt apart from the AI's answer.
  ///
  /// In de, this message translates to:
  /// **'Antworte NUR mit einem einzigen Codeblock in genau diesem Format, ohne weiteren Text:'**
  String get aiScanPromptAnswerOnly;

  /// AI scan prompt: heading of the rules list.
  ///
  /// In de, this message translates to:
  /// **'Regeln:'**
  String get aiScanPromptRules;

  /// AI scan prompt rule. {count} is always 2 or more. Keep " | " exactly.
  ///
  /// In de, this message translates to:
  /// **'Eine Zeile pro Vokabel, die Spalten mit \" | \" getrennt, immer genau {count} Spalten in dieser Reihenfolge: {columns}.'**
  String aiScanPromptRuleColumns(int count, String columns);

  /// AI scan prompt rule.
  ///
  /// In de, this message translates to:
  /// **'Die Zeile mit den Spaltennamen weglassen, die erste Zeile ist immer {marker}.'**
  String aiScanPromptRuleNoHeader(String marker);

  /// AI scan prompt rule for the word column.
  ///
  /// In de, this message translates to:
  /// **'{column}: so geschrieben wie im Foto, mit allen Sonderzeichen und Akzenten.'**
  String aiScanPromptRuleWord(String column);

  /// AI scan prompt rule for the translation column.
  ///
  /// In de, this message translates to:
  /// **'{column}: wie im Foto; mehrere Bedeutungen mit Komma trennen.'**
  String aiScanPromptRuleTranslation(String column);

  /// AI scan prompt rule when the lesson wants all forms; followed by a list of form kinds.
  ///
  /// In de, this message translates to:
  /// **'{column}: ALLE grammatischen Angaben, die im Foto zum Wort stehen – nichts weglassen. Zum Beispiel (aber nicht nur):'**
  String aiScanPromptRuleAllForms(String column);

  /// AI scan prompt, after the list of form kinds (all forms).
  ///
  /// In de, this message translates to:
  /// **'Auch alles andere, was zum Wort gehört (Abkürzungen, Hinweise in Klammern), gehört hierher. Mehrere Angaben mit Komma trennen.'**
  String get aiScanPromptRuleAllFormsMore;

  /// AI scan prompt, all forms: what to write if there is nothing. Keep "-".
  ///
  /// In de, this message translates to:
  /// **'Steht im Foto keine Angabe zum Wort, dann \"-\".'**
  String get aiScanPromptRuleAllFormsNone;

  /// AI scan prompt rule when the lesson wants only some kinds of forms; followed by a list.
  ///
  /// In de, this message translates to:
  /// **'{column}: nur diese Angaben, mehrere mit Komma getrennt:'**
  String aiScanPromptRuleSomeForms(String column);

  /// AI scan prompt: kinds of forms the AI should leave out.
  ///
  /// In de, this message translates to:
  /// **'Weglassen: {kinds}.'**
  String aiScanPromptRuleOmit(String kinds);

  /// AI scan prompt, some forms: what to write if there is nothing. Keep "-".
  ///
  /// In de, this message translates to:
  /// **'Hat ein Wort keine solchen Angaben (z. B. ein Adverb), steht dort \"-\".'**
  String get aiScanPromptRuleSomeFormsNone;

  /// AI scan prompt rule for a custom field of the lesson. Keep "-".
  ///
  /// In de, this message translates to:
  /// **'{label}: aus dem Foto; steht dort nichts, dann \"-\".'**
  String aiScanPromptRuleExtra(String label);

  /// AI scan prompt rule. Keep "-".
  ///
  /// In de, this message translates to:
  /// **'Fehlt eine Angabe, schreib \"-\". Erfinde nichts, was nicht im Foto steht.'**
  String get aiScanPromptRuleMissing;

  /// AI scan prompt rule. Keep "|".
  ///
  /// In de, this message translates to:
  /// **'Kein \"|\" innerhalb einer Spalte verwenden.'**
  String get aiScanPromptRuleNoPipe;

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
  /// **'Dein Fortschritt wird nur auf diesem Gerät gespeichert. Mach ab und zu eine Sicherung – damit kannst du auch auf ein anderes Gerät umziehen.'**
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
  /// **'Benachrichtigungen sind blockiert. Erlaube sie in den Android-Einstellungen für den Vokabeltrainer.'**
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

  /// Home screen greeting late at night (before 5 am), user has no name set.
  ///
  /// In de, this message translates to:
  /// **'Noch wach? 🌙'**
  String get dashboardGreetingNight;

  /// Home screen greeting late at night (before 5 am) with the user's name.
  ///
  /// In de, this message translates to:
  /// **'Noch wach, {name}? 🌙'**
  String dashboardGreetingNightName(String name);

  /// Home screen greeting in the morning (5–11 am), no name set.
  ///
  /// In de, this message translates to:
  /// **'Guten Morgen! ☀️'**
  String get dashboardGreetingMorning;

  /// Home screen greeting in the morning with the user's name.
  ///
  /// In de, this message translates to:
  /// **'Guten Morgen, {name}! ☀️'**
  String dashboardGreetingMorningName(String name);

  /// Home screen greeting during the day (11 am–6 pm), no name set.
  ///
  /// In de, this message translates to:
  /// **'Hallo! 👋'**
  String get dashboardGreetingDay;

  /// Home screen greeting during the day with the user's name.
  ///
  /// In de, this message translates to:
  /// **'Hallo, {name}! 👋'**
  String dashboardGreetingDayName(String name);

  /// Home screen greeting in the evening (after 6 pm), no name set.
  ///
  /// In de, this message translates to:
  /// **'Guten Abend! 🌆'**
  String get dashboardGreetingEvening;

  /// Home screen greeting in the evening with the user's name.
  ///
  /// In de, this message translates to:
  /// **'Guten Abend, {name}! 🌆'**
  String dashboardGreetingEveningName(String name);

  /// Label below the streak number in a small stat tile (the number is shown separately above).
  ///
  /// In de, this message translates to:
  /// **'{count, plural, =1{Tag Serie} other{Tage Serie}}'**
  String dashboardStreakLabel(int count);

  /// Label below the number of reviews done today (stat tile).
  ///
  /// In de, this message translates to:
  /// **'heute geübt'**
  String get dashboardPracticedToday;

  /// Label below the number of known words: "<known> of {total} known" (stat tile).
  ///
  /// In de, this message translates to:
  /// **'von {total} gewusst'**
  String dashboardKnownOf(int total);

  /// Home screen tile opening the practice lists.
  ///
  /// In de, this message translates to:
  /// **'Übungslisten'**
  String get dashboardPracticeLists;

  /// Subtitle of the practice lists tile when no list exists yet.
  ///
  /// In de, this message translates to:
  /// **'Stell dir Vokabeln für einen Test zusammen'**
  String get dashboardPracticeListsEmpty;

  /// Subtitle of the practice lists tile: number of lists.
  ///
  /// In de, this message translates to:
  /// **'{count, plural, =1{1 Liste} other{{count} Listen}}'**
  String dashboardListCount(int count);

  /// Home screen tile opening the tutorial.
  ///
  /// In de, this message translates to:
  /// **'Hilfe & Anleitung'**
  String get dashboardHelpTitle;

  /// Subtitle of the help tile.
  ///
  /// In de, this message translates to:
  /// **'So funktioniert der Vokabeltrainer'**
  String get dashboardHelpSubtitle;

  /// Below the greeting when the learning streak is 0.
  ///
  /// In de, this message translates to:
  /// **'Starte heute deine Lernserie!'**
  String get dashboardStreakNone;

  /// Below the greeting when the learning streak is 1 day.
  ///
  /// In de, this message translates to:
  /// **'Tag 1 deiner Lernserie – weiter so!'**
  String get dashboardStreakFirstDay;

  /// Below the greeting: learned {count} days in a row (count is always 2 or more).
  ///
  /// In de, this message translates to:
  /// **'🔥 {count} Tage in Folge gelernt!'**
  String dashboardStreakRun(int count);

  /// Title of the "Today" card when the user has no practice list yet.
  ///
  /// In de, this message translates to:
  /// **'Leg los!'**
  String get dashboardGetStarted;

  /// Hint on the home screen when lessons exist but no practice list.
  ///
  /// In de, this message translates to:
  /// **'Erstelle jetzt eine Übungsliste: Gib ihr einen Namen und wähle die Vokabeln aus, die du lernen willst.'**
  String get dashboardNoListsHint;

  /// Hint on the home screen when no lesson exists yet.
  ///
  /// In de, this message translates to:
  /// **'Leg zuerst eine Lektion an. Die Vokabeln tippst du selbst ein oder scannst sie mit einer KI-App aus deinem Buch.'**
  String get dashboardNoLessonsHint;

  /// Button: create a practice list.
  ///
  /// In de, this message translates to:
  /// **'Übungsliste erstellen'**
  String get dashboardCreateList;

  /// Button: create a lesson.
  ///
  /// In de, this message translates to:
  /// **'Lektion anlegen'**
  String get dashboardCreateLesson;

  /// Title of the "Today" card when nothing is due anymore.
  ///
  /// In de, this message translates to:
  /// **'Für heute alles erledigt!'**
  String get dashboardAllDone;

  /// Title of the card with today's due and new words.
  ///
  /// In de, this message translates to:
  /// **'Heute'**
  String get dashboardToday;

  /// Shown when everything is done for today; count = number of answered questions today.
  ///
  /// In de, this message translates to:
  /// **'{count, plural, =1{Du hast heute 1 Abfrage geschafft. Morgen geht es weiter!} other{Du hast heute {count} Abfragen geschafft. Morgen geht es weiter!}}'**
  String dashboardDoneReviewed(int count);

  /// Shown when nothing is due and nothing was practiced today.
  ///
  /// In de, this message translates to:
  /// **'Gerade ist nichts fällig. Schau morgen wieder vorbei!'**
  String get dashboardNothingDue;

  /// Label below the big number of words due for review today ("to review").
  ///
  /// In de, this message translates to:
  /// **'wiederholen'**
  String get dashboardDueLabel;

  /// Label below the big number of new words for today.
  ///
  /// In de, this message translates to:
  /// **'neu'**
  String get dashboardNewLabel;

  /// Small hint below the start button: the words come from your practice lists.
  ///
  /// In de, this message translates to:
  /// **'Aus deinen Übungslisten'**
  String get dashboardFromLists;

  /// Exam countdown card: the test with this list name is today.
  ///
  /// In de, this message translates to:
  /// **'Heute ist „{name}\"!'**
  String dashboardExamToday(String name);

  /// Exam countdown card text on the day of the test.
  ///
  /// In de, this message translates to:
  /// **'Du hast geübt – jetzt zeig, was du kannst. Viel Erfolg!'**
  String get dashboardExamTodayText;

  /// Exam countdown card: the test with this list name is tomorrow.
  ///
  /// In de, this message translates to:
  /// **'Morgen ist „{name}\"!'**
  String dashboardExamTomorrow(String name);

  /// Exam countdown card text the day before the test.
  ///
  /// In de, this message translates to:
  /// **'Heute ist der letzte Lerntag – alles wird noch einmal wiederholt.'**
  String get dashboardExamTomorrowText;

  /// Exam countdown card title: test {name} is in {days} days (days is always 2 or more).
  ///
  /// In de, this message translates to:
  /// **'„{name}\" in {days} Tagen'**
  String dashboardExamInDays(String name, int days);

  /// Exam countdown text when the test is 2–3 days away; count = remaining study days.
  ///
  /// In de, this message translates to:
  /// **'{count, plural, =1{Endspurt! Noch 1 Lerntag – jeder zählt.} other{Endspurt! Noch {count} Lerntage – jeder zählt.}}'**
  String dashboardExamFinalSpurt(int count);

  /// Exam countdown text when the test is more than 3 days away; count = remaining study days.
  ///
  /// In de, this message translates to:
  /// **'{count, plural, =1{Noch 1 Lerntag. Die App verteilt die Vokabeln so, dass du rechtzeitig fertig bist.} other{Noch {count} Lerntage. Die App verteilt die Vokabeln so, dass du rechtzeitig fertig bist.}}'**
  String dashboardExamDaysLeft(int count);

  /// Snackbar when the user wants to create a practice list but no lesson has words. "Lektionen" is the name of the lessons tab.
  ///
  /// In de, this message translates to:
  /// **'Leg zuerst unter „Lektionen\" eine Lektion mit Vokabeln an.'**
  String get practiceListsNeedLesson;

  /// Snackbar when the maximum number of practice lists is reached.
  ///
  /// In de, this message translates to:
  /// **'Limit erreicht: Du kannst höchstens {max} Listen gleichzeitig haben.'**
  String practiceListsLimit(int max);

  /// Suffix after the test date in a list subtitle: the test is over. Keep the leading " · ".
  ///
  /// In de, this message translates to:
  /// **' · vorbei ✅'**
  String get practiceListsCountdownPast;

  /// Suffix after the test date in a list subtitle: the test is today. Keep the leading " · ".
  ///
  /// In de, this message translates to:
  /// **' · heute! 🍀'**
  String get practiceListsCountdownToday;

  /// Suffix after the test date in a list subtitle: the test is tomorrow. Keep the leading " · ".
  ///
  /// In de, this message translates to:
  /// **' · morgen!'**
  String get practiceListsCountdownTomorrow;

  /// Suffix after the test date in a list subtitle: test in {days} days (always 2 or more). Keep the leading " · ".
  ///
  /// In de, this message translates to:
  /// **' · noch {days} Tage'**
  String practiceListsCountdownDays(int days);

  /// Title of the dialog asking for the (optional) date of the vocabulary test when creating a list.
  ///
  /// In de, this message translates to:
  /// **'Wann ist der Vokabeltest?'**
  String get practiceListsDueDateTitle;

  /// Dialog title and menu item: change the test date of a list.
  ///
  /// In de, this message translates to:
  /// **'Testdatum ändern'**
  String get practiceListsChangeDueDate;

  /// Explanation in the test date dialog.
  ///
  /// In de, this message translates to:
  /// **'Optional. Die App verteilt die Vokabeln so, dass du bis zum Tag vor dem Test alles kannst – am Testtag selbst musst du nicht mehr üben.'**
  String get practiceListsDueDateHint;

  /// Button in the test date dialog that opens the date picker.
  ///
  /// In de, this message translates to:
  /// **'Datum wählen'**
  String get practiceListsPickDate;

  /// Button in the "change test date" dialog that removes the date.
  ///
  /// In de, this message translates to:
  /// **'Entfernen'**
  String get practiceListsRemoveDate;

  /// Snackbar after turning on notifications for the list {name}.
  ///
  /// In de, this message translates to:
  /// **'Erinnerungen für „{name}\" sind an.'**
  String practiceListsNotifyOnSnack(String name);

  /// Snackbar after turning off notifications for the list {name}.
  ///
  /// In de, this message translates to:
  /// **'Keine Erinnerungen mehr für „{name}\".'**
  String practiceListsNotifyOffSnack(String name);

  /// Title of the confirmation dialog for deleting the practice list {name}.
  ///
  /// In de, this message translates to:
  /// **'„{name}\" löschen?'**
  String practiceListsDeleteTitle(String name);

  /// Text of the delete confirmation dialog.
  ///
  /// In de, this message translates to:
  /// **'Die Übungsliste wird entfernt.'**
  String get practiceListsDeleteText;

  /// Snackbar when practicing a list without words.
  ///
  /// In de, this message translates to:
  /// **'Diese Liste enthält keine Vokabeln.'**
  String get practiceListsNoVocabs;

  /// App bar title of the practice lists screen.
  ///
  /// In de, this message translates to:
  /// **'Deine Übungslisten'**
  String get practiceListsTitle;

  /// Floating button: create a new practice list.
  ///
  /// In de, this message translates to:
  /// **'Neue Liste'**
  String get practiceListsNew;

  /// Empty state title of the practice lists screen.
  ///
  /// In de, this message translates to:
  /// **'Noch keine Übungslisten'**
  String get practiceListsEmptyTitle;

  /// Empty state text of the practice lists screen.
  ///
  /// In de, this message translates to:
  /// **'Erstelle deine erste Liste über den Button unten.'**
  String get practiceListsEmptyText;

  /// Subtitle of a practice list with a test date. {vocabs} is e.g. "12 Vokabeln", {date} the formatted test date. A countdown suffix may follow.
  ///
  /// In de, this message translates to:
  /// **'{vocabs} · Test: {date}'**
  String practiceListsSubtitleTest(String vocabs, String date);

  /// Menu item: turn off notifications for this list.
  ///
  /// In de, this message translates to:
  /// **'Erinnerungen ausschalten'**
  String get practiceListsNotifyDisable;

  /// Menu item: turn on notifications for this list.
  ///
  /// In de, this message translates to:
  /// **'Erinnerungen einschalten'**
  String get practiceListsNotifyEnable;

  /// Title of the dialog asking for the name of a new practice list.
  ///
  /// In de, this message translates to:
  /// **'Neue Übungsliste'**
  String get practiceListsNameDialogTitle;

  /// Text field label in the new list dialog.
  ///
  /// In de, this message translates to:
  /// **'Name der Liste'**
  String get practiceListsNameLabel;

  /// Example name in the new list dialog.
  ///
  /// In de, this message translates to:
  /// **'z. B. Vokabeltest 1'**
  String get practiceListsNameHint;

  /// Snackbar when the "due & new" filter selects no words. „Alle“ must match practiceFilterAll.
  ///
  /// In de, this message translates to:
  /// **'Für heute ist nichts mehr fällig – super! 😎 Wähle „Alle“, wenn du trotzdem üben willst.'**
  String get practiceNothingDue;

  /// Snackbar when the "weak" filter selects no words.
  ///
  /// In de, this message translates to:
  /// **'Keine schwachen Vokabeln vorhanden. 😎'**
  String get practiceNoWeak;

  /// App bar title of the screen where the practice mode is chosen.
  ///
  /// In de, this message translates to:
  /// **'Modus wählen'**
  String get practiceTitle;

  /// Number of words available for this practice session.
  ///
  /// In de, this message translates to:
  /// **'{count, plural, =1{1 Vokabel ausgewählt} other{{count} Vokabeln ausgewählt}}'**
  String practiceSelectedCount(int count);

  /// Practice mode: flashcards with self-rating.
  ///
  /// In de, this message translates to:
  /// **'Karteikarten'**
  String get practiceModeFlashcards;

  /// Practice mode: typing the answers.
  ///
  /// In de, this message translates to:
  /// **'Test'**
  String get practiceModeTest;

  /// Heading above the word filter (due & new / all / weak).
  ///
  /// In de, this message translates to:
  /// **'Welche Vokabeln?'**
  String get practiceWhichVocabs;

  /// Filter: words due for review plus new words (spaced repetition).
  ///
  /// In de, this message translates to:
  /// **'Fällig & neu'**
  String get practiceFilterSmart;

  /// Filter: all selected words.
  ///
  /// In de, this message translates to:
  /// **'Alle'**
  String get practiceFilterAll;

  /// Filter: only weak words (often answered wrong).
  ///
  /// In de, this message translates to:
  /// **'Schwache'**
  String get practiceFilterWeak;

  /// Summary of the "due & new" filter: number of due and new words.
  ///
  /// In de, this message translates to:
  /// **'{due} fällig · {fresh} neu'**
  String practicePlanSummary(int due, int fresh);

  /// Like practicePlanSummary, plus {later} new words that are scheduled for later days.
  ///
  /// In de, this message translates to:
  /// **'{due} fällig · {fresh} neu ({later} weitere später)'**
  String practicePlanSummaryLater(int due, int fresh, int later);

  /// Explanation of the flashcard mode. The four ratings must match flashcardRateAgain/Hard/Good/Easy.
  ///
  /// In de, this message translates to:
  /// **'Ein Wort wird angezeigt. Du deckst die Bedeutung auf und bewertest dich selbst: Nochmal, Schwer, Gut oder Leicht.'**
  String get practiceFlashcardsHint;

  /// Explanation of the test (typing) mode.
  ///
  /// In de, this message translates to:
  /// **'Ein Wort wird angezeigt. Du gibst Übersetzung und Formen selbst ein.'**
  String get practiceTestHint;

  /// Paragraph explaining the "due & new" filter (shown below the mode explanation). „Fällig & neu“ must match practiceFilterSmart.
  ///
  /// In de, this message translates to:
  /// **'„Fällig & neu“ nutzt Spaced Repetition (FSRS): Jede Vokabel kommt genau dann wieder, kurz bevor du sie vergessen würdest. Hat die Liste ein Testdatum, werden die neuen Vokabeln auf die Tage bis zum Vortag verteilt und vorher alles noch einmal wiederholt.'**
  String get practiceSmartHint;

  /// Button that starts the practice session.
  ///
  /// In de, this message translates to:
  /// **'Starten'**
  String get practiceStart;

  /// Small label above the word on a flashcard when the lesson has no language set.
  ///
  /// In de, this message translates to:
  /// **'Wort'**
  String get flashcardWord;

  /// Small label above the translation on a flashcard when the lesson has no translation language.
  ///
  /// In de, this message translates to:
  /// **'Übersetzung'**
  String get flashcardTranslation;

  /// App bar title in flashcard mode: card number out of total.
  ///
  /// In de, this message translates to:
  /// **'Karte {current} / {total}'**
  String flashcardTitle(int current, int total);

  /// Hint at the bottom of the flashcard front.
  ///
  /// In de, this message translates to:
  /// **'Tippen zum Umdrehen'**
  String get flashcardTapToFlip;

  /// Button that flips the flashcard.
  ///
  /// In de, this message translates to:
  /// **'Umdrehen'**
  String get flashcardFlip;

  /// Self-rating button: did not know it, show again. Keep short (4 buttons in a row).
  ///
  /// In de, this message translates to:
  /// **'Nochmal'**
  String get flashcardRateAgain;

  /// Self-rating button: knew it with difficulty. Keep short.
  ///
  /// In de, this message translates to:
  /// **'Schwer'**
  String get flashcardRateHard;

  /// Self-rating button: knew it. Keep short.
  ///
  /// In de, this message translates to:
  /// **'Gut'**
  String get flashcardRateGood;

  /// Self-rating button: knew it easily. Keep short.
  ///
  /// In de, this message translates to:
  /// **'Leicht'**
  String get flashcardRateEasy;

  /// Label of the answer field for the translation; {language} is the translation language name.
  ///
  /// In de, this message translates to:
  /// **'Übersetzung ({language})'**
  String testTranslationLabel(String language);

  /// Label of the answer field for the foreign word when the lesson has no language.
  ///
  /// In de, this message translates to:
  /// **'Wort'**
  String get testWordLabel;

  /// Label of the answer field for the foreign word; {language} is the lesson language name.
  ///
  /// In de, this message translates to:
  /// **'Wort ({language})'**
  String testWordLabelWithLanguage(String language);

  /// Label of the answer field for the grammatical forms (e.g. "amo, amavi, amatum").
  ///
  /// In de, this message translates to:
  /// **'Formen'**
  String get testFormsLabel;

  /// App bar title in test mode: question number out of total.
  ///
  /// In de, this message translates to:
  /// **'Test {current} / {total}'**
  String testTitle(int current, int total);

  /// Prompt above the word to translate in test mode.
  ///
  /// In de, this message translates to:
  /// **'Übersetze:'**
  String get testTranslate;

  /// Shown below a wrong answer field: the correct answer.
  ///
  /// In de, this message translates to:
  /// **'Richtig: {answer}'**
  String testCorrectAnswer(String answer);

  /// Error text of a wrongly answered field.
  ///
  /// In de, this message translates to:
  /// **'Falsch'**
  String get testWrong;

  /// Feedback after checking: everything correct.
  ///
  /// In de, this message translates to:
  /// **'Richtig! 🎉'**
  String get testResultCorrect;

  /// Feedback after checking: something was wrong.
  ///
  /// In de, this message translates to:
  /// **'Leider falsch.'**
  String get testResultWrong;

  /// Button that checks the typed answers.
  ///
  /// In de, this message translates to:
  /// **'Prüfen'**
  String get testCheck;

  /// Column header in the word selection list: the foreign word.
  ///
  /// In de, this message translates to:
  /// **'Wort'**
  String get selectionColumnWord;

  /// Column header in the word selection list: grammatical forms.
  ///
  /// In de, this message translates to:
  /// **'Formen'**
  String get selectionColumnForms;

  /// Column header in the word selection list: the translation.
  ///
  /// In de, this message translates to:
  /// **'Übersetzung'**
  String get selectionColumnTranslation;

  /// App bar title of the word selection screen.
  ///
  /// In de, this message translates to:
  /// **'Vokabeln auswählen'**
  String get selectionTitle;

  /// Tooltip of the menu with "select all" / "clear selection".
  ///
  /// In de, this message translates to:
  /// **'Auswahl'**
  String get selectionMenuTooltip;

  /// Menu item: select all words.
  ///
  /// In de, this message translates to:
  /// **'Alle auswählen'**
  String get selectionSelectAll;

  /// Menu item: clear the selection.
  ///
  /// In de, this message translates to:
  /// **'Auswahl aufheben'**
  String get selectionClear;

  /// Confirm button of the word selection: {label} is e.g. "Fertig", {vocabs} the number of selected words, e.g. "12 Vokabeln".
  ///
  /// In de, this message translates to:
  /// **'{label} ({vocabs})'**
  String selectionConfirm(String label, String vocabs);

  /// Bottom navigation label of the home tab. Keep short.
  ///
  /// In de, this message translates to:
  /// **'Start'**
  String get homeTabStart;

  /// Bottom navigation label and app bar title of the lessons tab. Keep short.
  ///
  /// In de, this message translates to:
  /// **'Lektionen'**
  String get homeTabLessons;

  /// Bottom navigation label and app bar title of the statistics/analysis tab. Keep short.
  ///
  /// In de, this message translates to:
  /// **'Analyse'**
  String get homeTabAnalysis;

  /// Session summary title for 90% or more correct.
  ///
  /// In de, this message translates to:
  /// **'Hervorragend!'**
  String get sessionSummaryExcellent;

  /// Session summary title for 70–89% correct.
  ///
  /// In de, this message translates to:
  /// **'Super gemacht!'**
  String get sessionSummaryGreat;

  /// Session summary title for 40–69% correct.
  ///
  /// In de, this message translates to:
  /// **'Gut geübt!'**
  String get sessionSummaryGood;

  /// Session summary title for less than 40% correct (encouraging: keep at it).
  ///
  /// In de, this message translates to:
  /// **'Dranbleiben!'**
  String get sessionSummaryKeepGoing;

  /// Session summary: number of words known on the first try out of all words.
  ///
  /// In de, this message translates to:
  /// **'{correct} von {total} beim ersten Versuch gewusst.'**
  String sessionSummaryScore(int correct, int total);

  /// Small note in the session summary.
  ///
  /// In de, this message translates to:
  /// **'Die App plant automatisch, wann jede Vokabel wieder drankommt.'**
  String get sessionSummaryScheduled;

  /// Session summary button: practice the same words again.
  ///
  /// In de, this message translates to:
  /// **'Nochmal'**
  String get sessionSummaryRestart;

  /// Title and tooltip of the "What's new?" sheet.
  ///
  /// In de, this message translates to:
  /// **'Was ist neu?'**
  String get changelogTitle;

  /// Button that closes the "What's new?" sheet.
  ///
  /// In de, this message translates to:
  /// **'Alles klar!'**
  String get changelogGotIt;

  /// "What's new?" entry 6: title.
  ///
  /// In de, this message translates to:
  /// **'🔒 Datenschutz auf einen Blick'**
  String get changelog6Title;

  /// "What's new?" entry 6: text.
  ///
  /// In de, this message translates to:
  /// **'Unter Einstellungen → „Über die App\" findest du die Datenschutzerklärung und die Einführung zum Nachlesen: Alles bleibt auf deinem Handy, und die App ist ohne Werbung und ohne Käufe.'**
  String get changelog6Text;

  /// "What's new?" entry 5: title.
  ///
  /// In de, this message translates to:
  /// **'🤖 Scannen nur mit KI-Apps'**
  String get changelog5Title;

  /// "What's new?" entry 5: text.
  ///
  /// In de, this message translates to:
  /// **'Beim Scannen siehst du nur noch KI-Apps wie ChatGPT oder Gemini zur Auswahl. Die Anleitung für die KI wird gleich mitgeschickt.'**
  String get changelog5Text;

  /// "What's new?" entry 4: title.
  ///
  /// In de, this message translates to:
  /// **'🧩 Mehr Formen'**
  String get changelog4Title;

  /// "What's new?" entry 4: text.
  ///
  /// In de, this message translates to:
  /// **'Neu bei den Formen: Plural, Steigerung, Fall/Präposition, Deklination/Konjugation und Wortart. Mit „Alles\" übernimmt die KI wirklich alles, was im Buch zum Wort steht.'**
  String get changelog4Text;

  /// "What's new?" entry 3: title.
  ///
  /// In de, this message translates to:
  /// **'👋 Mit deinem Namen'**
  String get changelog3Title;

  /// "What's new?" entry 3: text.
  ///
  /// In de, this message translates to:
  /// **'Wenn du magst, begrüßt dich die App mit Namen – auch in den Erinnerungen. Ändern kannst du ihn in den Einstellungen.'**
  String get changelog3Text;

  /// "What's new?" entry 2: title.
  ///
  /// In de, this message translates to:
  /// **'💡 Kurze Tipps'**
  String get changelog2Title;

  /// "What's new?" entry 2: text.
  ///
  /// In de, this message translates to:
  /// **'Beim ersten Mal erklärt ein kleines Fenster, wie Lektion anlegen, Eintippen und Scannen funktionieren. Mit „Nicht mehr anzeigen\" ist es weg.'**
  String get changelog2Text;

  /// "What's new?" entry 1: title.
  ///
  /// In de, this message translates to:
  /// **'📚 Lektionen in jeder Sprache'**
  String get changelog1Title;

  /// "What's new?" entry 1: text.
  ///
  /// In de, this message translates to:
  /// **'Leg eigene Lektionen an – Englisch, Französisch, Latein oder was du lernst – und tipp die Vokabeln ein oder scanne sie aus dem Buch.'**
  String get changelog1Text;

  /// Very short interval until a card comes back, in minutes (shown under rating buttons). Keep it short.
  ///
  /// In de, this message translates to:
  /// **'{n} Min'**
  String intervalMinutes(int n);

  /// Short interval in hours (abbreviated, very short).
  ///
  /// In de, this message translates to:
  /// **'{n} Std'**
  String intervalHours(int n);

  /// Interval in days (abbreviated, very short, e.g. "3 d").
  ///
  /// In de, this message translates to:
  /// **'{n} T'**
  String intervalDays(int n);

  /// Interval in months (abbreviated, very short).
  ///
  /// In de, this message translates to:
  /// **'{n} Mon'**
  String intervalMonths(int n);

  /// Interval in years (abbreviated, very short). n is a decimal like 1.5.
  ///
  /// In de, this message translates to:
  /// **'{n} J'**
  String intervalYears(String n);

  /// What's-new entry 7 title: the app is now available in 10 languages.
  ///
  /// In de, this message translates to:
  /// **'🌍 Jetzt in 10 Sprachen'**
  String get changelog7Title;

  /// What's-new entry 7 text.
  ///
  /// In de, this message translates to:
  /// **'Die App gibt es jetzt auf Deutsch, Englisch, Spanisch, Französisch, Italienisch, Portugiesisch, Polnisch, Türkisch, Russisch und Chinesisch. Umstellen kannst du die Sprache in den Einstellungen.'**
  String get changelog7Text;

  /// App name (short, also under the launcher icon – keep it under ~12 characters).
  ///
  /// In de, this message translates to:
  /// **'Vokabeltrainer'**
  String get appTitle;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'de',
        'en',
        'es',
        'fr',
        'it',
        'pl',
        'pt',
        'ru',
        'tr',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'tr':
      return AppLocalizationsTr();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
