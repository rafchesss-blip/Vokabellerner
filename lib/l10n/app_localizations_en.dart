// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonSave => 'Save';

  @override
  String get commonDelete => 'Delete';

  @override
  String get commonEdit => 'Edit';

  @override
  String get commonNext => 'Next';

  @override
  String get commonBack => 'Back';

  @override
  String get commonDone => 'Done';

  @override
  String get commonOk => 'OK';

  @override
  String get commonClose => 'Close';

  @override
  String get commonLetsGo => 'Let\'s go';

  @override
  String get commonSkip => 'Skip';

  @override
  String get commonUndo => 'Undo';

  @override
  String get commonOptions => 'Options';

  @override
  String get commonSettings => 'Settings';

  @override
  String get commonHome => 'Go to home';

  @override
  String get languagePickerTitle => 'App language';

  @override
  String get languagePickerHint => 'You can change it later in the settings.';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get languageGerman => 'German';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageSpanish => 'Spanish';

  @override
  String get languageFrench => 'French';

  @override
  String get languageItalian => 'Italian';

  @override
  String get languagePortuguese => 'Portuguese';

  @override
  String get languagePolish => 'Polish';

  @override
  String get languageTurkish => 'Turkish';

  @override
  String get languageRussian => 'Russian';

  @override
  String get languageChinese => 'Chinese';

  @override
  String get languageLatin => 'Latin';

  @override
  String vocabCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count words',
      one: '1 word',
    );
    return '$_temp0';
  }

  @override
  String get lessonScreenManualHintTitle => 'Type in words';

  @override
  String get lessonScreenManualHintText =>
      'You get a field for each detail of this lesson. Only the word and translation have to be filled in. Later you can tap any word to change it.';

  @override
  String lessonScreenVocabAdded(String word) {
    return '“$word” added.';
  }

  @override
  String lessonScreenVocabDeleted(String word) {
    return '“$word” deleted.';
  }

  @override
  String get lessonScreenScanHintTitle => 'How scanning works';

  @override
  String lessonScreenScanHintText(String columns) {
    return '1. Take a photo of the word list – straight and easy to read.\n2. Pick an AI app. It opens with the photo and the instructions.\n3. Send the message.\n4. Copy the answer and come back – the words are recognized automatically.\n\nWhat gets read: $columns';
  }

  @override
  String get lessonScreenFreeAiHintTitle => 'A free AI works best';

  @override
  String get lessonScreenFreeAiHintText =>
      'ChatGPT, Gemini and others read words reliably even in the free version – you don\'t need a subscription. The instructions for the AI are added automatically.';

  @override
  String lessonScreenAiOpenFailed(String app) {
    return 'Couldn\'t open $app.';
  }

  @override
  String get lessonScreenNothingInClipboard =>
      'No words in the clipboard. Copy the whole answer in the AI app and try again.';

  @override
  String lessonScreenImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count words added. Tap one to fix it.',
      one: '1 word added. Tap it to fix it.',
    );
    return '$_temp0';
  }

  @override
  String lessonScreenDeleteLessonTitle(String name) {
    return 'Delete “$name”?';
  }

  @override
  String get lessonScreenDeleteLessonText =>
      'The lesson and all its words will be deleted – from your practice lists too.';

  @override
  String get lessonScreenMenuSettings => 'Lesson settings';

  @override
  String get lessonScreenMenuDelete => 'Delete lesson';

  @override
  String get lessonScreenEmpty => 'No words in this lesson yet.';

  @override
  String get lessonScreenWaitingForAi => 'Waiting for the AI\'s answer …';

  @override
  String get lessonScreenWaitingHelp =>
      'Copy the answer in the AI app (copy button on the text block) and come back – the words will then be recognized automatically.';

  @override
  String get lessonScreenPasteAnswer => 'Paste answer';

  @override
  String get lessonScreenAddTitle => 'Add words';

  @override
  String get lessonScreenAddManually => 'Type them in';

  @override
  String get lessonScreenScan => 'Scan';

  @override
  String get lessonScreenScanTip =>
      'Tip: With “Scan” you take a photo of the word list in your book. An AI app like ChatGPT or Gemini reads it for you – no typing needed.';

  @override
  String get lessonScreenTakePhoto => 'Take photo';

  @override
  String get lessonScreenPhotoFromGallery => 'Photo from gallery';

  @override
  String get lessonScreenWhichAi => 'Which AI?';

  @override
  String get lessonScreenNoAiInstalled =>
      'There\'s no AI app on your phone yet. Install one – it\'s free – and then tap “Scan” again.';

  @override
  String lessonScreenInstallApp(String app) {
    return 'Install $app';
  }

  @override
  String get lessonScreenFreeInPlayStore => 'free in the Play Store';

  @override
  String get lessonScreenAiDisclaimer =>
      'Vokabeltrainer isn\'t affiliated with these apps or their providers. Their own privacy policies apply.';

  @override
  String lessonScreenRecognized(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count words recognized',
      one: '1 word recognized',
    );
    return '$_temp0';
  }

  @override
  String lessonScreenDuplicatesSkipped(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count were already in the lesson and will be skipped.',
      one: '1 was already in the lesson and will be skipped.',
    );
    return '$_temp0';
  }

  @override
  String lessonScreenImportButton(int count) {
    return 'Add $count';
  }

  @override
  String get lessonSetupTitleNew => 'New lesson';

  @override
  String get lessonSetupTitleEdit => 'Lesson settings';

  @override
  String get lessonSetupNameLabel => 'Lesson name';

  @override
  String get lessonSetupNameHint => 'e.g. Unit 3 or Lesson 5';

  @override
  String get lessonSetupLanguageLabel => 'Language of the words';

  @override
  String get lessonSetupTranslationLabel => 'Translation into';

  @override
  String get lessonSetupFieldsTitle => 'What do you enter?';

  @override
  String get lessonSetupFieldsHelp =>
      'This decides how typing, AI scanning and the test work.';

  @override
  String get lessonSetupWord => 'Word';

  @override
  String get lessonSetupTranslation => 'Translation';

  @override
  String get lessonSetupAlwaysIncluded => 'always included';

  @override
  String get lessonSetupForms => 'Forms';

  @override
  String get lessonSetupFormsSubtitle =>
      'e.g. principal parts, genitive, gender';

  @override
  String get lessonSetupWhichForms => 'Which forms?';

  @override
  String get lessonSetupAllForms => 'Everything';

  @override
  String get lessonSetupAllFormsHelp =>
      'Everything the book lists for the word: principal parts, plural forms, gender, comparison, case and more.';

  @override
  String get lessonSetupPickOneKind => 'Pick at least one kind.';

  @override
  String get lessonSetupExtrasTitle => 'Extras (up to 3)';

  @override
  String get lessonSetupExtrasHelp =>
      'Your own fields, e.g. example sentence or memory aid.';

  @override
  String lessonSetupExtraFieldLabel(int number) {
    return 'Extra $number – name';
  }

  @override
  String lessonSetupExtraDefaultName(int number) {
    return 'Extra $number';
  }

  @override
  String get lessonSetupRemove => 'Remove';

  @override
  String get lessonSetupExtraChip => 'Extra';

  @override
  String get lessonSetupSuggestionExample => 'Example sentence';

  @override
  String get lessonSetupSuggestionMnemonic => 'Memory aid';

  @override
  String get lessonSetupSuggestionPronunciation => 'Pronunciation';

  @override
  String get lessonSetupSuggestionOpposite => 'Opposite';

  @override
  String get lessonsTabNewLessonHintTitle => 'New lesson';

  @override
  String get lessonsTabNewLessonHintText =>
      'Give the lesson a name and pick the language. Then decide what you want to learn: word and translation are always included, plus forms and up to three of your own fields like example sentence or memory aid if you want.';

  @override
  String get lessonsTabEmptyTitle => 'No lessons yet';

  @override
  String get lessonsTabEmptyText =>
      'Create your first lesson. You can type in the words yourself – or take a photo of the page in your book and let an AI app like ChatGPT or Gemini read it.';

  @override
  String get lessonsTabNewLesson => 'New lesson';

  @override
  String lessonsTabCardStats(int count, int known) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count words',
      one: '1 word',
    );
    return '$_temp0 · $known known';
  }

  @override
  String get vocabFormDialogTitleNew => 'New word';

  @override
  String get vocabFormDialogTitleEdit => 'Edit word';

  @override
  String get vocabFormDialogWord => 'Word';

  @override
  String vocabFormDialogWordWithLanguage(String language) {
    return 'Word ($language)';
  }

  @override
  String vocabFormDialogTranslation(String language) {
    return 'Translation ($language)';
  }

  @override
  String get vocabFormDialogForms => 'Forms';

  @override
  String get vocabFormDialogAllForms => 'all forms';

  @override
  String get introWelcomeTitle => 'Welcome to Vokabeltrainer';

  @override
  String get introWelcomeText =>
      'Learn vocabulary in any language – with flashcards, tests and smart review. Each word comes back right before you\'d forget it.';

  @override
  String get introScanTitle => 'Type or scan';

  @override
  String get introScanText =>
      'Create lessons and type in the words. Or take a photo of the list in your book: an AI app like ChatGPT or Gemini reads it for you.';

  @override
  String get introTestTitle => 'Ready for the test';

  @override
  String get introTestText =>
      'Enter the date of your vocab test. The app spreads the words over the days before it and reminds you to study – never after 9 pm.';

  @override
  String get introPrivacyTitle => 'Everything stays on your phone';

  @override
  String get introPrivacyText =>
      'No account, no cloud: your lessons and progress aren\'t stored anywhere on the internet. Only when you scan does the photo go to the AI app you choose yourself.';

  @override
  String get introFreeTitle => 'Completely free';

  @override
  String get introFreeText =>
      'I don\'t earn anything from this app: no ads, no in-app purchases, no subscription. It\'s just here to help you learn.';

  @override
  String get privacyScreenTitle => 'Privacy';

  @override
  String get nameDialogWelcome => 'Welcome!';

  @override
  String get nameDialogTitle => 'Your name';

  @override
  String get nameDialogIntro =>
      'What\'s your name? Then the app greets you by name – in the reminders too. This is optional.';

  @override
  String get nameDialogLabel => 'Your name (optional)';

  @override
  String get nameDialogLocalOnly => 'Your name is only saved on this phone.';

  @override
  String get hintDialogDontShowAgain => 'Don\'t show again';

  @override
  String get formKindVerbLabel => 'Verb forms';

  @override
  String get formKindNounLabel => 'Noun forms';

  @override
  String get formKindPluralLabel => 'Plural';

  @override
  String get formKindAdjectiveLabel => 'Adjective forms';

  @override
  String get formKindComparisonLabel => 'Comparison';

  @override
  String get formKindGenderLabel => 'Gender';

  @override
  String get formKindInflectionClassLabel => 'Declension/conjugation';

  @override
  String get formKindGovernmentLabel => 'Case/preposition';

  @override
  String get formKindWordClassLabel => 'Part of speech';

  @override
  String get formKindVerbExample =>
      'principal parts or irregular forms, e.g. vocō, vocāvī, vocātum or go, went, gone';

  @override
  String get formKindNounExample => 'e.g. genitive: lūnae';

  @override
  String get formKindPluralExample => 'e.g. mice, les chevaux';

  @override
  String get formKindAdjectiveExample =>
      'forms for the other genders, e.g. bonus, -a, -um';

  @override
  String get formKindComparisonExample => 'e.g. good, better, best';

  @override
  String get formKindGenderExample => 'for nouns, e.g. m, f, n or der/die/das';

  @override
  String get formKindInflectionClassExample =>
      'e.g. 1st declension, 2nd conjugation';

  @override
  String get formKindGovernmentExample =>
      'which case or preposition follows, e.g. + dat., depend on';

  @override
  String get formKindWordClassExample => 'e.g. verb, noun, adjective, adverb';

  @override
  String get vocabModelDefaultBoxName => 'Words';

  @override
  String get aiScanColumnWord => 'Word';

  @override
  String get aiScanColumnTranslation => 'Translation';

  @override
  String get aiScanColumnForms => 'Forms';

  @override
  String get aiScanForeignLanguage => 'the foreign language';

  @override
  String aiScanPromptIntro(String language, String translationLanguage) {
    return 'Read all the vocabulary in the photo (words in $language, translations in $translationLanguage).';
  }

  @override
  String get aiScanPromptAnswerOnly =>
      'Reply ONLY with a single code block in exactly this format, with no other text:';

  @override
  String get aiScanPromptRules => 'Rules:';

  @override
  String aiScanPromptRuleColumns(int count, String columns) {
    return 'One line per word, columns separated by \" | \", always exactly $count columns in this order: $columns.';
  }

  @override
  String aiScanPromptRuleNoHeader(String marker) {
    return 'Leave out the line with the column names; the first line is always $marker.';
  }

  @override
  String aiScanPromptRuleWord(String column) {
    return '$column: spelled exactly as in the photo, with all special characters and accents.';
  }

  @override
  String aiScanPromptRuleTranslation(String column) {
    return '$column: as in the photo; separate multiple meanings with commas.';
  }

  @override
  String aiScanPromptRuleAllForms(String column) {
    return '$column: ALL grammatical information given for the word in the photo – leave nothing out. For example (but not only):';
  }

  @override
  String get aiScanPromptRuleAllFormsMore =>
      'Anything else that belongs to the word (abbreviations, notes in brackets) goes here too. Separate multiple items with commas.';

  @override
  String get aiScanPromptRuleAllFormsNone =>
      'If the photo has no information for the word, write \"-\".';

  @override
  String aiScanPromptRuleSomeForms(String column) {
    return '$column: only this information, multiple items separated by commas:';
  }

  @override
  String aiScanPromptRuleOmit(String kinds) {
    return 'Leave out: $kinds.';
  }

  @override
  String get aiScanPromptRuleSomeFormsNone =>
      'If a word has no such information (e.g. an adverb), write \"-\".';

  @override
  String aiScanPromptRuleExtra(String label) {
    return '$label: from the photo; if there\'s nothing there, write \"-\".';
  }

  @override
  String get aiScanPromptRuleMissing =>
      'If something is missing, write \"-\". Don\'t make up anything that isn\'t in the photo.';

  @override
  String get aiScanPromptRuleNoPipe => 'Don\'t use \"|\" inside a column.';

  @override
  String get settingsThemeDark => 'Dark mode';

  @override
  String get settingsThemeLight => 'Light mode';

  @override
  String get settingsThemeSystem => 'System (automatic)';

  @override
  String get settingsThemeDarkDesc =>
      'Dark background with glowing neon colors.';

  @override
  String get settingsThemeLightDesc =>
      'Bright, minimalist design in white and light gray.';

  @override
  String get settingsThemeSystemDesc => 'Follows your device\'s setting.';

  @override
  String get settingsAccentViolet => 'Neon violet';

  @override
  String get settingsAccentCyan => 'Neon cyan';

  @override
  String get settingsAccentEmerald => 'Neon emerald';

  @override
  String get settingsAccentOrange => 'Neon orange';

  @override
  String get settingsAccentPink => 'Neon pink';

  @override
  String get settingsDirectionForward => 'Word → translation';

  @override
  String get settingsDirectionBackward => 'Translation → word';

  @override
  String get settingsDirectionForwardDesc =>
      'The app shows the word, you answer with the meaning.';

  @override
  String get settingsDirectionBackwardDesc =>
      'The app shows the translation, you answer with the word.';

  @override
  String get settingsAnswerTranslationOnly => 'Translation only';

  @override
  String get settingsAnswerWordOnly => 'Word only';

  @override
  String get settingsAnswerFormsOnly => 'Forms only';

  @override
  String get settingsAnswerBoth => 'Both';

  @override
  String get settingsAnswerTranslationOnlyDesc =>
      'You only answer with the translation.';

  @override
  String get settingsAnswerWordOnlyDesc => 'You only answer with the word.';

  @override
  String get settingsAnswerFormsOnlyDesc => 'You only answer with the forms.';

  @override
  String get settingsAnswerBothTranslationDesc =>
      'You answer with the translation and the forms.';

  @override
  String get settingsAnswerBothWordDesc =>
      'You answer with the word and the forms.';

  @override
  String get settingsNameTitle => 'Your name';

  @override
  String get settingsNameEmpty => 'Not set – only saved on this phone';

  @override
  String settingsNameSaved(String name) {
    return '$name · only saved on this phone';
  }

  @override
  String get settingsDesignTitle => 'Theme';

  @override
  String get settingsAccentTitle => 'Accent color (neon)';

  @override
  String get settingsAccentHint =>
      'The accent color is used for buttons, switches and highlights. In dark mode the colors glow; in light mode they\'re automatically toned down a bit so everything stays easy to read.';

  @override
  String get settingsDirectionTitle => 'Direction';

  @override
  String get settingsAnswerModeTitle => 'What to type in the test';

  @override
  String get settingsAskExtrasTitle => 'Also ask extras';

  @override
  String get settingsAskExtrasSubtitle =>
      'e.g. example sentence or memory aid – if the word has any.';

  @override
  String get settingsFormsHint =>
      'Forms are e.g. principal parts, genitive or gender. If a word has no forms, only the translation is asked. This setting applies to test mode.';

  @override
  String get settingsAboutTitle => 'About the app';

  @override
  String get settingsShowIntro => 'View intro';

  @override
  String get settingsPrivacyTitle => 'Privacy';

  @override
  String get settingsPrivacySubtitle => 'Everything stays on your phone';

  @override
  String get settingsLicensesTitle => 'Licenses';

  @override
  String get settingsLicensesSubtitle => 'Software used';

  @override
  String get settingsLicensesLegalese =>
      'Free, with no ads and no in-app purchases.';

  @override
  String get backupExported => 'Downloading backup.';

  @override
  String get backupCopied =>
      'Backup copied to the clipboard – e.g. paste it into a note.';

  @override
  String get backupRestoreTitle => 'Restore backup?';

  @override
  String get backupRestoreMessage =>
      'Your current progress and practice lists will be replaced by the backup.';

  @override
  String get backupRestoreAction => 'Restore';

  @override
  String get backupRestored => 'Backup restored. ✅';

  @override
  String get backupResetTitle => 'Reset progress?';

  @override
  String get backupResetMessage =>
      'All learning levels and review dates will be deleted. Lessons and practice lists are kept.';

  @override
  String get backupResetAction => 'Reset';

  @override
  String get backupResetDone => 'Progress reset.';

  @override
  String get backupPasteTitle => 'Paste backup';

  @override
  String get backupTitle => 'Data & backup';

  @override
  String get backupHint =>
      'Your progress is only saved on this device. Make a backup every now and then – you can also use it to move to another device.';

  @override
  String get backupExportTitle => 'Export backup';

  @override
  String get backupExportFile => 'Download as a file';

  @override
  String get backupExportClipboard => 'Copy to clipboard';

  @override
  String get backupImportTitle => 'Import backup';

  @override
  String get backupImportFile => 'Choose backup file';

  @override
  String get backupImportPaste => 'Paste backup text';

  @override
  String get backupResetTile => 'Reset progress';

  @override
  String get storeBackupInvalid => 'This isn\'t a valid backup file.';

  @override
  String get storeBackupCorrupt => 'The backup file is damaged.';

  @override
  String get notifSectionBlocked =>
      'Notifications are blocked. Allow them for Vokabeltrainer in the Android settings.';

  @override
  String get notifSectionTitle => 'Reminders';

  @override
  String get notifSectionAndroidOnly =>
      '📱 Real reminders are available in the Android app: several times a day, with up-to-date numbers and never after 9 pm.';

  @override
  String get notifSectionSwitchTitle => 'Study reminders';

  @override
  String get notifSectionSwitchSubtitle =>
      'With up-to-date numbers – never after 9 pm. Once you\'re done for the day, they stop.';

  @override
  String get notifSectionHowOften => 'How often per day?';

  @override
  String notifSectionTimes(String times) {
    return 'at $times';
  }

  @override
  String get notifSectionSendTest => 'Send test notification';

  @override
  String get notifChannelName => 'Study reminders';

  @override
  String get notifChannelDescription =>
      'Reminds you to study your vocab (never after 9 pm).';

  @override
  String get notifTestTitle => '👋 Hi! This is what your reminders look like';

  @override
  String get notifTestBody =>
      'I\'ll let you know when words are waiting for you – never after 9 pm.';

  @override
  String notifFirst1Title(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '🧠 $n words are waiting for you',
      one: '🧠 1 word is waiting for you',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst1Body => 'A few minutes is all it takes – let\'s go!';

  @override
  String get notifFirst2Title => '⚔️ The words are attacking!';

  @override
  String notifFirst2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n of them want to be defeated today.',
      one: '1 of them wants to be defeated today.',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst3Title => '🕵️ Secret mission for today';

  @override
  String notifFirst3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Decode $n words. Ready?',
      one: 'Decode 1 word. Ready?',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst4Title => '📚 Your words are calling!';

  @override
  String notifFirst4Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n words are on today\'s plan.',
      one: '1 word is on today\'s plan.',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst5Title => '🎯 Mission of the day';

  @override
  String notifFirst5Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Crack $n words – can you get them all?',
      one: 'Crack 1 word – can you do it?',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst6Title => '🦉 The study owl is hungry';

  @override
  String notifFirst6Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Feed it $n words!',
      one: 'Feed it 1 word!',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst7Title => '🎲 Wanna bet?';

  @override
  String notifFirst7Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'I bet you can do those $n words in 5 minutes.',
      one: 'I bet you can do that one word in 5 minutes.',
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
      other: '$n words are waiting for you today.',
      one: '1 word is waiting for you today.',
    );
    return '$_temp0';
  }

  @override
  String notifNamed2Title(String name) {
    return '🎯 $name, your mission for today';
  }

  @override
  String notifNamed2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Crack $n words – let\'s go!',
      one: 'Crack 1 word – let\'s go!',
    );
    return '$_temp0';
  }

  @override
  String notifNamed3Title(String name) {
    return '🧠 $name, quick study session?';
  }

  @override
  String notifNamed3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n words are on today\'s plan.',
      one: '1 word is on today\'s plan.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle1Title => '⏰ Psst… your words are still waiting';

  @override
  String notifMiddle1Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n are still open today.',
      one: '1 is still open today.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle2Title => '🐢 The words are getting impatient';

  @override
  String notifMiddle2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n still waiting – just a few minutes!',
      one: '1 still waiting – just a few minutes!',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle3Title => '💬 Your cards are asking where you are';

  @override
  String notifMiddle3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n words are still left.',
      one: '1 word is still left.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle4Title => '🧩 Almost forgot?';

  @override
  String notifMiddle4Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n words still need a review today.',
      one: '1 word still needs a review today.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle5Title => '🚀 Up for a quick boost?';

  @override
  String notifMiddle5Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n cards, then you\'re free.',
      one: '1 card, then you\'re free.',
    );
    return '$_temp0';
  }

  @override
  String get notifLast1Title => '🌙 Last chance for today!';

  @override
  String notifLast1Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n more words – then you\'re done for the day.',
      one: '1 more word – then you\'re done for the day.',
    );
    return '$_temp0';
  }

  @override
  String get notifLast2Title => '⌛ The day is almost over';

  @override
  String notifLast2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n words, then you\'re done for today.',
      one: '1 word, then you\'re done for today.',
    );
    return '$_temp0';
  }

  @override
  String get notifLast3Title => '🛡️ Final sprint for today';

  @override
  String notifLast3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n more words until you\'re done.',
      one: '1 more word until you\'re done.',
    );
    return '$_temp0';
  }

  @override
  String notifStreakTitle(int streak) {
    return '🔥 Your $streak-day streak is in danger!';
  }

  @override
  String notifStreakTitleNamed(String name, int streak) {
    return '🔥 $name, your $streak-day streak is in danger!';
  }

  @override
  String notifStreakBody(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n more words – study today so it doesn\'t break.',
      one: '1 more word – study today so it doesn\'t break.',
    );
    return '$_temp0';
  }

  @override
  String notifExamTomorrowTitle(String list) {
    return '🚨 “$list” is tomorrow!';
  }

  @override
  String notifExamTomorrowBodyLast(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Last chance: review $n more words!',
      one: 'Last chance: review 1 more word!',
    );
    return '$_temp0';
  }

  @override
  String notifExamTomorrowBody(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Today is the last study day – $n words are waiting.',
      one: 'Today is the last study day – 1 word is waiting.',
    );
    return '$_temp0';
  }

  @override
  String notifExamSoonTitle(int days, String list) {
    return '⚡ $days days until “$list”';
  }

  @override
  String notifExamSoonBody(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Final sprint! $n words are up today.',
      one: 'Final sprint! 1 word is up today.',
    );
    return '$_temp0';
  }

  @override
  String notifExamDayTitle(String list) {
    return '🍀 “$list” is today!';
  }

  @override
  String get notifExamDayBody =>
      'You\'ve practiced – now show what you can do. Good luck! 💪';

  @override
  String get analyseEmptyTitle => 'No practice lists yet';

  @override
  String get analyseEmptyText =>
      'Create a practice list to see your progress here.';

  @override
  String analyseSummary(int total, int good, int neutral, int weak) {
    String _temp0 = intl.Intl.pluralLogic(
      total,
      locale: localeName,
      other: '$total words',
      one: '1 word',
    );
    return '$_temp0 · $good good · $neutral neutral · $weak weak';
  }

  @override
  String analyseGoalUntil(String date) {
    return 'Goal by $date';
  }

  @override
  String get analyseOverallGoal => 'Overall goal';

  @override
  String analyseKnown(int known, int total) {
    return '$known/$total words known';
  }

  @override
  String get analyseDailyGoal => 'Daily goal';

  @override
  String get analyseAllDone => 'all done';

  @override
  String analyseLearnedToday(int learned, int target) {
    return '$learned/$target learned today';
  }

  @override
  String get analyseAllKnown => 'All words known! 🎉';

  @override
  String analyseRemaining(int days, int remaining) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days',
      one: '1 day',
    );
    String _temp1 = intl.Intl.pluralLogic(
      remaining,
      locale: localeName,
      other: '$remaining words',
      one: '1 word',
    );
    return '$_temp0 left · $_temp1 to go.';
  }

  @override
  String get vocabDetailNeverPracticed => 'Never practiced';

  @override
  String vocabDetailMemoryDue(int percent, int reps) {
    return 'Memory: $percent% · due now · practiced $reps×';
  }

  @override
  String vocabDetailMemoryNext(int percent, String interval, int reps) {
    return 'Memory: $percent% · back in $interval · practiced $reps×';
  }

  @override
  String get vocabDetailNoHistory => 'No history yet.';

  @override
  String get vocabDetailWorse => 'Worse';

  @override
  String get vocabDetailBetter => 'Better';

  @override
  String get levelVeryGood => 'Very good';

  @override
  String get levelGood => 'Good';

  @override
  String get levelQuiteGood => 'Pretty good';

  @override
  String get levelOkay => 'Okay';

  @override
  String get levelSlightlyGood => 'Slightly good';

  @override
  String get levelNeutral => 'Neutral';

  @override
  String get levelSlightlyWeak => 'Slightly weak';

  @override
  String get levelWeak => 'Weak';

  @override
  String get levelQuiteWeak => 'Pretty weak';

  @override
  String get levelBad => 'Bad';

  @override
  String get levelVeryBad => 'Very bad';

  @override
  String get tutorialTitle => 'How the app works';

  @override
  String get tutorialPage1Title => 'How Vokabeltrainer works';

  @override
  String get tutorialPage1Text =>
      'This app helps you learn vocabulary in any language – with flashcards, tests and smart review. Swipe left or tap “Next” to see everything.';

  @override
  String get tutorialPage2Title => 'Create a lesson';

  @override
  String get tutorialPage2Text =>
      'In the “Lessons” tab you create a lesson: name, language and what you want to learn – word and translation, plus forms and up to three of your own fields like example sentence or memory aid if you want.';

  @override
  String get tutorialPage3Title => 'Scan words';

  @override
  String get tutorialPage3Text =>
      'Type in the words yourself – or tap “Scan” and take a photo of the list in your book. An AI app like ChatGPT or Gemini reads it. Copy its answer, come back, done.';

  @override
  String get tutorialPage4Title => 'Create practice lists';

  @override
  String get tutorialPage4Text =>
      'On the home screen, tap “Practice lists” and then “New list”. Give the list a name, optionally the date of your vocab test, and pick the words from your lessons.';

  @override
  String get tutorialPage5Title => 'Study every day';

  @override
  String get tutorialPage5Text =>
      'On the home screen, “Today” shows what\'s up next from your lists: due reviews first, plus up to 15 new words. Tap “Let\'s go” to start.';

  @override
  String get tutorialPage6Title => 'Flashcards';

  @override
  String get tutorialPage6Text =>
      'Tap the card to flip it and rate yourself honestly: “Again”, “Hard”, “Good” or “Easy”. Under each button you can see when the card comes back. On a computer: space to flip, 1–4 to rate.';

  @override
  String get tutorialPage7Title => 'Smart review';

  @override
  String get tutorialPage7Text =>
      'The app asks you each word right before you\'d forget it (spaced repetition with FSRS, like Anki). Words you know well come up less often, tricky ones more often. Study a little every day – that keeps your 🔥 streak alive.';

  @override
  String get tutorialPage8Title => 'Your vocab test in sight';

  @override
  String get tutorialPage8Text =>
      'When you create a list, enter the date of your test. The app spreads the new words over the days so you\'re done the day BEFORE the test – that\'s when everything gets reviewed once more. The closer the test, the more often the words come up.';

  @override
  String get tutorialPage9Title => 'Reminders';

  @override
  String get tutorialPage9Text =>
      'The app reminds you up to 3 times a day – with up-to-date numbers and never after 9 pm. Once you\'re done for the day, they stop. You can change this under Settings → Reminders.';

  @override
  String get tutorialPage10Title => 'Test mode';

  @override
  String get tutorialPage10Text =>
      'Here you type in the translation and/or the forms yourself – and your own fields too if you want (Settings). When checking, upper/lower case and articles (like “the” or “a”) don\'t matter.';

  @override
  String get tutorialPage11Title => 'See your progress';

  @override
  String get tutorialPage11Text =>
      'In the “Analysis” tab you see every word with its learning level: 5 shades of green (good), gray (neutral) and 5 shades of red (weak). Tap a word for its history chart and to make it better or worse by hand with +/−.';

  @override
  String get tutorialPage12Title => 'Your data';

  @override
  String get tutorialPage12Text =>
      'Everything is saved only on this device – no account, no internet. Make a backup in the settings every now and then. You can also use it to move to another device.';

  @override
  String get dashboardGreetingNight => 'Still up? 🌙';

  @override
  String dashboardGreetingNightName(String name) {
    return 'Still up, $name? 🌙';
  }

  @override
  String get dashboardGreetingMorning => 'Good morning! ☀️';

  @override
  String dashboardGreetingMorningName(String name) {
    return 'Good morning, $name! ☀️';
  }

  @override
  String get dashboardGreetingDay => 'Hi! 👋';

  @override
  String dashboardGreetingDayName(String name) {
    return 'Hi, $name! 👋';
  }

  @override
  String get dashboardGreetingEvening => 'Good evening! 🌆';

  @override
  String dashboardGreetingEveningName(String name) {
    return 'Good evening, $name! 🌆';
  }

  @override
  String dashboardStreakLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'day streak',
      one: 'day streak',
    );
    return '$_temp0';
  }

  @override
  String get dashboardPracticedToday => 'practiced today';

  @override
  String dashboardKnownOf(int total) {
    return 'of $total known';
  }

  @override
  String get dashboardPracticeLists => 'Practice lists';

  @override
  String get dashboardPracticeListsEmpty => 'Put together words for a test';

  @override
  String dashboardListCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lists',
      one: '1 list',
    );
    return '$_temp0';
  }

  @override
  String get dashboardHelpTitle => 'Help & guide';

  @override
  String get dashboardHelpSubtitle => 'How Vokabeltrainer works';

  @override
  String get dashboardStreakNone => 'Start your streak today!';

  @override
  String get dashboardStreakFirstDay => 'Day 1 of your streak – keep it up!';

  @override
  String dashboardStreakRun(int count) {
    return '🔥 $count days in a row!';
  }

  @override
  String get dashboardGetStarted => 'Let\'s get started!';

  @override
  String get dashboardNoListsHint =>
      'Create a practice list now: give it a name and pick the words you want to learn.';

  @override
  String get dashboardNoLessonsHint =>
      'Create a lesson first. You can type in the words yourself or scan them from your book with an AI app.';

  @override
  String get dashboardCreateList => 'Create practice list';

  @override
  String get dashboardCreateLesson => 'Create lesson';

  @override
  String get dashboardAllDone => 'All done for today!';

  @override
  String get dashboardToday => 'Today';

  @override
  String dashboardDoneReviewed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'You answered $count questions today. More tomorrow!',
      one: 'You answered 1 question today. More tomorrow!',
    );
    return '$_temp0';
  }

  @override
  String get dashboardNothingDue =>
      'Nothing\'s due right now. Check back tomorrow!';

  @override
  String get dashboardDueLabel => 'to review';

  @override
  String get dashboardNewLabel => 'new';

  @override
  String get dashboardFromLists => 'From your practice lists';

  @override
  String dashboardExamToday(String name) {
    return '“$name” is today!';
  }

  @override
  String get dashboardExamTodayText =>
      'You\'ve practiced – now show what you can do. Good luck!';

  @override
  String dashboardExamTomorrow(String name) {
    return '“$name” is tomorrow!';
  }

  @override
  String get dashboardExamTomorrowText =>
      'Today is the last study day – everything gets reviewed once more.';

  @override
  String dashboardExamInDays(String name, int days) {
    return '“$name” in $days days';
  }

  @override
  String dashboardExamFinalSpurt(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Final sprint! $count study days left – every day counts.',
      one: 'Final sprint! 1 study day left – every day counts.',
    );
    return '$_temp0';
  }

  @override
  String dashboardExamDaysLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count study days left. The app spreads out the words so you\'re done in time.',
      one:
          '1 study day left. The app spreads out the words so you\'re done in time.',
    );
    return '$_temp0';
  }

  @override
  String get practiceListsNeedLesson =>
      'First create a lesson with words under “Lessons”.';

  @override
  String practiceListsLimit(int max) {
    return 'Limit reached: you can have at most $max lists at a time.';
  }

  @override
  String get practiceListsCountdownPast => ' · over ✅';

  @override
  String get practiceListsCountdownToday => ' · today! 🍀';

  @override
  String get practiceListsCountdownTomorrow => ' · tomorrow!';

  @override
  String practiceListsCountdownDays(int days) {
    return ' · $days days left';
  }

  @override
  String get practiceListsDueDateTitle => 'When\'s the vocab test?';

  @override
  String get practiceListsChangeDueDate => 'Change test date';

  @override
  String get practiceListsDueDateHint =>
      'Optional. The app spreads out the words so you know everything by the day before the test – you don\'t have to practice on test day itself.';

  @override
  String get practiceListsPickDate => 'Pick date';

  @override
  String get practiceListsRemoveDate => 'Remove';

  @override
  String practiceListsNotifyOnSnack(String name) {
    return 'Reminders for “$name” are on.';
  }

  @override
  String practiceListsNotifyOffSnack(String name) {
    return 'No more reminders for “$name”.';
  }

  @override
  String practiceListsDeleteTitle(String name) {
    return 'Delete “$name”?';
  }

  @override
  String get practiceListsDeleteText => 'The practice list will be removed.';

  @override
  String get practiceListsNoVocabs => 'This list has no words.';

  @override
  String get practiceListsTitle => 'Your practice lists';

  @override
  String get practiceListsNew => 'New list';

  @override
  String get practiceListsEmptyTitle => 'No practice lists yet';

  @override
  String get practiceListsEmptyText =>
      'Create your first list with the button below.';

  @override
  String practiceListsSubtitleTest(String vocabs, String date) {
    return '$vocabs · Test: $date';
  }

  @override
  String get practiceListsNotifyDisable => 'Turn off reminders';

  @override
  String get practiceListsNotifyEnable => 'Turn on reminders';

  @override
  String get practiceListsNameDialogTitle => 'New practice list';

  @override
  String get practiceListsNameLabel => 'List name';

  @override
  String get practiceListsNameHint => 'e.g. Vocab test 1';

  @override
  String get practiceNothingDue =>
      'Nothing else is due today – awesome! 😎 Pick “All” if you still want to practice.';

  @override
  String get practiceNoWeak => 'No weak words. 😎';

  @override
  String get practiceTitle => 'Choose mode';

  @override
  String practiceSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count words selected',
      one: '1 word selected',
    );
    return '$_temp0';
  }

  @override
  String get practiceModeFlashcards => 'Flashcards';

  @override
  String get practiceModeTest => 'Test';

  @override
  String get practiceWhichVocabs => 'Which words?';

  @override
  String get practiceFilterSmart => 'Due & new';

  @override
  String get practiceFilterAll => 'All';

  @override
  String get practiceFilterWeak => 'Weak';

  @override
  String practicePlanSummary(int due, int fresh) {
    return '$due due · $fresh new';
  }

  @override
  String practicePlanSummaryLater(int due, int fresh, int later) {
    return '$due due · $fresh new ($later more later)';
  }

  @override
  String get practiceFlashcardsHint =>
      'A word is shown. You reveal the meaning and rate yourself: Again, Hard, Good or Easy.';

  @override
  String get practiceTestHint =>
      'A word is shown. You type in the translation and forms yourself.';

  @override
  String get practiceSmartHint =>
      '“Due & new” uses spaced repetition (FSRS): each word comes back right before you\'d forget it. If the list has a test date, the new words are spread over the days up to the day before, and everything gets reviewed once more beforehand.';

  @override
  String get practiceStart => 'Start';

  @override
  String get flashcardWord => 'Word';

  @override
  String get flashcardTranslation => 'Translation';

  @override
  String flashcardTitle(int current, int total) {
    return 'Card $current / $total';
  }

  @override
  String get flashcardTapToFlip => 'Tap to flip';

  @override
  String get flashcardFlip => 'Flip';

  @override
  String get flashcardRateAgain => 'Again';

  @override
  String get flashcardRateHard => 'Hard';

  @override
  String get flashcardRateGood => 'Good';

  @override
  String get flashcardRateEasy => 'Easy';

  @override
  String testTranslationLabel(String language) {
    return 'Translation ($language)';
  }

  @override
  String get testWordLabel => 'Word';

  @override
  String testWordLabelWithLanguage(String language) {
    return 'Word ($language)';
  }

  @override
  String get testFormsLabel => 'Forms';

  @override
  String testTitle(int current, int total) {
    return 'Test $current / $total';
  }

  @override
  String get testTranslate => 'Translate:';

  @override
  String testCorrectAnswer(String answer) {
    return 'Correct: $answer';
  }

  @override
  String get testWrong => 'Wrong';

  @override
  String get testResultCorrect => 'Correct! 🎉';

  @override
  String get testResultWrong => 'Sorry, that\'s wrong.';

  @override
  String get testCheck => 'Check';

  @override
  String get selectionColumnWord => 'Word';

  @override
  String get selectionColumnForms => 'Forms';

  @override
  String get selectionColumnTranslation => 'Translation';

  @override
  String get selectionTitle => 'Select words';

  @override
  String get selectionMenuTooltip => 'Selection';

  @override
  String get selectionSelectAll => 'Select all';

  @override
  String get selectionClear => 'Clear selection';

  @override
  String selectionConfirm(String label, String vocabs) {
    return '$label ($vocabs)';
  }

  @override
  String get homeTabStart => 'Home';

  @override
  String get homeTabLessons => 'Lessons';

  @override
  String get homeTabAnalysis => 'Analysis';

  @override
  String get sessionSummaryExcellent => 'Excellent!';

  @override
  String get sessionSummaryGreat => 'Great job!';

  @override
  String get sessionSummaryGood => 'Nice practice!';

  @override
  String get sessionSummaryKeepGoing => 'Keep at it!';

  @override
  String sessionSummaryScore(int correct, int total) {
    return '$correct of $total known on the first try.';
  }

  @override
  String get sessionSummaryScheduled =>
      'The app automatically plans when each word comes back.';

  @override
  String get sessionSummaryRestart => 'Again';

  @override
  String get changelogTitle => 'What\'s new?';

  @override
  String get changelogGotIt => 'Got it!';

  @override
  String get changelog6Title => '🔒 Privacy at a glance';

  @override
  String get changelog6Text =>
      'Under Settings → “About the app” you\'ll find the privacy policy and the intro to read again: everything stays on your phone, and the app has no ads and no purchases.';

  @override
  String get changelog5Title => '🤖 Scanning with AI apps only';

  @override
  String get changelog5Text =>
      'When scanning, you now only see AI apps like ChatGPT or Gemini to choose from. The instructions for the AI are sent right along.';

  @override
  String get changelog4Title => '🧩 More forms';

  @override
  String get changelog4Text =>
      'New in forms: plural, comparison, case/preposition, declension/conjugation and part of speech. With “Everything”, the AI really takes everything the book lists for the word.';

  @override
  String get changelog3Title => '👋 With your name';

  @override
  String get changelog3Text =>
      'If you like, the app greets you by name – in the reminders too. You can change it in the settings.';

  @override
  String get changelog2Title => '💡 Quick tips';

  @override
  String get changelog2Text =>
      'The first time, a small window explains how creating a lesson, typing and scanning work. Tap “Don\'t show again” and it\'s gone.';

  @override
  String get changelog1Title => '📚 Lessons in any language';

  @override
  String get changelog1Text =>
      'Create your own lessons – English, French, Latin or whatever you\'re learning – and type in the words or scan them from your book.';

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
    return '$n d';
  }

  @override
  String intervalMonths(int n) {
    return '$n mo';
  }

  @override
  String intervalYears(String n) {
    return '$n y';
  }

  @override
  String get changelog7Title => '🌍 Now in 10 languages';

  @override
  String get changelog7Text =>
      'The app now speaks German, English, Spanish, French, Italian, Portuguese, Polish, Turkish, Russian and Chinese. You can switch the language in the settings.';

  @override
  String get appTitle => 'Vocab Trainer';
}
