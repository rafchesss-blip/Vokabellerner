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
