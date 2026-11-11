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

  @override
  String get dashboardGreetingNight => 'Noch wach? 🌙';

  @override
  String dashboardGreetingNightName(String name) {
    return 'Noch wach, $name? 🌙';
  }

  @override
  String get dashboardGreetingMorning => 'Guten Morgen! ☀️';

  @override
  String dashboardGreetingMorningName(String name) {
    return 'Guten Morgen, $name! ☀️';
  }

  @override
  String get dashboardGreetingDay => 'Hallo! 👋';

  @override
  String dashboardGreetingDayName(String name) {
    return 'Hallo, $name! 👋';
  }

  @override
  String get dashboardGreetingEvening => 'Guten Abend! 🌆';

  @override
  String dashboardGreetingEveningName(String name) {
    return 'Guten Abend, $name! 🌆';
  }

  @override
  String dashboardStreakLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tage Serie',
      one: 'Tag Serie',
    );
    return '$_temp0';
  }

  @override
  String get dashboardPracticedToday => 'heute geübt';

  @override
  String dashboardKnownOf(int total) {
    return 'von $total gewusst';
  }

  @override
  String get dashboardPracticeLists => 'Übungslisten';

  @override
  String get dashboardPracticeListsEmpty =>
      'Stell dir Vokabeln für einen Test zusammen';

  @override
  String dashboardListCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Listen',
      one: '1 Liste',
    );
    return '$_temp0';
  }

  @override
  String get dashboardHelpTitle => 'Hilfe & Anleitung';

  @override
  String get dashboardHelpSubtitle => 'So funktioniert der Vokabellerner';

  @override
  String get dashboardStreakNone => 'Starte heute deine Lernserie!';

  @override
  String get dashboardStreakFirstDay => 'Tag 1 deiner Lernserie – weiter so!';

  @override
  String dashboardStreakRun(int count) {
    return '🔥 $count Tage in Folge gelernt!';
  }

  @override
  String get dashboardGetStarted => 'Leg los!';

  @override
  String get dashboardNoListsHint =>
      'Erstelle jetzt eine Übungsliste: Gib ihr einen Namen und wähle die Vokabeln aus, die du lernen willst.';

  @override
  String get dashboardNoLessonsHint =>
      'Leg zuerst eine Lektion an. Die Vokabeln tippst du selbst ein oder scannst sie mit einer KI-App aus deinem Buch.';

  @override
  String get dashboardCreateList => 'Übungsliste erstellen';

  @override
  String get dashboardCreateLesson => 'Lektion anlegen';

  @override
  String get dashboardAllDone => 'Für heute alles erledigt!';

  @override
  String get dashboardToday => 'Heute';

  @override
  String dashboardDoneReviewed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Du hast heute $count Abfragen geschafft. Morgen geht es weiter!',
      one: 'Du hast heute 1 Abfrage geschafft. Morgen geht es weiter!',
    );
    return '$_temp0';
  }

  @override
  String get dashboardNothingDue =>
      'Gerade ist nichts fällig. Schau morgen wieder vorbei!';

  @override
  String get dashboardDueLabel => 'wiederholen';

  @override
  String get dashboardNewLabel => 'neu';

  @override
  String get dashboardFromLists => 'Aus deinen Übungslisten';

  @override
  String dashboardExamToday(String name) {
    return 'Heute ist „$name\"!';
  }

  @override
  String get dashboardExamTodayText =>
      'Du hast geübt – jetzt zeig, was du kannst. Viel Erfolg!';

  @override
  String dashboardExamTomorrow(String name) {
    return 'Morgen ist „$name\"!';
  }

  @override
  String get dashboardExamTomorrowText =>
      'Heute ist der letzte Lerntag – alles wird noch einmal wiederholt.';

  @override
  String dashboardExamInDays(String name, int days) {
    return '„$name\" in $days Tagen';
  }

  @override
  String dashboardExamFinalSpurt(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Endspurt! Noch $count Lerntage – jeder zählt.',
      one: 'Endspurt! Noch 1 Lerntag – jeder zählt.',
    );
    return '$_temp0';
  }

  @override
  String dashboardExamDaysLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Noch $count Lerntage. Die App verteilt die Vokabeln so, dass du rechtzeitig fertig bist.',
      one:
          'Noch 1 Lerntag. Die App verteilt die Vokabeln so, dass du rechtzeitig fertig bist.',
    );
    return '$_temp0';
  }

  @override
  String get practiceListsNeedLesson =>
      'Leg zuerst unter „Lektionen\" eine Lektion mit Vokabeln an.';

  @override
  String practiceListsLimit(int max) {
    return 'Limit erreicht: Du kannst höchstens $max Listen gleichzeitig haben.';
  }

  @override
  String get practiceListsCountdownPast => ' · vorbei ✅';

  @override
  String get practiceListsCountdownToday => ' · heute! 🍀';

  @override
  String get practiceListsCountdownTomorrow => ' · morgen!';

  @override
  String practiceListsCountdownDays(int days) {
    return ' · noch $days Tage';
  }

  @override
  String get practiceListsDueDateTitle => 'Wann ist der Vokabeltest?';

  @override
  String get practiceListsChangeDueDate => 'Testdatum ändern';

  @override
  String get practiceListsDueDateHint =>
      'Optional. Die App verteilt die Vokabeln so, dass du bis zum Tag vor dem Test alles kannst – am Testtag selbst musst du nicht mehr üben.';

  @override
  String get practiceListsPickDate => 'Datum wählen';

  @override
  String get practiceListsRemoveDate => 'Entfernen';

  @override
  String practiceListsNotifyOnSnack(String name) {
    return 'Erinnerungen für „$name\" sind an.';
  }

  @override
  String practiceListsNotifyOffSnack(String name) {
    return 'Keine Erinnerungen mehr für „$name\".';
  }

  @override
  String practiceListsDeleteTitle(String name) {
    return '„$name\" löschen?';
  }

  @override
  String get practiceListsDeleteText => 'Die Übungsliste wird entfernt.';

  @override
  String get practiceListsNoVocabs => 'Diese Liste enthält keine Vokabeln.';

  @override
  String get practiceListsTitle => 'Deine Übungslisten';

  @override
  String get practiceListsNew => 'Neue Liste';

  @override
  String get practiceListsEmptyTitle => 'Noch keine Übungslisten';

  @override
  String get practiceListsEmptyText =>
      'Erstelle deine erste Liste über den Button unten.';

  @override
  String practiceListsSubtitleTest(String vocabs, String date) {
    return '$vocabs · Test: $date';
  }

  @override
  String get practiceListsNotifyDisable => 'Erinnerungen ausschalten';

  @override
  String get practiceListsNotifyEnable => 'Erinnerungen einschalten';

  @override
  String get practiceListsNameDialogTitle => 'Neue Übungsliste';

  @override
  String get practiceListsNameLabel => 'Name der Liste';

  @override
  String get practiceListsNameHint => 'z. B. Vokabeltest 1';

  @override
  String get practiceNothingDue =>
      'Für heute ist nichts mehr fällig – super! 😎 Wähle „Alle“, wenn du trotzdem üben willst.';

  @override
  String get practiceNoWeak => 'Keine schwachen Vokabeln vorhanden. 😎';

  @override
  String get practiceTitle => 'Modus wählen';

  @override
  String practiceSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Vokabeln ausgewählt',
      one: '1 Vokabel ausgewählt',
    );
    return '$_temp0';
  }

  @override
  String get practiceModeFlashcards => 'Karteikarten';

  @override
  String get practiceModeTest => 'Test';

  @override
  String get practiceWhichVocabs => 'Welche Vokabeln?';

  @override
  String get practiceFilterSmart => 'Fällig & neu';

  @override
  String get practiceFilterAll => 'Alle';

  @override
  String get practiceFilterWeak => 'Schwache';

  @override
  String practicePlanSummary(int due, int fresh) {
    return '$due fällig · $fresh neu';
  }

  @override
  String practicePlanSummaryLater(int due, int fresh, int later) {
    return '$due fällig · $fresh neu ($later weitere später)';
  }

  @override
  String get practiceFlashcardsHint =>
      'Ein Wort wird angezeigt. Du deckst die Bedeutung auf und bewertest dich selbst: Nochmal, Schwer, Gut oder Leicht.';

  @override
  String get practiceTestHint =>
      'Ein Wort wird angezeigt. Du gibst Übersetzung und Formen selbst ein.';

  @override
  String get practiceSmartHint =>
      '„Fällig & neu“ nutzt Spaced Repetition (FSRS): Jede Vokabel kommt genau dann wieder, kurz bevor du sie vergessen würdest. Hat die Liste ein Testdatum, werden die neuen Vokabeln auf die Tage bis zum Vortag verteilt und vorher alles noch einmal wiederholt.';

  @override
  String get practiceStart => 'Starten';

  @override
  String get flashcardWord => 'Wort';

  @override
  String get flashcardTranslation => 'Übersetzung';

  @override
  String flashcardTitle(int current, int total) {
    return 'Karte $current / $total';
  }

  @override
  String get flashcardTapToFlip => 'Tippen zum Umdrehen';

  @override
  String get flashcardFlip => 'Umdrehen';

  @override
  String get flashcardRateAgain => 'Nochmal';

  @override
  String get flashcardRateHard => 'Schwer';

  @override
  String get flashcardRateGood => 'Gut';

  @override
  String get flashcardRateEasy => 'Leicht';

  @override
  String testTranslationLabel(String language) {
    return 'Übersetzung ($language)';
  }

  @override
  String get testWordLabel => 'Wort';

  @override
  String testWordLabelWithLanguage(String language) {
    return 'Wort ($language)';
  }

  @override
  String get testFormsLabel => 'Formen';

  @override
  String testTitle(int current, int total) {
    return 'Test $current / $total';
  }

  @override
  String get testTranslate => 'Übersetze:';

  @override
  String testCorrectAnswer(String answer) {
    return 'Richtig: $answer';
  }

  @override
  String get testWrong => 'Falsch';

  @override
  String get testResultCorrect => 'Richtig! 🎉';

  @override
  String get testResultWrong => 'Leider falsch.';

  @override
  String get testCheck => 'Prüfen';

  @override
  String get selectionColumnWord => 'Wort';

  @override
  String get selectionColumnForms => 'Formen';

  @override
  String get selectionColumnTranslation => 'Übersetzung';

  @override
  String get selectionTitle => 'Vokabeln auswählen';

  @override
  String get selectionMenuTooltip => 'Auswahl';

  @override
  String get selectionSelectAll => 'Alle auswählen';

  @override
  String get selectionClear => 'Auswahl aufheben';

  @override
  String selectionConfirm(String label, String vocabs) {
    return '$label ($vocabs)';
  }

  @override
  String get homeTabStart => 'Start';

  @override
  String get homeTabLessons => 'Lektionen';

  @override
  String get homeTabAnalysis => 'Analyse';

  @override
  String get sessionSummaryExcellent => 'Hervorragend!';

  @override
  String get sessionSummaryGreat => 'Super gemacht!';

  @override
  String get sessionSummaryGood => 'Gut geübt!';

  @override
  String get sessionSummaryKeepGoing => 'Dranbleiben!';

  @override
  String sessionSummaryScore(int correct, int total) {
    return '$correct von $total beim ersten Versuch gewusst.';
  }

  @override
  String get sessionSummaryScheduled =>
      'Die App plant automatisch, wann jede Vokabel wieder drankommt.';

  @override
  String get sessionSummaryRestart => 'Nochmal';

  @override
  String get changelogTitle => 'Was ist neu?';

  @override
  String get changelogGotIt => 'Alles klar!';

  @override
  String get changelog6Title => '🔒 Datenschutz auf einen Blick';

  @override
  String get changelog6Text =>
      'Unter Einstellungen → „Über die App\" findest du die Datenschutzerklärung und die Einführung zum Nachlesen: Alles bleibt auf deinem Handy, und die App ist ohne Werbung und ohne Käufe.';

  @override
  String get changelog5Title => '🤖 Scannen nur mit KI-Apps';

  @override
  String get changelog5Text =>
      'Beim Scannen siehst du nur noch KI-Apps wie ChatGPT oder Gemini zur Auswahl. Die Anleitung für die KI wird gleich mitgeschickt.';

  @override
  String get changelog4Title => '🧩 Mehr Formen';

  @override
  String get changelog4Text =>
      'Neu bei den Formen: Plural, Steigerung, Fall/Präposition, Deklination/Konjugation und Wortart. Mit „Alles\" übernimmt die KI wirklich alles, was im Buch zum Wort steht.';

  @override
  String get changelog3Title => '👋 Mit deinem Namen';

  @override
  String get changelog3Text =>
      'Wenn du magst, begrüßt dich die App mit Namen – auch in den Erinnerungen. Ändern kannst du ihn in den Einstellungen.';

  @override
  String get changelog2Title => '💡 Kurze Tipps';

  @override
  String get changelog2Text =>
      'Beim ersten Mal erklärt ein kleines Fenster, wie Lektion anlegen, Eintippen und Scannen funktionieren. Mit „Nicht mehr anzeigen\" ist es weg.';

  @override
  String get changelog1Title => '📚 Lektionen in jeder Sprache';

  @override
  String get changelog1Text =>
      'Leg eigene Lektionen an – Englisch, Französisch, Latein oder was du lernst – und tipp die Vokabeln ein oder scanne sie aus dem Buch.';
}
