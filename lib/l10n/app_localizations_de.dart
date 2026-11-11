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
