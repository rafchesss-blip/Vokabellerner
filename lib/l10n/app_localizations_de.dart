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

  @override
  String get settingsThemeDark => 'Dark Mode';

  @override
  String get settingsThemeLight => 'Light Mode';

  @override
  String get settingsThemeSystem => 'System (automatisch)';

  @override
  String get settingsThemeDarkDesc =>
      'Dunkler Hintergrund mit leuchtenden Neon-Farben.';

  @override
  String get settingsThemeLightDesc =>
      'Helles, minimalistisches Design mit Weiß- und Hellgrautönen.';

  @override
  String get settingsThemeSystemDesc =>
      'Richtet sich nach der Einstellung deines Geräts.';

  @override
  String get settingsAccentViolet => 'Neon-Violett';

  @override
  String get settingsAccentCyan => 'Neon-Cyan';

  @override
  String get settingsAccentEmerald => 'Neon-Smaragd';

  @override
  String get settingsAccentOrange => 'Neon-Orange';

  @override
  String get settingsAccentPink => 'Neon-Pink';

  @override
  String get settingsDirectionForward => 'Wort → Übersetzung';

  @override
  String get settingsDirectionBackward => 'Übersetzung → Wort';

  @override
  String get settingsDirectionForwardDesc =>
      'Die App zeigt das Wort, du antwortest die Bedeutung.';

  @override
  String get settingsDirectionBackwardDesc =>
      'Die App zeigt die Übersetzung, du antwortest das Wort.';

  @override
  String get settingsAnswerTranslationOnly => 'Nur Übersetzung';

  @override
  String get settingsAnswerWordOnly => 'Nur Wort';

  @override
  String get settingsAnswerFormsOnly => 'Nur Formen';

  @override
  String get settingsAnswerBoth => 'Beides';

  @override
  String get settingsAnswerTranslationOnlyDesc =>
      'Du antwortest nur die Übersetzung.';

  @override
  String get settingsAnswerWordOnlyDesc => 'Du antwortest nur das Wort.';

  @override
  String get settingsAnswerFormsOnlyDesc => 'Du antwortest nur die Formen.';

  @override
  String get settingsAnswerBothTranslationDesc =>
      'Du antwortest die Übersetzung und die Formen.';

  @override
  String get settingsAnswerBothWordDesc =>
      'Du antwortest das Wort und die Formen.';

  @override
  String get settingsNameTitle => 'Dein Name';

  @override
  String get settingsNameEmpty =>
      'Nicht angegeben – nur auf diesem Handy gespeichert';

  @override
  String settingsNameSaved(String name) {
    return '$name · nur auf diesem Handy gespeichert';
  }

  @override
  String get settingsDesignTitle => 'Design';

  @override
  String get settingsAccentTitle => 'Akzentfarbe (Neon)';

  @override
  String get settingsAccentHint =>
      'Die Akzentfarbe gilt für Buttons, Schalter und Hervorhebungen. Im Dark Mode leuchten die Farben, im Light Mode werden sie automatisch etwas abgedunkelt, damit alles gut lesbar bleibt.';

  @override
  String get settingsDirectionTitle => 'Sprachrichtung';

  @override
  String get settingsAnswerModeTitle => 'Abfrage-Modus im Test';

  @override
  String get settingsAskExtrasTitle => 'Sonstiges mit abfragen';

  @override
  String get settingsAskExtrasSubtitle =>
      'z. B. Beispielsatz oder Merkhilfe – wenn die Vokabel welche hat.';

  @override
  String get settingsFormsHint =>
      'Formen sind z. B. Stammformen, Genitiv oder Geschlecht. Hat eine Vokabel keine Formen, wird automatisch nur die Übersetzung abgefragt. Der Abfrage-Modus gilt für den Test-Modus.';

  @override
  String get settingsAboutTitle => 'Über die App';

  @override
  String get settingsShowIntro => 'Einführung ansehen';

  @override
  String get settingsPrivacyTitle => 'Datenschutz';

  @override
  String get settingsPrivacySubtitle => 'Alles bleibt auf deinem Handy';

  @override
  String get settingsLicensesTitle => 'Lizenzen';

  @override
  String get settingsLicensesSubtitle => 'Verwendete Software';

  @override
  String get settingsLicensesLegalese =>
      'Kostenlos, ohne Werbung und ohne In-App-Käufe.';

  @override
  String get backupExported => 'Sicherung wird heruntergeladen.';

  @override
  String get backupCopied =>
      'Sicherung in die Zwischenablage kopiert – z. B. in eine Notiz einfügen.';

  @override
  String get backupRestoreTitle => 'Sicherung wiederherstellen?';

  @override
  String get backupRestoreMessage =>
      'Dein aktueller Lernfortschritt und deine Übungslisten werden durch die Sicherung ersetzt.';

  @override
  String get backupRestoreAction => 'Wiederherstellen';

  @override
  String get backupRestored => 'Sicherung wiederhergestellt. ✅';

  @override
  String get backupResetTitle => 'Lernfortschritt zurücksetzen?';

  @override
  String get backupResetMessage =>
      'Alle Lernstufen und Wiederholungstermine werden gelöscht. Lektionen und Übungslisten bleiben erhalten.';

  @override
  String get backupResetAction => 'Zurücksetzen';

  @override
  String get backupResetDone => 'Lernfortschritt zurückgesetzt.';

  @override
  String get backupPasteTitle => 'Sicherung einfügen';

  @override
  String get backupTitle => 'Daten & Sicherung';

  @override
  String get backupHint =>
      'Dein Fortschritt wird nur in diesem Browser gespeichert. Mach ab und zu eine Sicherung – damit kannst du auch auf ein anderes Gerät umziehen.';

  @override
  String get backupExportTitle => 'Sicherung exportieren';

  @override
  String get backupExportFile => 'Als Datei herunterladen';

  @override
  String get backupExportClipboard => 'In die Zwischenablage kopieren';

  @override
  String get backupImportTitle => 'Sicherung importieren';

  @override
  String get backupImportFile => 'Sicherungsdatei auswählen';

  @override
  String get backupImportPaste => 'Gesicherten Text einfügen';

  @override
  String get backupResetTile => 'Lernfortschritt zurücksetzen';

  @override
  String get storeBackupInvalid => 'Das ist keine gültige Sicherungsdatei.';

  @override
  String get storeBackupCorrupt => 'Die Sicherungsdatei ist beschädigt.';

  @override
  String get notifSectionBlocked =>
      'Benachrichtigungen sind blockiert. Erlaube sie in den Android-Einstellungen für den Vokabellerner.';

  @override
  String get notifSectionTitle => 'Erinnerungen';

  @override
  String get notifSectionAndroidOnly =>
      '📱 Echte Erinnerungen gibt es in der Android-App: mehrmals am Tag, mit aktuellen Zahlen und nie nach 21 Uhr.';

  @override
  String get notifSectionSwitchTitle => 'Lern-Erinnerungen';

  @override
  String get notifSectionSwitchSubtitle =>
      'Mit aktuellen Zahlen – nie nach 21 Uhr. Ist für heute alles gelernt, ist Ruhe.';

  @override
  String get notifSectionHowOften => 'Wie oft am Tag?';

  @override
  String notifSectionTimes(String times) {
    return 'um $times Uhr';
  }

  @override
  String get notifSectionSendTest => 'Test-Benachrichtigung senden';

  @override
  String get notifChannelName => 'Lern-Erinnerungen';

  @override
  String get notifChannelDescription =>
      'Erinnert dich ans Vokabellernen (nie nach 21 Uhr).';

  @override
  String get notifTestTitle => '👋 Hallo! So sehen deine Erinnerungen aus';

  @override
  String get notifTestBody =>
      'Ich melde mich, wenn Vokabeln auf dich warten – nie nach 21 Uhr.';

  @override
  String notifFirst1Title(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '🧠 $n Vokabeln warten auf dich',
      one: '🧠 1 Vokabel wartet auf dich',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst1Body => 'Ein paar Minuten reichen – los geht\'s!';

  @override
  String get notifFirst2Title => '⚔️ Die Vokabeln greifen an!';

  @override
  String notifFirst2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Stück wollen heute besiegt werden.',
      one: '1 Stück will heute besiegt werden.',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst3Title => '🕵️ Geheimauftrag für heute';

  @override
  String notifFirst3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Wörter entschlüsseln. Bereit?',
      one: '1 Wort entschlüsseln. Bereit?',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst4Title => '📚 Deine Vokabeln rufen!';

  @override
  String notifFirst4Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Heute stehen $n Vokabeln auf dem Plan.',
      one: 'Heute steht 1 Vokabel auf dem Plan.',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst5Title => '🎯 Mission des Tages';

  @override
  String notifFirst5Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Vokabeln knacken – schaffst du sie alle?',
      one: '1 Vokabel knacken – schaffst du sie?',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst6Title => '🦉 Die Lerneule hat Hunger';

  @override
  String notifFirst6Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Füttere sie mit $n Vokabeln!',
      one: 'Füttere sie mit 1 Vokabel!',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst7Title => '🎲 Kleine Wette?';

  @override
  String notifFirst7Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Ich wette, du schaffst die $n Vokabeln in 5 Minuten.',
      one: 'Ich wette, du schaffst die eine Vokabel in 5 Minuten.',
    );
    return '$_temp0';
  }

  @override
  String notifNamed1Title(String name) {
    return '👋 Hey $name!';
  }

  @override
  String notifNamed1Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Vokabeln warten heute auf dich.',
      one: '1 Vokabel wartet heute auf dich.',
    );
    return '$_temp0';
  }

  @override
  String notifNamed2Title(String name) {
    return '🎯 $name, deine Mission für heute';
  }

  @override
  String notifNamed2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Vokabeln knacken – los geht\'s!',
      one: '1 Vokabel knacken – los geht\'s!',
    );
    return '$_temp0';
  }

  @override
  String notifNamed3Title(String name) {
    return '🧠 $name, kurz lernen?';
  }

  @override
  String notifNamed3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Heute stehen $n Vokabeln auf dem Plan.',
      one: 'Heute steht 1 Vokabel auf dem Plan.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle1Title => '⏰ Psst… deine Vokabeln warten noch';

  @override
  String notifMiddle1Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Stück sind heute noch offen.',
      one: '1 Stück ist heute noch offen.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle2Title => '🐢 Die Vokabeln werden ungeduldig';

  @override
  String notifMiddle2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Noch $n warten – nur ein paar Minuten!',
      one: 'Noch 1 wartet – nur ein paar Minuten!',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle3Title => '💬 Deine Karten fragen, wo du bleibst';

  @override
  String notifMiddle3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Vokabeln sind noch übrig.',
      one: '1 Vokabel ist noch übrig.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle4Title => '🧩 Fast vergessen?';

  @override
  String notifMiddle4Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Vokabeln wollen heute noch wiederholt werden.',
      one: '1 Vokabel will heute noch wiederholt werden.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle5Title => '🚀 Kurzer Boost gefällig?';

  @override
  String notifMiddle5Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Karten, dann hast du Ruhe.',
      one: '1 Karte, dann hast du Ruhe.',
    );
    return '$_temp0';
  }

  @override
  String get notifLast1Title => '🌙 Letzte Chance für heute!';

  @override
  String notifLast1Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Noch $n Vokabeln – danach ist Feierabend.',
      one: 'Noch 1 Vokabel – danach ist Feierabend.',
    );
    return '$_temp0';
  }

  @override
  String get notifLast2Title => '⌛ Der Tag ist fast vorbei';

  @override
  String notifLast2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Vokabeln, dann bist du für heute durch.',
      one: '1 Vokabel, dann bist du für heute durch.',
    );
    return '$_temp0';
  }

  @override
  String get notifLast3Title => '🛡️ Endspurt für heute';

  @override
  String notifLast3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Noch $n Vokabeln bis zum Feierabend.',
      one: 'Noch 1 Vokabel bis zum Feierabend.',
    );
    return '$_temp0';
  }

  @override
  String notifStreakTitle(int streak) {
    return '🔥 Deine $streak-Tage-Serie ist in Gefahr!';
  }

  @override
  String notifStreakTitleNamed(String name, int streak) {
    return '🔥 $name, deine $streak-Tage-Serie ist in Gefahr!';
  }

  @override
  String notifStreakBody(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Noch $n Vokabeln – lern heute, damit sie nicht reißt.',
      one: 'Noch 1 Vokabel – lern heute, damit sie nicht reißt.',
    );
    return '$_temp0';
  }

  @override
  String notifExamTomorrowTitle(String list) {
    return '🚨 Morgen ist „$list\"!';
  }

  @override
  String notifExamTomorrowBodyLast(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Letzte Chance: noch $n Vokabeln wiederholen!',
      one: 'Letzte Chance: noch 1 Vokabel wiederholen!',
    );
    return '$_temp0';
  }

  @override
  String notifExamTomorrowBody(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Heute ist der letzte Lerntag – $n Vokabeln warten.',
      one: 'Heute ist der letzte Lerntag – 1 Vokabel wartet.',
    );
    return '$_temp0';
  }

  @override
  String notifExamSoonTitle(int days, String list) {
    return '⚡ Noch $days Tage bis „$list\"';
  }

  @override
  String notifExamSoonBody(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Endspurt! Heute sind $n Vokabeln dran.',
      one: 'Endspurt! Heute ist 1 Vokabel dran.',
    );
    return '$_temp0';
  }

  @override
  String notifExamDayTitle(String list) {
    return '🍀 Heute ist „$list\"!';
  }

  @override
  String get notifExamDayBody =>
      'Du hast geübt – jetzt zeig, was du kannst. Viel Erfolg! 💪';

  @override
  String get analyseEmptyTitle => 'Noch keine Übungslisten';

  @override
  String get analyseEmptyText =>
      'Erstelle eine Übungsliste, um hier deine Fortschritte zu sehen.';

  @override
  String analyseSummary(int total, int good, int neutral, int weak) {
    String _temp0 = intl.Intl.pluralLogic(
      total,
      locale: localeName,
      other: '$total Vokabeln',
      one: '1 Vokabel',
    );
    return '$_temp0 · $good gut · $neutral neutral · $weak schwach';
  }

  @override
  String analyseGoalUntil(String date) {
    return 'Ziel bis $date';
  }

  @override
  String get analyseOverallGoal => 'Gesamtziel';

  @override
  String analyseKnown(int known, int total) {
    return '$known/$total Vokabeln gewusst';
  }

  @override
  String get analyseDailyGoal => 'Tagesziel';

  @override
  String get analyseAllDone => 'alles geschafft';

  @override
  String analyseLearnedToday(int learned, int target) {
    return '$learned/$target heute gelernt';
  }

  @override
  String get analyseAllKnown => 'Alle Vokabeln gewusst! 🎉';

  @override
  String analyseRemaining(int days, int remaining) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days Tage',
      one: '1 Tag',
    );
    String _temp1 = intl.Intl.pluralLogic(
      remaining,
      locale: localeName,
      other: '$remaining Vokabeln',
      one: '1 Vokabel',
    );
    return 'Noch $_temp0 · $_temp1 offen.';
  }

  @override
  String get vocabDetailNeverPracticed => 'Noch nie geübt';

  @override
  String vocabDetailMemoryDue(int percent, int reps) {
    return 'Gedächtnis: $percent % · jetzt fällig · $reps× geübt';
  }

  @override
  String vocabDetailMemoryNext(int percent, String interval, int reps) {
    return 'Gedächtnis: $percent % · wieder in $interval · $reps× geübt';
  }

  @override
  String get vocabDetailNoHistory => 'Noch keine Verläufe vorhanden.';

  @override
  String get vocabDetailWorse => 'Schlechter';

  @override
  String get vocabDetailBetter => 'Besser';

  @override
  String get levelVeryGood => 'Sehr gut';

  @override
  String get levelGood => 'Gut';

  @override
  String get levelQuiteGood => 'Ziemlich gut';

  @override
  String get levelOkay => 'Ganz okay';

  @override
  String get levelSlightlyGood => 'Leicht gut';

  @override
  String get levelNeutral => 'Neutral';

  @override
  String get levelSlightlyWeak => 'Leicht schwach';

  @override
  String get levelWeak => 'Schwach';

  @override
  String get levelQuiteWeak => 'Ziemlich schwach';

  @override
  String get levelBad => 'Schlecht';

  @override
  String get levelVeryBad => 'Sehr schlecht';

  @override
  String get tutorialTitle => 'So funktioniert die App';

  @override
  String get tutorialPage1Title => 'So funktioniert der Vokabeltrainer';

  @override
  String get tutorialPage1Text =>
      'Diese App hilft dir, Vokabeln in jeder Sprache zu lernen – mit Karteikarten, Tests und cleverer Wiederholung. Wische nach links oder tippe auf „Weiter\", um alles kennenzulernen.';

  @override
  String get tutorialPage2Title => 'Lektion anlegen';

  @override
  String get tutorialPage2Text =>
      'Im Tab „Lektionen\" legst du eine Lektion an: Name, Sprache und was du lernen willst – Wort und Übersetzung, auf Wunsch Formen und bis zu drei eigene Felder wie Beispielsatz oder Merkhilfe.';

  @override
  String get tutorialPage3Title => 'Vokabeln scannen';

  @override
  String get tutorialPage3Text =>
      'Tippe die Vokabeln selbst ein – oder tippe auf „Scannen\" und fotografiere die Liste aus deinem Buch. Eine KI-App wie ChatGPT oder Gemini liest sie ab. Kopiere ihre Antwort, komm zurück, fertig.';

  @override
  String get tutorialPage4Title => 'Übungslisten erstellen';

  @override
  String get tutorialPage4Text =>
      'Tippe auf der Startseite auf „Übungslisten\" und dann auf „Neue Liste\". Gib der Liste einen Namen, optional das Datum deines Vokabeltests, und wähle die Vokabeln aus deinen Lektionen aus.';

  @override
  String get tutorialPage5Title => 'Jeden Tag lernen';

  @override
  String get tutorialPage5Text =>
      'Auf der Startseite steht unter „Heute\", was aus deinen Listen gerade dran ist: fällige Wiederholungen zuerst, dazu bis zu 15 neue Vokabeln. Tippe auf „Los geht\'s\" zum Starten.';

  @override
  String get tutorialPage6Title => 'Karteikarten';

  @override
  String get tutorialPage6Text =>
      'Tippe auf die Karte, um sie umzudrehen, und bewerte dich ehrlich: „Nochmal\", „Schwer\", „Gut\" oder „Leicht\". Unter jedem Knopf steht, wann die Karte wiederkommt. Am PC: Leertaste zum Umdrehen, 1–4 zum Bewerten.';

  @override
  String get tutorialPage7Title => 'Clever wiederholen';

  @override
  String get tutorialPage7Text =>
      'Die App fragt jede Vokabel genau dann ab, kurz bevor du sie vergessen würdest (Spaced Repetition mit FSRS, wie bei Anki). Gut gekonnte Wörter kommen seltener, schwierige öfter. Lerne jeden Tag ein bisschen – das hält deine 🔥 Lernserie am Leben.';

  @override
  String get tutorialPage8Title => 'Vokabeltest im Blick';

  @override
  String get tutorialPage8Text =>
      'Gib beim Erstellen einer Liste das Datum deines Tests an. Die App verteilt die neuen Vokabeln so auf die Tage, dass du am Tag VOR dem Test fertig bist – dort wird alles noch einmal wiederholt. Je näher der Test, desto öfter kommen die Vokabeln dran.';

  @override
  String get tutorialPage9Title => 'Erinnerungen';

  @override
  String get tutorialPage9Text =>
      'Die App erinnert dich bis zu 3-mal am Tag – mit den aktuellen Zahlen und nie nach 21 Uhr. Hast du für heute alles gelernt, ist Ruhe. Einstellen kannst du das unter Einstellungen → Erinnerungen.';

  @override
  String get tutorialPage10Title => 'Test-Modus';

  @override
  String get tutorialPage10Text =>
      'Hier tippst du die Übersetzung und/oder die Formen selbst ein – auf Wunsch auch die eigenen Felder (Einstellungen). Beim Prüfen sind Groß-/Kleinschreibung und Artikel (der/die/das) egal.';

  @override
  String get tutorialPage11Title => 'Lernfortschritt sehen';

  @override
  String get tutorialPage11Text =>
      'Im Tab „Analyse\" siehst du jede Vokabel mit ihrer Lernstufe: 5 Grüntöne (gut), Grau (neutral) und 5 Rottöne (schwach). Tippe auf eine Vokabel für die Verlaufs-Grafik und zum manuellen Verbessern oder Verschlechtern mit +/−.';

  @override
  String get tutorialPage12Title => 'Deine Daten';

  @override
  String get tutorialPage12Text =>
      'Alles wird nur auf diesem Gerät gespeichert – ohne Konto, ohne Internet. Mach in den Einstellungen ab und zu eine Sicherung. Damit kannst du auch auf ein anderes Gerät umziehen.';
}
