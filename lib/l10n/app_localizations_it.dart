// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get commonCancel => 'Annulla';

  @override
  String get commonSave => 'Salva';

  @override
  String get commonDelete => 'Elimina';

  @override
  String get commonEdit => 'Modifica';

  @override
  String get commonNext => 'Avanti';

  @override
  String get commonBack => 'Indietro';

  @override
  String get commonDone => 'Fatto';

  @override
  String get commonOk => 'OK';

  @override
  String get commonClose => 'Chiudi';

  @override
  String get commonLetsGo => 'Si parte!';

  @override
  String get commonSkip => 'Salta';

  @override
  String get commonUndo => 'Annulla';

  @override
  String get commonOptions => 'Opzioni';

  @override
  String get commonSettings => 'Impostazioni';

  @override
  String get commonHome => 'Alla home';

  @override
  String get languagePickerTitle => 'Lingua dell\'app';

  @override
  String get languagePickerHint =>
      'Puoi cambiarla più tardi nelle impostazioni.';

  @override
  String get settingsLanguage => 'Lingua';

  @override
  String get languageGerman => 'Tedesco';

  @override
  String get languageEnglish => 'Inglese';

  @override
  String get languageSpanish => 'Spagnolo';

  @override
  String get languageFrench => 'Francese';

  @override
  String get languageItalian => 'Italiano';

  @override
  String get languagePortuguese => 'Portoghese';

  @override
  String get languagePolish => 'Polacco';

  @override
  String get languageTurkish => 'Turco';

  @override
  String get languageRussian => 'Russo';

  @override
  String get languageChinese => 'Cinese';

  @override
  String get languageLatin => 'Latino';

  @override
  String vocabCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count vocaboli',
      one: '1 vocabolo',
    );
    return '$_temp0';
  }

  @override
  String get lessonScreenManualHintTitle => 'Scrivi i vocaboli';

  @override
  String get lessonScreenManualHintText =>
      'Avrai un campo per ogni dato di questa lezione. Solo parola e traduzione sono obbligatorie. Più tardi puoi toccare ogni vocabolo per modificarlo.';

  @override
  String lessonScreenVocabAdded(String word) {
    return '«$word» aggiunto.';
  }

  @override
  String lessonScreenVocabDeleted(String word) {
    return '«$word» eliminato.';
  }

  @override
  String get lessonScreenScanHintTitle => 'Come funziona la scansione';

  @override
  String lessonScreenScanHintText(String columns) {
    return '1. Fotografa la lista dei vocaboli, dritta e ben leggibile.\n2. Scegli un\'app di IA. Si apre con la foto e le istruzioni.\n3. Invia il messaggio.\n4. Copia la risposta e torna qui: i vocaboli vengono riconosciuti in automatico.\n\nVerrà letto: $columns';
  }

  @override
  String get lessonScreenFreeAiHintTitle => 'Meglio un\'IA gratuita';

  @override
  String get lessonScreenFreeAiHintText =>
      'ChatGPT, Gemini e simili leggono i vocaboli in modo affidabile anche nella versione gratuita: non ti serve un abbonamento. Le istruzioni per l\'IA vengono inserite in automatico.';

  @override
  String lessonScreenAiOpenFailed(String app) {
    return 'Impossibile aprire $app.';
  }

  @override
  String get lessonScreenNothingInClipboard =>
      'Nessun vocabolo negli appunti. Nell\'app di IA copia tutta la risposta e riprova.';

  @override
  String lessonScreenImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count vocaboli aggiunti. Toccane uno per correggerlo.',
      one: '1 vocabolo aggiunto. Toccalo per correggerlo.',
    );
    return '$_temp0';
  }

  @override
  String lessonScreenDeleteLessonTitle(String name) {
    return 'Eliminare «$name»?';
  }

  @override
  String get lessonScreenDeleteLessonText =>
      'La lezione e tutti i suoi vocaboli verranno eliminati, anche dalle tue liste di esercizio.';

  @override
  String get lessonScreenMenuSettings => 'Imposta lezione';

  @override
  String get lessonScreenMenuDelete => 'Elimina lezione';

  @override
  String get lessonScreenEmpty => 'Ancora nessun vocabolo in questa lezione.';

  @override
  String get lessonScreenWaitingForAi => 'In attesa della risposta dell\'IA …';

  @override
  String get lessonScreenWaitingHelp =>
      'Nell\'app di IA copia la risposta (pulsante Copia sul blocco di testo) e torna qui: i vocaboli verranno riconosciuti in automatico.';

  @override
  String get lessonScreenPasteAnswer => 'Incolla risposta';

  @override
  String get lessonScreenAddTitle => 'Aggiungi vocaboli';

  @override
  String get lessonScreenAddManually => 'Scrivi tu';

  @override
  String get lessonScreenScan => 'Scansiona';

  @override
  String get lessonScreenScanTip =>
      'Consiglio: con «Scansiona» fotografi la lista dei vocaboli dal tuo libro. Un\'app di IA come ChatGPT o Gemini la legge per te: niente da ricopiare.';

  @override
  String get lessonScreenTakePhoto => 'Scatta foto';

  @override
  String get lessonScreenPhotoFromGallery => 'Foto dalla galleria';

  @override
  String get lessonScreenWhichAi => 'Con quale IA?';

  @override
  String get lessonScreenNoAiInstalled =>
      'Sul tuo telefono non c\'è ancora un\'app di IA. Installane una (è gratis) e poi tocca di nuovo «Scansiona».';

  @override
  String lessonScreenInstallApp(String app) {
    return 'Installa $app';
  }

  @override
  String get lessonScreenFreeInPlayStore => 'gratis sul Play Store';

  @override
  String get lessonScreenAiDisclaimer =>
      'Vokabeltrainer non è collegato a queste app né ai loro fornitori. Per loro vale la rispettiva informativa sulla privacy.';

  @override
  String lessonScreenRecognized(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count vocaboli riconosciuti',
      one: '1 vocabolo riconosciuto',
    );
    return '$_temp0';
  }

  @override
  String lessonScreenDuplicatesSkipped(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count erano già nella lezione e verranno saltati.',
      one: '1 era già nella lezione e verrà saltato.',
    );
    return '$_temp0';
  }

  @override
  String lessonScreenImportButton(int count) {
    return 'Aggiungi $count';
  }

  @override
  String get lessonSetupTitleNew => 'Nuova lezione';

  @override
  String get lessonSetupTitleEdit => 'Imposta lezione';

  @override
  String get lessonSetupNameLabel => 'Nome della lezione';

  @override
  String get lessonSetupNameHint => 'ad es. Unit 3 o Lezione 5';

  @override
  String get lessonSetupLanguageLabel => 'Lingua delle parole';

  @override
  String get lessonSetupTranslationLabel => 'Traduzione in';

  @override
  String get lessonSetupFieldsTitle => 'Cosa vuoi inserire?';

  @override
  String get lessonSetupFieldsHelp =>
      'Da questo dipendono l\'inserimento, la scansione con l\'IA e il test.';

  @override
  String get lessonSetupWord => 'Parola';

  @override
  String get lessonSetupTranslation => 'Traduzione';

  @override
  String get lessonSetupAlwaysIncluded => 'sempre incluso';

  @override
  String get lessonSetupForms => 'Forme';

  @override
  String get lessonSetupFormsSubtitle => 'ad es. paradigma, genitivo, genere';

  @override
  String get lessonSetupWhichForms => 'Quali forme?';

  @override
  String get lessonSetupAllForms => 'Tutto';

  @override
  String get lessonSetupAllFormsHelp =>
      'Tutto quello che il libro indica per la parola: paradigma, plurale, genere, comparativo, caso e altro.';

  @override
  String get lessonSetupPickOneKind => 'Scegli almeno un tipo.';

  @override
  String get lessonSetupExtrasTitle => 'Altro (fino a 3)';

  @override
  String get lessonSetupExtrasHelp =>
      'Campi tuoi, ad es. frase d\'esempio o trucco per ricordare.';

  @override
  String lessonSetupExtraFieldLabel(int number) {
    return 'Altro $number – nome';
  }

  @override
  String lessonSetupExtraDefaultName(int number) {
    return 'Altro $number';
  }

  @override
  String get lessonSetupRemove => 'Rimuovi';

  @override
  String get lessonSetupExtraChip => 'Altro';

  @override
  String get lessonSetupSuggestionExample => 'Frase d\'esempio';

  @override
  String get lessonSetupSuggestionMnemonic => 'Trucco per ricordare';

  @override
  String get lessonSetupSuggestionPronunciation => 'Pronuncia';

  @override
  String get lessonSetupSuggestionOpposite => 'Contrario';

  @override
  String get lessonsTabNewLessonHintTitle => 'Nuova lezione';

  @override
  String get lessonsTabNewLessonHintText =>
      'Dai un nome alla lezione e scegli la lingua. Poi decidi cosa vuoi imparare: parola e traduzione ci sono sempre, in più, se vuoi, le forme e fino a tre campi tuoi come frase d\'esempio o trucco per ricordare.';

  @override
  String get lessonsTabEmptyTitle => 'Ancora nessuna lezione';

  @override
  String get lessonsTabEmptyText =>
      'Crea la tua prima lezione. I vocaboli li scrivi tu, oppure fotografi la pagina del libro e li fai leggere a un\'app di IA come ChatGPT o Gemini.';

  @override
  String get lessonsTabNewLesson => 'Nuova lezione';

  @override
  String lessonsTabCardStats(int count, int known) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count vocaboli',
      one: '1 vocabolo',
    );
    return '$_temp0 · $known saputi';
  }

  @override
  String get vocabFormDialogTitleNew => 'Nuovo vocabolo';

  @override
  String get vocabFormDialogTitleEdit => 'Modifica vocabolo';

  @override
  String get vocabFormDialogWord => 'Parola';

  @override
  String vocabFormDialogWordWithLanguage(String language) {
    return 'Parola ($language)';
  }

  @override
  String vocabFormDialogTranslation(String language) {
    return 'Traduzione ($language)';
  }

  @override
  String get vocabFormDialogForms => 'Forme';

  @override
  String get vocabFormDialogAllForms => 'tutte le forme';

  @override
  String get introWelcomeTitle => 'Benvenuto in Vokabeltrainer';

  @override
  String get introWelcomeText =>
      'Impara i vocaboli in qualsiasi lingua, con flashcard, test e un ripasso intelligente. Ogni vocabolo torna proprio quando stai per dimenticarlo.';

  @override
  String get introScanTitle => 'Scrivi o scansiona';

  @override
  String get introScanText =>
      'Crea lezioni e scrivi i vocaboli. Oppure fotografa la lista dal tuo libro: un\'app di IA come ChatGPT o Gemini la legge per te.';

  @override
  String get introTestTitle => 'Pronto per la verifica';

  @override
  String get introTestText =>
      'Inserisci la data della tua verifica di vocaboli. L\'app distribuisce i vocaboli sui giorni prima e ti ricorda di studiare, mai dopo le 21.';

  @override
  String get introPrivacyTitle => 'Tutto resta sul tuo telefono';

  @override
  String get introPrivacyText =>
      'Niente account, niente cloud: le tue lezioni e i tuoi progressi non vengono salvati da nessuna parte su Internet. Solo quando scansioni, la foto va all\'app di IA che scegli tu.';

  @override
  String get introFreeTitle => 'Completamente gratis';

  @override
  String get introFreeText =>
      'Con questa app non guadagno niente: niente pubblicità, niente acquisti in-app, nessun abbonamento. Serve solo per imparare.';

  @override
  String get privacyScreenTitle => 'Privacy';

  @override
  String get nameDialogWelcome => 'Benvenuto!';

  @override
  String get nameDialogTitle => 'Il tuo nome';

  @override
  String get nameDialogIntro =>
      'Come ti chiami? Così l\'app ti saluta per nome, anche nei promemoria. È facoltativo.';

  @override
  String get nameDialogLabel => 'Il tuo nome (facoltativo)';

  @override
  String get nameDialogLocalOnly =>
      'Il tuo nome viene salvato solo su questo telefono.';

  @override
  String get hintDialogDontShowAgain => 'Non mostrare più';

  @override
  String get formKindVerbLabel => 'Forme verbali';

  @override
  String get formKindNounLabel => 'Forme del nome';

  @override
  String get formKindPluralLabel => 'Plurale';

  @override
  String get formKindAdjectiveLabel => 'Forme dell\'aggettivo';

  @override
  String get formKindComparisonLabel => 'Comparativo';

  @override
  String get formKindGenderLabel => 'Genere';

  @override
  String get formKindInflectionClassLabel => 'Declinazione/coniugazione';

  @override
  String get formKindGovernmentLabel => 'Caso/preposizione';

  @override
  String get formKindWordClassLabel => 'Parte del discorso';

  @override
  String get formKindVerbExample =>
      'paradigma o forme irregolari, ad es. vocō, vocāvī, vocātum oppure go, went, gone';

  @override
  String get formKindNounExample => 'ad es. genitivo: lūnae';

  @override
  String get formKindPluralExample => 'ad es. mice, les chevaux';

  @override
  String get formKindAdjectiveExample =>
      'forme degli altri generi, ad es. bonus, -a, -um';

  @override
  String get formKindComparisonExample => 'ad es. good, better, best';

  @override
  String get formKindGenderExample =>
      'nei nomi, ad es. m, f, n oppure der/die/das';

  @override
  String get formKindInflectionClassExample =>
      'ad es. 1ª declinazione, 2ª coniugazione';

  @override
  String get formKindGovernmentExample =>
      'quale caso o quale preposizione segue, ad es. + dat., sich freuen über';

  @override
  String get formKindWordClassExample =>
      'ad es. verbo, nome, aggettivo, avverbio';

  @override
  String get vocabModelDefaultBoxName => 'Vocaboli';

  @override
  String get aiScanColumnWord => 'Parola';

  @override
  String get aiScanColumnTranslation => 'Traduzione';

  @override
  String get aiScanColumnForms => 'Forme';

  @override
  String get aiScanForeignLanguage => 'lingua straniera';

  @override
  String aiScanPromptIntro(String language, String translationLanguage) {
    return 'Leggi tutti i vocaboli nella foto (parole in $language, traduzione in $translationLanguage).';
  }

  @override
  String get aiScanPromptAnswerOnly =>
      'Rispondi SOLO con un unico blocco di codice esattamente in questo formato, senza altro testo:';

  @override
  String get aiScanPromptRules => 'Regole:';

  @override
  String aiScanPromptRuleColumns(int count, String columns) {
    return 'Una riga per vocabolo, colonne separate da \" | \", sempre esattamente $count colonne in quest\'ordine: $columns.';
  }

  @override
  String aiScanPromptRuleNoHeader(String marker) {
    return 'Ometti la riga con i nomi delle colonne, la prima riga è sempre $marker.';
  }

  @override
  String aiScanPromptRuleWord(String column) {
    return '$column: scritta come nella foto, con tutti i caratteri speciali e gli accenti.';
  }

  @override
  String aiScanPromptRuleTranslation(String column) {
    return '$column: come nella foto; separa più significati con una virgola.';
  }

  @override
  String aiScanPromptRuleAllForms(String column) {
    return '$column: TUTTE le indicazioni grammaticali che nella foto accompagnano la parola, senza tralasciare niente. Per esempio (ma non solo):';
  }

  @override
  String get aiScanPromptRuleAllFormsMore =>
      'Va qui anche tutto il resto che riguarda la parola (abbreviazioni, note tra parentesi). Separa più indicazioni con una virgola.';

  @override
  String get aiScanPromptRuleAllFormsNone =>
      'Se nella foto non c\'è nessuna indicazione per la parola, scrivi \"-\".';

  @override
  String aiScanPromptRuleSomeForms(String column) {
    return '$column: solo queste indicazioni, separate da una virgola:';
  }

  @override
  String aiScanPromptRuleOmit(String kinds) {
    return 'Tralascia: $kinds.';
  }

  @override
  String get aiScanPromptRuleSomeFormsNone =>
      'Se una parola non ha indicazioni di questo tipo (ad es. un avverbio), scrivi \"-\".';

  @override
  String aiScanPromptRuleExtra(String label) {
    return '$label: dalla foto; se non c\'è niente, scrivi \"-\".';
  }

  @override
  String get aiScanPromptRuleMissing =>
      'Se manca un\'indicazione, scrivi \"-\". Non inventare niente che non sia nella foto.';

  @override
  String get aiScanPromptRuleNoPipe =>
      'Non usare \"|\" all\'interno di una colonna.';

  @override
  String get settingsThemeDark => 'Modalità scura';

  @override
  String get settingsThemeLight => 'Modalità chiara';

  @override
  String get settingsThemeSystem => 'Sistema (automatico)';

  @override
  String get settingsThemeDarkDesc => 'Sfondo scuro con colori neon brillanti.';

  @override
  String get settingsThemeLightDesc =>
      'Design chiaro e minimal con toni di bianco e grigio chiaro.';

  @override
  String get settingsThemeSystemDesc =>
      'Segue l\'impostazione del tuo dispositivo.';

  @override
  String get settingsAccentViolet => 'Viola neon';

  @override
  String get settingsAccentCyan => 'Ciano neon';

  @override
  String get settingsAccentEmerald => 'Smeraldo neon';

  @override
  String get settingsAccentOrange => 'Arancione neon';

  @override
  String get settingsAccentPink => 'Rosa neon';

  @override
  String get settingsDirectionForward => 'Parola → Traduzione';

  @override
  String get settingsDirectionBackward => 'Traduzione → Parola';

  @override
  String get settingsDirectionForwardDesc =>
      'L\'app mostra la parola, tu rispondi con il significato.';

  @override
  String get settingsDirectionBackwardDesc =>
      'L\'app mostra la traduzione, tu rispondi con la parola.';

  @override
  String get settingsAnswerTranslationOnly => 'Solo traduzione';

  @override
  String get settingsAnswerWordOnly => 'Solo parola';

  @override
  String get settingsAnswerFormsOnly => 'Solo forme';

  @override
  String get settingsAnswerBoth => 'Entrambi';

  @override
  String get settingsAnswerTranslationOnlyDesc =>
      'Rispondi solo con la traduzione.';

  @override
  String get settingsAnswerWordOnlyDesc => 'Rispondi solo con la parola.';

  @override
  String get settingsAnswerFormsOnlyDesc => 'Rispondi solo con le forme.';

  @override
  String get settingsAnswerBothTranslationDesc =>
      'Rispondi con la traduzione e le forme.';

  @override
  String get settingsAnswerBothWordDesc => 'Rispondi con la parola e le forme.';

  @override
  String get settingsNameTitle => 'Il tuo nome';

  @override
  String get settingsNameEmpty =>
      'Non indicato – salvato solo su questo telefono';

  @override
  String settingsNameSaved(String name) {
    return '$name · salvato solo su questo telefono';
  }

  @override
  String get settingsDesignTitle => 'Aspetto';

  @override
  String get settingsAccentTitle => 'Colore d\'accento (neon)';

  @override
  String get settingsAccentHint =>
      'Il colore d\'accento vale per pulsanti, interruttori ed evidenziazioni. In modalità scura i colori brillano, in modalità chiara vengono scuriti un po\' in automatico, così tutto resta ben leggibile.';

  @override
  String get settingsDirectionTitle => 'Direzione';

  @override
  String get settingsAnswerModeTitle => 'Cosa chiedere nel test';

  @override
  String get settingsAskExtrasTitle => 'Chiedi anche «Altro»';

  @override
  String get settingsAskExtrasSubtitle =>
      'ad es. frase d\'esempio o trucco per ricordare, se il vocabolo li ha.';

  @override
  String get settingsFormsHint =>
      'Le forme sono ad es. paradigma, genitivo o genere. Se un vocabolo non ha forme, viene chiesta automaticamente solo la traduzione. Questa scelta vale per la modalità Test.';

  @override
  String get settingsAboutTitle => 'Info sull\'app';

  @override
  String get settingsShowIntro => 'Rivedi l\'introduzione';

  @override
  String get settingsPrivacyTitle => 'Privacy';

  @override
  String get settingsPrivacySubtitle => 'Tutto resta sul tuo telefono';

  @override
  String get settingsLicensesTitle => 'Licenze';

  @override
  String get settingsLicensesSubtitle => 'Software utilizzato';

  @override
  String get settingsLicensesLegalese =>
      'Gratis, senza pubblicità e senza acquisti in-app.';

  @override
  String get backupExported => 'Download del backup in corso.';

  @override
  String get backupCopied =>
      'Backup copiato negli appunti: incollalo ad es. in una nota.';

  @override
  String get backupRestoreTitle => 'Ripristinare il backup?';

  @override
  String get backupRestoreMessage =>
      'I tuoi progressi attuali e le tue liste di esercizio verranno sostituiti dal backup.';

  @override
  String get backupRestoreAction => 'Ripristina';

  @override
  String get backupRestored => 'Backup ripristinato. ✅';

  @override
  String get backupResetTitle => 'Azzerare i progressi?';

  @override
  String get backupResetMessage =>
      'Tutti i livelli e le date di ripasso verranno eliminati. Lezioni e liste di esercizio restano.';

  @override
  String get backupResetAction => 'Azzera';

  @override
  String get backupResetDone => 'Progressi azzerati.';

  @override
  String get backupPasteTitle => 'Incolla backup';

  @override
  String get backupTitle => 'Dati e backup';

  @override
  String get backupHint =>
      'I tuoi progressi vengono salvati solo su questo dispositivo. Fai un backup ogni tanto: così puoi anche passare a un altro dispositivo.';

  @override
  String get backupExportTitle => 'Esporta backup';

  @override
  String get backupExportFile => 'Scarica come file';

  @override
  String get backupExportClipboard => 'Copia negli appunti';

  @override
  String get backupImportTitle => 'Importa backup';

  @override
  String get backupImportFile => 'Scegli file di backup';

  @override
  String get backupImportPaste => 'Incolla il testo salvato';

  @override
  String get backupResetTile => 'Azzera i progressi';

  @override
  String get storeBackupInvalid => 'Questo non è un file di backup valido.';

  @override
  String get storeBackupCorrupt => 'Il file di backup è danneggiato.';

  @override
  String get notifSectionBlocked =>
      'Le notifiche sono bloccate. Consentile nelle impostazioni di Android per Vokabeltrainer.';

  @override
  String get notifSectionTitle => 'Promemoria';

  @override
  String get notifSectionAndroidOnly =>
      '📱 I veri promemoria ci sono nell\'app Android: più volte al giorno, con numeri aggiornati e mai dopo le 21.';

  @override
  String get notifSectionSwitchTitle => 'Promemoria di studio';

  @override
  String get notifSectionSwitchSubtitle =>
      'Con numeri aggiornati, mai dopo le 21. Se oggi hai finito tutto, nessun disturbo.';

  @override
  String get notifSectionHowOften => 'Quante volte al giorno?';

  @override
  String notifSectionTimes(String times) {
    return 'alle $times';
  }

  @override
  String get notifSectionSendTest => 'Invia notifica di prova';

  @override
  String get notifChannelName => 'Promemoria di studio';

  @override
  String get notifChannelDescription =>
      'Ti ricorda di studiare i vocaboli (mai dopo le 21).';

  @override
  String get notifTestTitle => '👋 Ciao! Ecco come sono i tuoi promemoria';

  @override
  String get notifTestBody =>
      'Mi faccio sentire quando ci sono vocaboli che ti aspettano, mai dopo le 21.';

  @override
  String notifFirst1Title(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '🧠 $n vocaboli ti aspettano',
      one: '🧠 1 vocabolo ti aspetta',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst1Body => 'Bastano pochi minuti: si parte!';

  @override
  String get notifFirst2Title => '⚔️ I vocaboli all\'attacco!';

  @override
  String notifFirst2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Oggi ce ne sono $n da sconfiggere.',
      one: 'Oggi ce n\'è 1 da sconfiggere.',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst3Title => '🕵️ Missione segreta di oggi';

  @override
  String notifFirst3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Decifra $n parole. Pronto?',
      one: 'Decifra 1 parola. Pronto?',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst4Title => '📚 I tuoi vocaboli ti chiamano!';

  @override
  String notifFirst4Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Oggi in programma ci sono $n vocaboli.',
      one: 'Oggi in programma c\'è 1 vocabolo.',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst5Title => '🎯 Missione del giorno';

  @override
  String notifFirst5Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n vocaboli da conquistare: ce la fai con tutti?',
      one: '1 vocabolo da conquistare: ce la fai?',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst6Title => '🦉 Il gufo dello studio ha fame';

  @override
  String notifFirst6Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Dagli da mangiare $n vocaboli!',
      one: 'Dagli da mangiare 1 vocabolo!',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst7Title => '🎲 Scommettiamo?';

  @override
  String notifFirst7Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Scommetto che in 5 minuti impari i $n vocaboli.',
      one: 'Scommetto che in 5 minuti impari quel vocabolo.',
    );
    return '$_temp0';
  }

  @override
  String notifNamed1Title(String name) {
    return '👋 Ehi $name!';
  }

  @override
  String notifNamed1Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Oggi ti aspettano $n vocaboli.',
      one: 'Oggi ti aspetta 1 vocabolo.',
    );
    return '$_temp0';
  }

  @override
  String notifNamed2Title(String name) {
    return '🎯 $name, la tua missione di oggi';
  }

  @override
  String notifNamed2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n vocaboli da conquistare: si parte!',
      one: '1 vocabolo da conquistare: si parte!',
    );
    return '$_temp0';
  }

  @override
  String notifNamed3Title(String name) {
    return '🧠 $name, studiamo un attimo?';
  }

  @override
  String notifNamed3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Oggi in programma ci sono $n vocaboli.',
      one: 'Oggi in programma c\'è 1 vocabolo.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle1Title => '⏰ Psst… i tuoi vocaboli ti aspettano ancora';

  @override
  String notifMiddle1Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Oggi ne mancano ancora $n.',
      one: 'Oggi ne manca ancora 1.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle2Title => '🐢 I vocaboli si spazientiscono';

  @override
  String notifMiddle2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Ne mancano ancora $n: bastano pochi minuti!',
      one: 'Ne manca ancora 1: bastano pochi minuti!',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle3Title => '💬 Le tue carte si chiedono dove sei finito';

  @override
  String notifMiddle3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Restano ancora $n vocaboli.',
      one: 'Resta ancora 1 vocabolo.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle4Title => '🧩 Te ne eri dimenticato?';

  @override
  String notifMiddle4Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n vocaboli vanno ancora ripassati oggi.',
      one: '1 vocabolo va ancora ripassato oggi.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle5Title => '🚀 Una spintarella veloce?';

  @override
  String notifMiddle5Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n carte e poi sei libero.',
      one: '1 carta e poi sei libero.',
    );
    return '$_temp0';
  }

  @override
  String get notifLast1Title => '🌙 Ultima occasione per oggi!';

  @override
  String notifLast1Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Ancora $n vocaboli, poi hai finito.',
      one: 'Ancora 1 vocabolo, poi hai finito.',
    );
    return '$_temp0';
  }

  @override
  String get notifLast2Title => '⌛ La giornata è quasi finita';

  @override
  String notifLast2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n vocaboli e per oggi hai chiuso.',
      one: '1 vocabolo e per oggi hai chiuso.',
    );
    return '$_temp0';
  }

  @override
  String get notifLast3Title => '🛡️ Sprint finale di oggi';

  @override
  String notifLast3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Ancora $n vocaboli e hai finito per oggi.',
      one: 'Ancora 1 vocabolo e hai finito per oggi.',
    );
    return '$_temp0';
  }

  @override
  String notifStreakTitle(int streak) {
    return '🔥 La tua serie di $streak giorni è in pericolo!';
  }

  @override
  String notifStreakTitleNamed(String name, int streak) {
    return '🔥 $name, la tua serie di $streak giorni è in pericolo!';
  }

  @override
  String notifStreakBody(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Ancora $n vocaboli: studia oggi, così non la perdi.',
      one: 'Ancora 1 vocabolo: studia oggi, così non la perdi.',
    );
    return '$_temp0';
  }

  @override
  String notifExamTomorrowTitle(String list) {
    return '🚨 Domani c\'è «$list»!';
  }

  @override
  String notifExamTomorrowBodyLast(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Ultima occasione: ripassa ancora $n vocaboli!',
      one: 'Ultima occasione: ripassa ancora 1 vocabolo!',
    );
    return '$_temp0';
  }

  @override
  String notifExamTomorrowBody(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Oggi è l\'ultimo giorno di studio: ti aspettano $n vocaboli.',
      one: 'Oggi è l\'ultimo giorno di studio: ti aspetta 1 vocabolo.',
    );
    return '$_temp0';
  }

  @override
  String notifExamSoonTitle(int days, String list) {
    return '⚡ Ancora $days giorni a «$list»';
  }

  @override
  String notifExamSoonBody(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Sprint finale! Oggi tocca a $n vocaboli.',
      one: 'Sprint finale! Oggi tocca a 1 vocabolo.',
    );
    return '$_temp0';
  }

  @override
  String notifExamDayTitle(String list) {
    return '🍀 Oggi c\'è «$list»!';
  }

  @override
  String get notifExamDayBody =>
      'Ti sei allenato: ora fai vedere cosa sai. In bocca al lupo! 💪';

  @override
  String get analyseEmptyTitle => 'Ancora nessuna lista di esercizio';

  @override
  String get analyseEmptyText =>
      'Crea una lista di esercizio per vedere qui i tuoi progressi.';

  @override
  String analyseSummary(int total, int good, int neutral, int weak) {
    String _temp0 = intl.Intl.pluralLogic(
      total,
      locale: localeName,
      other: '$total vocaboli',
      one: '1 vocabolo',
    );
    return '$_temp0 · $good bene · $neutral neutri · $weak deboli';
  }

  @override
  String analyseGoalUntil(String date) {
    return 'Obiettivo entro il $date';
  }

  @override
  String get analyseOverallGoal => 'Obiettivo totale';

  @override
  String analyseKnown(int known, int total) {
    return '$known/$total vocaboli saputi';
  }

  @override
  String get analyseDailyGoal => 'Obiettivo del giorno';

  @override
  String get analyseAllDone => 'tutto fatto';

  @override
  String analyseLearnedToday(int learned, int target) {
    return '$learned/$target studiati oggi';
  }

  @override
  String get analyseAllKnown => 'Sai tutti i vocaboli! 🎉';

  @override
  String analyseRemaining(int days, int remaining) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Ancora $days giorni',
      one: 'Ancora 1 giorno',
    );
    String _temp1 = intl.Intl.pluralLogic(
      remaining,
      locale: localeName,
      other: '$remaining vocaboli',
      one: '1 vocabolo',
    );
    return '$_temp0 · $_temp1 da fare.';
  }

  @override
  String get vocabDetailNeverPracticed => 'Mai esercitato';

  @override
  String vocabDetailMemoryDue(int percent, int reps) {
    return 'Memoria: $percent % · da ripassare ora · esercitato $reps×';
  }

  @override
  String vocabDetailMemoryNext(int percent, String interval, int reps) {
    return 'Memoria: $percent % · di nuovo tra $interval · esercitato $reps×';
  }

  @override
  String get vocabDetailNoHistory => 'Ancora nessuno storico.';

  @override
  String get vocabDetailWorse => 'Peggio';

  @override
  String get vocabDetailBetter => 'Meglio';

  @override
  String get levelVeryGood => 'Ottimo';

  @override
  String get levelGood => 'Buono';

  @override
  String get levelQuiteGood => 'Abbastanza buono';

  @override
  String get levelOkay => 'Discreto';

  @override
  String get levelSlightlyGood => 'Quasi buono';

  @override
  String get levelNeutral => 'Neutro';

  @override
  String get levelSlightlyWeak => 'Un po\' debole';

  @override
  String get levelWeak => 'Debole';

  @override
  String get levelQuiteWeak => 'Piuttosto debole';

  @override
  String get levelBad => 'Scarso';

  @override
  String get levelVeryBad => 'Molto scarso';

  @override
  String get tutorialTitle => 'Come funziona l\'app';

  @override
  String get tutorialPage1Title => 'Come funziona Vokabeltrainer';

  @override
  String get tutorialPage1Text =>
      'Questa app ti aiuta a imparare i vocaboli in qualsiasi lingua, con flashcard, test e un ripasso intelligente. Scorri verso sinistra o tocca «Avanti» per scoprire tutto.';

  @override
  String get tutorialPage2Title => 'Crea una lezione';

  @override
  String get tutorialPage2Text =>
      'Nella scheda «Lezioni» crei una lezione: nome, lingua e cosa vuoi imparare. Parola e traduzione, se vuoi anche le forme e fino a tre campi tuoi come frase d\'esempio o trucco per ricordare.';

  @override
  String get tutorialPage3Title => 'Scansiona i vocaboli';

  @override
  String get tutorialPage3Text =>
      'Scrivi tu i vocaboli, oppure tocca «Scansiona» e fotografa la lista dal tuo libro. Un\'app di IA come ChatGPT o Gemini la legge. Copia la sua risposta, torna qui, fatto.';

  @override
  String get tutorialPage4Title => 'Crea liste di esercizio';

  @override
  String get tutorialPage4Text =>
      'Nella home tocca «Liste di esercizio» e poi «Nuova lista». Dai un nome alla lista, se vuoi la data della tua verifica, e scegli i vocaboli dalle tue lezioni.';

  @override
  String get tutorialPage5Title => 'Studia ogni giorno';

  @override
  String get tutorialPage5Text =>
      'Nella home, sotto «Oggi», trovi cosa tocca adesso dalle tue liste: prima i ripassi in scadenza, poi fino a 15 vocaboli nuovi. Tocca «Si parte!» per iniziare.';

  @override
  String get tutorialPage6Title => 'Flashcard';

  @override
  String get tutorialPage6Text =>
      'Tocca la carta per girarla e valutati con sincerità: «Ancora», «Difficile», «Bene» o «Facile». Sotto ogni pulsante vedi quando la carta tornerà. Al PC: barra spaziatrice per girare, 1–4 per valutare.';

  @override
  String get tutorialPage7Title => 'Ripasso intelligente';

  @override
  String get tutorialPage7Text =>
      'L\'app ti chiede ogni vocabolo proprio quando stai per dimenticarlo (ripetizione dilazionata con FSRS, come in Anki). Le parole che sai bene tornano meno spesso, quelle difficili più spesso. Studia un po\' ogni giorno: così tieni viva la tua 🔥 serie.';

  @override
  String get tutorialPage8Title => 'La verifica sotto controllo';

  @override
  String get tutorialPage8Text =>
      'Quando crei una lista, inserisci la data della tua verifica. L\'app distribuisce i vocaboli nuovi sui giorni in modo che tu finisca il giorno PRIMA della verifica: lì si ripassa tutto un\'ultima volta. Più la verifica è vicina, più spesso tornano i vocaboli.';

  @override
  String get tutorialPage9Title => 'Promemoria';

  @override
  String get tutorialPage9Text =>
      'L\'app ti ricorda di studiare fino a 3 volte al giorno, con i numeri aggiornati e mai dopo le 21. Se oggi hai finito tutto, nessun disturbo. Puoi impostarlo in Impostazioni → Promemoria.';

  @override
  String get tutorialPage10Title => 'Modalità Test';

  @override
  String get tutorialPage10Text =>
      'Qui scrivi tu la traduzione e/o le forme, se vuoi anche i tuoi campi (Impostazioni). Nel controllo non contano maiuscole/minuscole e articoli (il/la/lo).';

  @override
  String get tutorialPage11Title => 'Guarda i tuoi progressi';

  @override
  String get tutorialPage11Text =>
      'Nella scheda «Analisi» vedi ogni vocabolo con il suo livello: 5 toni di verde (bene), grigio (neutro) e 5 toni di rosso (debole). Tocca un vocabolo per vedere il grafico e alzarlo o abbassarlo a mano con +/−.';

  @override
  String get tutorialPage12Title => 'I tuoi dati';

  @override
  String get tutorialPage12Text =>
      'Tutto viene salvato solo su questo dispositivo, senza account e senza Internet. Ogni tanto fai un backup nelle impostazioni: così puoi anche passare a un altro dispositivo.';

  @override
  String get dashboardGreetingNight => 'Ancora sveglio? 🌙';

  @override
  String dashboardGreetingNightName(String name) {
    return 'Ancora sveglio, $name? 🌙';
  }

  @override
  String get dashboardGreetingMorning => 'Buongiorno! ☀️';

  @override
  String dashboardGreetingMorningName(String name) {
    return 'Buongiorno, $name! ☀️';
  }

  @override
  String get dashboardGreetingDay => 'Ciao! 👋';

  @override
  String dashboardGreetingDayName(String name) {
    return 'Ciao, $name! 👋';
  }

  @override
  String get dashboardGreetingEvening => 'Buonasera! 🌆';

  @override
  String dashboardGreetingEveningName(String name) {
    return 'Buonasera, $name! 🌆';
  }

  @override
  String dashboardStreakLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'giorni di serie',
      one: 'giorno di serie',
    );
    return '$_temp0';
  }

  @override
  String get dashboardPracticedToday => 'esercitati oggi';

  @override
  String dashboardKnownOf(int total) {
    return 'su $total saputi';
  }

  @override
  String get dashboardPracticeLists => 'Liste di esercizio';

  @override
  String get dashboardPracticeListsEmpty =>
      'Prepara i vocaboli per una verifica';

  @override
  String dashboardListCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count liste',
      one: '1 lista',
    );
    return '$_temp0';
  }

  @override
  String get dashboardHelpTitle => 'Aiuto e guida';

  @override
  String get dashboardHelpSubtitle => 'Come funziona Vokabeltrainer';

  @override
  String get dashboardStreakNone => 'Inizia oggi la tua serie!';

  @override
  String get dashboardStreakFirstDay =>
      'Giorno 1 della tua serie: continua così!';

  @override
  String dashboardStreakRun(int count) {
    return '🔥 $count giorni di fila!';
  }

  @override
  String get dashboardGetStarted => 'Cominciamo!';

  @override
  String get dashboardNoListsHint =>
      'Crea ora una lista di esercizio: dalle un nome e scegli i vocaboli che vuoi imparare.';

  @override
  String get dashboardNoLessonsHint =>
      'Prima crea una lezione. I vocaboli li scrivi tu o li scansioni dal libro con un\'app di IA.';

  @override
  String get dashboardCreateList => 'Crea lista di esercizio';

  @override
  String get dashboardCreateLesson => 'Crea lezione';

  @override
  String get dashboardAllDone => 'Per oggi è tutto fatto!';

  @override
  String get dashboardToday => 'Oggi';

  @override
  String dashboardDoneReviewed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Oggi hai completato $count domande. Domani si continua!',
      one: 'Oggi hai completato 1 domanda. Domani si continua!',
    );
    return '$_temp0';
  }

  @override
  String get dashboardNothingDue =>
      'Al momento non c\'è niente da ripassare. Torna domani!';

  @override
  String get dashboardDueLabel => 'da ripassare';

  @override
  String get dashboardNewLabel => 'nuovi';

  @override
  String get dashboardFromLists => 'Dalle tue liste di esercizio';

  @override
  String dashboardExamToday(String name) {
    return 'Oggi c\'è «$name»!';
  }

  @override
  String get dashboardExamTodayText =>
      'Ti sei allenato: ora fai vedere cosa sai. In bocca al lupo!';

  @override
  String dashboardExamTomorrow(String name) {
    return 'Domani c\'è «$name»!';
  }

  @override
  String get dashboardExamTomorrowText =>
      'Oggi è l\'ultimo giorno di studio: si ripassa tutto un\'ultima volta.';

  @override
  String dashboardExamInDays(String name, int days) {
    return '«$name» tra $days giorni';
  }

  @override
  String dashboardExamFinalSpurt(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sprint finale! Ancora $count giorni di studio: ognuno conta.',
      one: 'Sprint finale! Ancora 1 giorno di studio: ognuno conta.',
    );
    return '$_temp0';
  }

  @override
  String dashboardExamDaysLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Ancora $count giorni di studio. L\'app distribuisce i vocaboli così finisci in tempo.',
      one:
          'Ancora 1 giorno di studio. L\'app distribuisce i vocaboli così finisci in tempo.',
    );
    return '$_temp0';
  }

  @override
  String get practiceListsNeedLesson =>
      'Prima crea in «Lezioni» una lezione con dei vocaboli.';

  @override
  String practiceListsLimit(int max) {
    return 'Limite raggiunto: puoi avere al massimo $max liste insieme.';
  }

  @override
  String get practiceListsCountdownPast => ' · passata ✅';

  @override
  String get practiceListsCountdownToday => ' · oggi! 🍀';

  @override
  String get practiceListsCountdownTomorrow => ' · domani!';

  @override
  String practiceListsCountdownDays(int days) {
    return ' · tra $days giorni';
  }

  @override
  String get practiceListsDueDateTitle => 'Quando c\'è la verifica?';

  @override
  String get practiceListsChangeDueDate => 'Cambia data verifica';

  @override
  String get practiceListsDueDateHint =>
      'Facoltativo. L\'app distribuisce i vocaboli in modo che tu sappia tutto entro il giorno prima della verifica: il giorno stesso non devi più esercitarti.';

  @override
  String get practiceListsPickDate => 'Scegli data';

  @override
  String get practiceListsRemoveDate => 'Rimuovi';

  @override
  String practiceListsNotifyOnSnack(String name) {
    return 'Promemoria per «$name» attivi.';
  }

  @override
  String practiceListsNotifyOffSnack(String name) {
    return 'Niente più promemoria per «$name».';
  }

  @override
  String practiceListsDeleteTitle(String name) {
    return 'Eliminare «$name»?';
  }

  @override
  String get practiceListsDeleteText => 'La lista di esercizio verrà rimossa.';

  @override
  String get practiceListsNoVocabs => 'Questa lista non contiene vocaboli.';

  @override
  String get practiceListsTitle => 'Le tue liste di esercizio';

  @override
  String get practiceListsNew => 'Nuova lista';

  @override
  String get practiceListsEmptyTitle => 'Ancora nessuna lista di esercizio';

  @override
  String get practiceListsEmptyText =>
      'Crea la tua prima lista con il pulsante qui sotto.';

  @override
  String practiceListsSubtitleTest(String vocabs, String date) {
    return '$vocabs · Verifica: $date';
  }

  @override
  String get practiceListsNotifyDisable => 'Disattiva promemoria';

  @override
  String get practiceListsNotifyEnable => 'Attiva promemoria';

  @override
  String get practiceListsNameDialogTitle => 'Nuova lista di esercizio';

  @override
  String get practiceListsNameLabel => 'Nome della lista';

  @override
  String get practiceListsNameHint => 'ad es. Verifica vocaboli 1';

  @override
  String get practiceNothingDue =>
      'Per oggi non c\'è più niente da ripassare: grande! 😎 Scegli «Tutti» se vuoi esercitarti lo stesso.';

  @override
  String get practiceNoWeak => 'Nessun vocabolo debole. 😎';

  @override
  String get practiceTitle => 'Scegli modalità';

  @override
  String practiceSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count vocaboli selezionati',
      one: '1 vocabolo selezionato',
    );
    return '$_temp0';
  }

  @override
  String get practiceModeFlashcards => 'Flashcard';

  @override
  String get practiceModeTest => 'Test';

  @override
  String get practiceWhichVocabs => 'Quali vocaboli?';

  @override
  String get practiceFilterSmart => 'Da ripassare e nuovi';

  @override
  String get practiceFilterAll => 'Tutti';

  @override
  String get practiceFilterWeak => 'Deboli';

  @override
  String practicePlanSummary(int due, int fresh) {
    return '$due da ripassare · $fresh nuovi';
  }

  @override
  String practicePlanSummaryLater(int due, int fresh, int later) {
    return '$due da ripassare · $fresh nuovi ($later altri più avanti)';
  }

  @override
  String get practiceFlashcardsHint =>
      'Viene mostrata una parola. Scopri il significato e ti valuti da solo: Ancora, Difficile, Bene o Facile.';

  @override
  String get practiceTestHint =>
      'Viene mostrata una parola. Scrivi tu traduzione e forme.';

  @override
  String get practiceSmartHint =>
      '«Da ripassare e nuovi» usa la ripetizione dilazionata (FSRS): ogni vocabolo torna proprio quando stai per dimenticarlo. Se la lista ha una data di verifica, i vocaboli nuovi vengono distribuiti sui giorni fino al giorno prima e prima si ripassa tutto un\'ultima volta.';

  @override
  String get practiceStart => 'Inizia';

  @override
  String get flashcardWord => 'Parola';

  @override
  String get flashcardTranslation => 'Traduzione';

  @override
  String flashcardTitle(int current, int total) {
    return 'Carta $current / $total';
  }

  @override
  String get flashcardTapToFlip => 'Tocca per girare';

  @override
  String get flashcardFlip => 'Gira';

  @override
  String get flashcardRateAgain => 'Ancora';

  @override
  String get flashcardRateHard => 'Difficile';

  @override
  String get flashcardRateGood => 'Bene';

  @override
  String get flashcardRateEasy => 'Facile';

  @override
  String testTranslationLabel(String language) {
    return 'Traduzione ($language)';
  }

  @override
  String get testWordLabel => 'Parola';

  @override
  String testWordLabelWithLanguage(String language) {
    return 'Parola ($language)';
  }

  @override
  String get testFormsLabel => 'Forme';

  @override
  String testTitle(int current, int total) {
    return 'Test $current / $total';
  }

  @override
  String get testTranslate => 'Traduci:';

  @override
  String testCorrectAnswer(String answer) {
    return 'Giusto: $answer';
  }

  @override
  String get testWrong => 'Sbagliato';

  @override
  String get testResultCorrect => 'Giusto! 🎉';

  @override
  String get testResultWrong => 'Purtroppo sbagliato.';

  @override
  String get testCheck => 'Controlla';

  @override
  String get selectionColumnWord => 'Parola';

  @override
  String get selectionColumnForms => 'Forme';

  @override
  String get selectionColumnTranslation => 'Traduzione';

  @override
  String get selectionTitle => 'Scegli vocaboli';

  @override
  String get selectionMenuTooltip => 'Selezione';

  @override
  String get selectionSelectAll => 'Seleziona tutti';

  @override
  String get selectionClear => 'Annulla selezione';

  @override
  String selectionConfirm(String label, String vocabs) {
    return '$label ($vocabs)';
  }

  @override
  String get homeTabStart => 'Home';

  @override
  String get homeTabLessons => 'Lezioni';

  @override
  String get homeTabAnalysis => 'Analisi';

  @override
  String get sessionSummaryExcellent => 'Eccellente!';

  @override
  String get sessionSummaryGreat => 'Grande lavoro!';

  @override
  String get sessionSummaryGood => 'Bell\'allenamento!';

  @override
  String get sessionSummaryKeepGoing => 'Non mollare!';

  @override
  String sessionSummaryScore(int correct, int total) {
    return '$correct su $total saputi al primo tentativo.';
  }

  @override
  String get sessionSummaryScheduled =>
      'L\'app decide in automatico quando ogni vocabolo tornerà.';

  @override
  String get sessionSummaryRestart => 'Ancora';

  @override
  String get changelogTitle => 'Novità';

  @override
  String get changelogGotIt => 'Tutto chiaro!';

  @override
  String get changelog6Title => '🔒 La privacy in breve';

  @override
  String get changelog6Text =>
      'In Impostazioni → «Info sull\'app» trovi l\'informativa sulla privacy e l\'introduzione da rileggere: tutto resta sul tuo telefono e l\'app è senza pubblicità e senza acquisti.';

  @override
  String get changelog5Title => '🤖 Scansione solo con app di IA';

  @override
  String get changelog5Text =>
      'Quando scansioni, ora puoi scegliere solo app di IA come ChatGPT o Gemini. Le istruzioni per l\'IA vengono inviate subito insieme.';

  @override
  String get changelog4Title => '🧩 Più forme';

  @override
  String get changelog4Text =>
      'Nuovo nelle forme: plurale, comparativo, caso/preposizione, declinazione/coniugazione e parte del discorso. Con «Tutto» l\'IA prende davvero tutto quello che il libro indica per la parola.';

  @override
  String get changelog3Title => '👋 Con il tuo nome';

  @override
  String get changelog3Text =>
      'Se vuoi, l\'app ti saluta per nome, anche nei promemoria. Puoi cambiarlo nelle impostazioni.';

  @override
  String get changelog2Title => '💡 Brevi consigli';

  @override
  String get changelog2Text =>
      'La prima volta una piccola finestra spiega come creare una lezione, scrivere e scansionare. Con «Non mostrare più» sparisce.';

  @override
  String get changelog1Title => '📚 Lezioni in ogni lingua';

  @override
  String get changelog1Text =>
      'Crea le tue lezioni (inglese, francese, latino o quello che studi) e scrivi i vocaboli o scansionali dal libro.';

  @override
  String intervalMinutes(int n) {
    return '$n min';
  }

  @override
  String intervalHours(int n) {
    return '$n h';
  }

  @override
  String intervalDays(int n) {
    return '$n g';
  }

  @override
  String intervalMonths(int n) {
    return '$n mesi';
  }

  @override
  String intervalYears(String n) {
    return '$n a';
  }

  @override
  String get changelog7Title => '🌍 Ora in 10 lingue';

  @override
  String get changelog7Text =>
      'L’app ora è in tedesco, inglese, spagnolo, francese, italiano, portoghese, polacco, turco, russo e cinese. Puoi cambiare la lingua nelle impostazioni.';

  @override
  String get appTitle => 'Vocaboli';
}
