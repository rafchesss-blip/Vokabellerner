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
  String get lessonScreenManualHintTitle => 'Vokabeln eintippen';

  @override
  String get lessonScreenManualHintText =>
      'Du bekommst ein Feld für jede Angabe dieser Lektion. Nur Wort und Übersetzung müssen ausgefüllt sein. Später kannst du jede Vokabel antippen, um sie zu ändern.';

  @override
  String lessonScreenVocabAdded(String word) {
    return '„$word\" hinzugefügt.';
  }

  @override
  String lessonScreenVocabDeleted(String word) {
    return '„$word\" gelöscht.';
  }

  @override
  String get lessonScreenScanHintTitle => 'So funktioniert Scannen';

  @override
  String lessonScreenScanHintText(String columns) {
    return '1. Fotografiere die Vokabelliste – gerade und gut lesbar.\n2. Wähle eine KI-App. Sie öffnet sich mit dem Foto und der Anleitung.\n3. Schick die Nachricht ab.\n4. Kopiere die Antwort und komm zurück – die Vokabeln werden automatisch erkannt.\n\nAbgelesen wird: $columns';
  }

  @override
  String get lessonScreenFreeAiHintTitle => 'Am besten eine kostenlose KI';

  @override
  String get lessonScreenFreeAiHintText =>
      'ChatGPT, Gemini und Co. lesen Vokabeln auch in der kostenlosen Version zuverlässig ab – du brauchst kein Abo. Die Anleitung für die KI wird automatisch eingefügt.';

  @override
  String lessonScreenAiOpenFailed(String app) {
    return '$app ließ sich nicht öffnen.';
  }

  @override
  String get lessonScreenNothingInClipboard =>
      'Keine Vokabeln in der Zwischenablage. Kopiere in der KI-App die ganze Antwort und versuch es noch einmal.';

  @override
  String lessonScreenImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count Vokabeln übernommen. Tippe eine an, um sie zu korrigieren.',
      one: '1 Vokabel übernommen. Tippe sie an, um sie zu korrigieren.',
    );
    return '$_temp0';
  }

  @override
  String lessonScreenDeleteLessonTitle(String name) {
    return '„$name\" löschen?';
  }

  @override
  String get lessonScreenDeleteLessonText =>
      'Die Lektion und alle ihre Vokabeln werden gelöscht – auch aus deinen Übungslisten.';

  @override
  String get lessonScreenMenuSettings => 'Lektion einstellen';

  @override
  String get lessonScreenMenuDelete => 'Lektion löschen';

  @override
  String get lessonScreenEmpty => 'Noch keine Vokabeln in dieser Lektion.';

  @override
  String get lessonScreenWaitingForAi => 'Warte auf die Antwort der KI …';

  @override
  String get lessonScreenWaitingHelp =>
      'Kopiere in der KI-App die Antwort (Kopieren-Knopf am Textblock) und komm zurück – die Vokabeln werden dann automatisch erkannt.';

  @override
  String get lessonScreenPasteAnswer => 'Antwort einfügen';

  @override
  String get lessonScreenAddTitle => 'Vokabeln hinzufügen';

  @override
  String get lessonScreenAddManually => 'Selbst eingeben';

  @override
  String get lessonScreenScan => 'Scannen';

  @override
  String get lessonScreenScanTip =>
      'Tipp: Mit „Scannen\" fotografierst du die Vokabelliste aus deinem Buch. Eine KI-App wie ChatGPT oder Gemini liest sie für dich ab – kein Abtippen nötig.';

  @override
  String get lessonScreenTakePhoto => 'Foto aufnehmen';

  @override
  String get lessonScreenPhotoFromGallery => 'Foto aus der Galerie';

  @override
  String get lessonScreenWhichAi => 'Mit welcher KI?';

  @override
  String get lessonScreenNoAiInstalled =>
      'Auf deinem Handy ist noch keine KI-App. Installiere eine – kostenlos – und tippe danach noch einmal auf „Scannen\".';

  @override
  String lessonScreenInstallApp(String app) {
    return '$app installieren';
  }

  @override
  String get lessonScreenFreeInPlayStore => 'kostenlos im Play Store';

  @override
  String get lessonScreenAiDisclaimer =>
      'Der Vokabeltrainer ist nicht mit diesen Apps oder ihren Anbietern verbunden. Für sie gilt ihre eigene Datenschutzerklärung.';

  @override
  String lessonScreenRecognized(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Vokabeln erkannt',
      one: '1 Vokabel erkannt',
    );
    return '$_temp0';
  }

  @override
  String lessonScreenDuplicatesSkipped(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count waren schon in der Lektion und werden übersprungen.',
      one: '1 war schon in der Lektion und wird übersprungen.',
    );
    return '$_temp0';
  }

  @override
  String lessonScreenImportButton(int count) {
    return '$count übernehmen';
  }

  @override
  String get lessonSetupTitleNew => 'Neue Lektion';

  @override
  String get lessonSetupTitleEdit => 'Lektion einstellen';

  @override
  String get lessonSetupNameLabel => 'Name der Lektion';

  @override
  String get lessonSetupNameHint => 'z. B. Unit 3 oder Lektion 5';

  @override
  String get lessonSetupLanguageLabel => 'Sprache der Wörter';

  @override
  String get lessonSetupTranslationLabel => 'Übersetzung auf';

  @override
  String get lessonSetupFieldsTitle => 'Was wird eingegeben?';

  @override
  String get lessonSetupFieldsHelp =>
      'Danach richtet sich das Eingeben, das Scannen mit KI und der Test.';

  @override
  String get lessonSetupWord => 'Wort';

  @override
  String get lessonSetupTranslation => 'Übersetzung';

  @override
  String get lessonSetupAlwaysIncluded => 'immer dabei';

  @override
  String get lessonSetupForms => 'Formen';

  @override
  String get lessonSetupFormsSubtitle =>
      'z. B. Stammformen, Genitiv, Geschlecht';

  @override
  String get lessonSetupWhichForms => 'Welche Formen?';

  @override
  String get lessonSetupAllForms => 'Alles';

  @override
  String get lessonSetupAllFormsHelp =>
      'Alles, was im Buch zum Wort steht: Stammformen, Plural, Geschlecht, Steigerung, Fall und mehr.';

  @override
  String get lessonSetupPickOneKind => 'Wähle mindestens eine Art aus.';

  @override
  String get lessonSetupExtrasTitle => 'Sonstiges (bis zu 3)';

  @override
  String get lessonSetupExtrasHelp =>
      'Eigene Felder, z. B. Beispielsatz oder Merkhilfe.';

  @override
  String lessonSetupExtraFieldLabel(int number) {
    return 'Sonstiges $number – Name';
  }

  @override
  String lessonSetupExtraDefaultName(int number) {
    return 'Sonstiges $number';
  }

  @override
  String get lessonSetupRemove => 'Entfernen';

  @override
  String get lessonSetupExtraChip => 'Sonstiges';

  @override
  String get lessonSetupSuggestionExample => 'Beispielsatz';

  @override
  String get lessonSetupSuggestionMnemonic => 'Merkhilfe';

  @override
  String get lessonSetupSuggestionPronunciation => 'Aussprache';

  @override
  String get lessonSetupSuggestionOpposite => 'Gegenteil';

  @override
  String get lessonsTabNewLessonHintTitle => 'Neue Lektion';

  @override
  String get lessonsTabNewLessonHintText =>
      'Gib der Lektion einen Namen und wähle die Sprache. Dann legst du fest, was du lernen willst: Wort und Übersetzung sind immer dabei, dazu auf Wunsch Formen und bis zu drei eigene Felder wie Beispielsatz oder Merkhilfe.';

  @override
  String get lessonsTabEmptyTitle => 'Noch keine Lektionen';

  @override
  String get lessonsTabEmptyText =>
      'Leg deine erste Lektion an. Die Vokabeln tippst du selbst ein – oder du fotografierst die Seite aus deinem Buch und lässt eine KI-App wie ChatGPT oder Gemini sie ablesen.';

  @override
  String get lessonsTabNewLesson => 'Neue Lektion';

  @override
  String lessonsTabCardStats(int count, int known) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Vokabeln',
      one: '1 Vokabel',
    );
    return '$_temp0 · $known gewusst';
  }

  @override
  String get vocabFormDialogTitleNew => 'Neue Vokabel';

  @override
  String get vocabFormDialogTitleEdit => 'Vokabel bearbeiten';

  @override
  String get vocabFormDialogWord => 'Wort';

  @override
  String vocabFormDialogWordWithLanguage(String language) {
    return 'Wort ($language)';
  }

  @override
  String vocabFormDialogTranslation(String language) {
    return 'Übersetzung ($language)';
  }

  @override
  String get vocabFormDialogForms => 'Formen';

  @override
  String get vocabFormDialogAllForms => 'alle Formen';

  @override
  String get introWelcomeTitle => 'Willkommen beim Vokabeltrainer';

  @override
  String get introWelcomeText =>
      'Lerne Vokabeln in jeder Sprache – mit Karteikarten, Tests und cleverer Wiederholung. Jede Vokabel kommt genau dann wieder, kurz bevor du sie vergessen würdest.';

  @override
  String get introScanTitle => 'Eintippen oder scannen';

  @override
  String get introScanText =>
      'Leg Lektionen an und tippe die Vokabeln ein. Oder fotografiere die Liste aus deinem Buch: Eine KI-App wie ChatGPT oder Gemini liest sie für dich ab.';

  @override
  String get introTestTitle => 'Bereit für den Test';

  @override
  String get introTestText =>
      'Gib das Datum deines Vokabeltests an. Die App verteilt die Vokabeln auf die Tage davor und erinnert dich ans Lernen – nie nach 21 Uhr.';

  @override
  String get introPrivacyTitle => 'Alles bleibt auf deinem Handy';

  @override
  String get introPrivacyText =>
      'Kein Konto, keine Cloud: Deine Lektionen und dein Lernstand werden nirgends im Internet gespeichert. Nur wenn du scannst, geht das Foto an die KI-App, die du selbst auswählst.';

  @override
  String get introFreeTitle => 'Komplett kostenlos';

  @override
  String get introFreeText =>
      'Ich verdiene mit dieser App nichts: keine Werbung, keine In-App-Käufe, kein Abo. Sie ist einfach zum Lernen da.';

  @override
  String get privacyScreenTitle => 'Datenschutz';

  @override
  String get nameDialogWelcome => 'Willkommen!';

  @override
  String get nameDialogTitle => 'Dein Name';

  @override
  String get nameDialogIntro =>
      'Wie heißt du? Dann begrüßt dich die App mit Namen – auch in den Erinnerungen. Das ist freiwillig.';

  @override
  String get nameDialogLabel => 'Dein Name (optional)';

  @override
  String get nameDialogLocalOnly =>
      'Dein Name wird nur auf diesem Handy gespeichert.';

  @override
  String get hintDialogDontShowAgain => 'Nicht mehr anzeigen';

  @override
  String get formKindVerbLabel => 'Verbformen';

  @override
  String get formKindNounLabel => 'Nomenformen';

  @override
  String get formKindPluralLabel => 'Plural';

  @override
  String get formKindAdjectiveLabel => 'Adjektivformen';

  @override
  String get formKindComparisonLabel => 'Steigerung';

  @override
  String get formKindGenderLabel => 'Geschlecht';

  @override
  String get formKindInflectionClassLabel => 'Deklination/Konjugation';

  @override
  String get formKindGovernmentLabel => 'Fall/Präposition';

  @override
  String get formKindWordClassLabel => 'Wortart';

  @override
  String get formKindVerbExample =>
      'Stammformen bzw. unregelmäßige Formen, z. B. vocō, vocāvī, vocātum oder go, went, gone';

  @override
  String get formKindNounExample => 'z. B. Genitiv: lūnae';

  @override
  String get formKindPluralExample => 'z. B. mice, les chevaux';

  @override
  String get formKindAdjectiveExample =>
      'Formen der anderen Geschlechter, z. B. bonus, -a, -um';

  @override
  String get formKindComparisonExample => 'z. B. good, better, best';

  @override
  String get formKindGenderExample =>
      'bei Nomen, z. B. m, f, n oder der/die/das';

  @override
  String get formKindInflectionClassExample =>
      'z. B. a-Deklination, e-Konjugation';

  @override
  String get formKindGovernmentExample =>
      'welcher Fall oder welche Präposition folgt, z. B. + Dat., sich freuen über';

  @override
  String get formKindWordClassExample => 'z. B. Verb, Nomen, Adjektiv, Adverb';

  @override
  String get vocabModelDefaultBoxName => 'Vokabeln';

  @override
  String get aiScanColumnWord => 'Wort';

  @override
  String get aiScanColumnTranslation => 'Übersetzung';

  @override
  String get aiScanColumnForms => 'Formen';

  @override
  String get aiScanForeignLanguage => 'der Fremdsprache';

  @override
  String aiScanPromptIntro(String language, String translationLanguage) {
    return 'Lies alle Vokabeln auf dem Foto ab (Wörter auf $language, Übersetzung auf $translationLanguage).';
  }

  @override
  String get aiScanPromptAnswerOnly =>
      'Antworte NUR mit einem einzigen Codeblock in genau diesem Format, ohne weiteren Text:';

  @override
  String get aiScanPromptRules => 'Regeln:';

  @override
  String aiScanPromptRuleColumns(int count, String columns) {
    return 'Eine Zeile pro Vokabel, die Spalten mit \" | \" getrennt, immer genau $count Spalten in dieser Reihenfolge: $columns.';
  }

  @override
  String aiScanPromptRuleNoHeader(String marker) {
    return 'Die Zeile mit den Spaltennamen weglassen, die erste Zeile ist immer $marker.';
  }

  @override
  String aiScanPromptRuleWord(String column) {
    return '$column: so geschrieben wie im Foto, mit allen Sonderzeichen und Akzenten.';
  }

  @override
  String aiScanPromptRuleTranslation(String column) {
    return '$column: wie im Foto; mehrere Bedeutungen mit Komma trennen.';
  }

  @override
  String aiScanPromptRuleAllForms(String column) {
    return '$column: ALLE grammatischen Angaben, die im Foto zum Wort stehen – nichts weglassen. Zum Beispiel (aber nicht nur):';
  }

  @override
  String get aiScanPromptRuleAllFormsMore =>
      'Auch alles andere, was zum Wort gehört (Abkürzungen, Hinweise in Klammern), gehört hierher. Mehrere Angaben mit Komma trennen.';

  @override
  String get aiScanPromptRuleAllFormsNone =>
      'Steht im Foto keine Angabe zum Wort, dann \"-\".';

  @override
  String aiScanPromptRuleSomeForms(String column) {
    return '$column: nur diese Angaben, mehrere mit Komma getrennt:';
  }

  @override
  String aiScanPromptRuleOmit(String kinds) {
    return 'Weglassen: $kinds.';
  }

  @override
  String get aiScanPromptRuleSomeFormsNone =>
      'Hat ein Wort keine solchen Angaben (z. B. ein Adverb), steht dort \"-\".';

  @override
  String aiScanPromptRuleExtra(String label) {
    return '$label: aus dem Foto; steht dort nichts, dann \"-\".';
  }

  @override
  String get aiScanPromptRuleMissing =>
      'Fehlt eine Angabe, schreib \"-\". Erfinde nichts, was nicht im Foto steht.';

  @override
  String get aiScanPromptRuleNoPipe =>
      'Kein \"|\" innerhalb einer Spalte verwenden.';
}
