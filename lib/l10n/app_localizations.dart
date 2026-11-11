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
  /// **'So funktioniert der Vokabellerner'**
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
