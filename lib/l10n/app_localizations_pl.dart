// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get commonCancel => 'Anuluj';

  @override
  String get commonSave => 'Zapisz';

  @override
  String get commonDelete => 'Usuń';

  @override
  String get commonEdit => 'Edytuj';

  @override
  String get commonNext => 'Dalej';

  @override
  String get commonBack => 'Wstecz';

  @override
  String get commonDone => 'Gotowe';

  @override
  String get commonOk => 'OK';

  @override
  String get commonClose => 'Zamknij';

  @override
  String get commonLetsGo => 'Zaczynamy';

  @override
  String get commonSkip => 'Pomiń';

  @override
  String get commonUndo => 'Cofnij';

  @override
  String get commonOptions => 'Opcje';

  @override
  String get commonSettings => 'Ustawienia';

  @override
  String get commonHome => 'Do strony głównej';

  @override
  String get languagePickerTitle => 'Język aplikacji';

  @override
  String get languagePickerHint => 'Możesz go później zmienić w ustawieniach.';

  @override
  String get settingsLanguage => 'Język';

  @override
  String get languageGerman => 'Niemiecki';

  @override
  String get languageEnglish => 'Angielski';

  @override
  String get languageSpanish => 'Hiszpański';

  @override
  String get languageFrench => 'Francuski';

  @override
  String get languageItalian => 'Włoski';

  @override
  String get languagePortuguese => 'Portugalski';

  @override
  String get languagePolish => 'Polski';

  @override
  String get languageTurkish => 'Turecki';

  @override
  String get languageRussian => 'Rosyjski';

  @override
  String get languageChinese => 'Chiński';

  @override
  String get languageLatin => 'Łacina';

  @override
  String vocabCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count słówka',
      many: '$count słówek',
      few: '$count słówka',
      one: '1 słówko',
    );
    return '$_temp0';
  }

  @override
  String get lessonScreenManualHintTitle => 'Wpisywanie słówek';

  @override
  String get lessonScreenManualHintText =>
      'Dostaniesz pole na każdą informację z tej lekcji. Wypełnić trzeba tylko słowo i tłumaczenie. Później możesz dotknąć dowolnego słówka, żeby je zmienić.';

  @override
  String lessonScreenVocabAdded(String word) {
    return 'Dodano „$word”.';
  }

  @override
  String lessonScreenVocabDeleted(String word) {
    return 'Usunięto „$word”.';
  }

  @override
  String get lessonScreenScanHintTitle => 'Jak działa skanowanie';

  @override
  String lessonScreenScanHintText(String columns) {
    return '1. Zrób zdjęcie listy słówek – prosto i czytelnie.\n2. Wybierz aplikację AI. Otworzy się ze zdjęciem i instrukcją.\n3. Wyślij wiadomość.\n4. Skopiuj odpowiedź i wróć – słówka zostaną rozpoznane automatycznie.\n\nOdczytywane będzie: $columns';
  }

  @override
  String get lessonScreenFreeAiHintTitle => 'Najlepiej darmowa AI';

  @override
  String get lessonScreenFreeAiHintText =>
      'ChatGPT, Gemini i inne niezawodnie odczytują słówka także w darmowej wersji – nie potrzebujesz subskrypcji. Instrukcja dla AI zostanie wstawiona automatycznie.';

  @override
  String lessonScreenAiOpenFailed(String app) {
    return 'Nie udało się otworzyć $app.';
  }

  @override
  String get lessonScreenNothingInClipboard =>
      'W schowku nie ma słówek. Skopiuj w aplikacji AI całą odpowiedź i spróbuj jeszcze raz.';

  @override
  String lessonScreenImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dodano $count słówka. Dotknij któregoś, żeby je poprawić.',
      many: 'Dodano $count słówek. Dotknij któregoś, żeby je poprawić.',
      few: 'Dodano $count słówka. Dotknij któregoś, żeby je poprawić.',
      one: 'Dodano 1 słówko. Dotknij go, żeby je poprawić.',
    );
    return '$_temp0';
  }

  @override
  String lessonScreenDeleteLessonTitle(String name) {
    return 'Usunąć „$name”?';
  }

  @override
  String get lessonScreenDeleteLessonText =>
      'Lekcja i wszystkie jej słówka zostaną usunięte – także z twoich list do ćwiczeń.';

  @override
  String get lessonScreenMenuSettings => 'Ustawienia lekcji';

  @override
  String get lessonScreenMenuDelete => 'Usuń lekcję';

  @override
  String get lessonScreenEmpty => 'W tej lekcji nie ma jeszcze słówek.';

  @override
  String get lessonScreenWaitingForAi => 'Czekam na odpowiedź AI …';

  @override
  String get lessonScreenWaitingHelp =>
      'Skopiuj odpowiedź w aplikacji AI (przycisk kopiowania przy bloku tekstu) i wróć – słówka zostaną wtedy rozpoznane automatycznie.';

  @override
  String get lessonScreenPasteAnswer => 'Wklej odpowiedź';

  @override
  String get lessonScreenAddTitle => 'Dodaj słówka';

  @override
  String get lessonScreenAddManually => 'Wpisz sam';

  @override
  String get lessonScreenScan => 'Skanuj';

  @override
  String get lessonScreenScanTip =>
      'Wskazówka: przyciskiem „Skanuj” robisz zdjęcie listy słówek ze swojej książki. Aplikacja AI, np. ChatGPT albo Gemini, odczyta ją za ciebie – bez przepisywania.';

  @override
  String get lessonScreenTakePhoto => 'Zrób zdjęcie';

  @override
  String get lessonScreenPhotoFromGallery => 'Zdjęcie z galerii';

  @override
  String get lessonScreenWhichAi => 'Która AI?';

  @override
  String get lessonScreenNoAiInstalled =>
      'Na twoim telefonie nie ma jeszcze aplikacji AI. Zainstaluj jakąś – za darmo – a potem jeszcze raz dotknij „Skanuj”.';

  @override
  String lessonScreenInstallApp(String app) {
    return 'Zainstaluj $app';
  }

  @override
  String get lessonScreenFreeInPlayStore => 'za darmo w Sklepie Play';

  @override
  String get lessonScreenAiDisclaimer =>
      'Vokabeltrainer nie jest powiązany z tymi aplikacjami ani ich dostawcami. Obowiązują w nich ich własne polityki prywatności.';

  @override
  String lessonScreenRecognized(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Rozpoznano $count słówka',
      many: 'Rozpoznano $count słówek',
      few: 'Rozpoznano $count słówka',
      one: 'Rozpoznano 1 słówko',
    );
    return '$_temp0';
  }

  @override
  String lessonScreenDuplicatesSkipped(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count słówka było już w lekcji i zostanie pominiętych.',
      many: '$count słówek było już w lekcji i zostanie pominiętych.',
      few: '$count słówka były już w lekcji i zostaną pominięte.',
      one: '1 słówko było już w lekcji i zostanie pominięte.',
    );
    return '$_temp0';
  }

  @override
  String lessonScreenImportButton(int count) {
    return 'Dodaj ($count)';
  }

  @override
  String get lessonSetupTitleNew => 'Nowa lekcja';

  @override
  String get lessonSetupTitleEdit => 'Ustawienia lekcji';

  @override
  String get lessonSetupNameLabel => 'Nazwa lekcji';

  @override
  String get lessonSetupNameHint => 'np. Unit 3 albo Lekcja 5';

  @override
  String get lessonSetupLanguageLabel => 'Język słówek';

  @override
  String get lessonSetupTranslationLabel => 'Tłumaczenie na';

  @override
  String get lessonSetupFieldsTitle => 'Co wpisujesz?';

  @override
  String get lessonSetupFieldsHelp =>
      'Od tego zależy wpisywanie, skanowanie z AI i test.';

  @override
  String get lessonSetupWord => 'Słowo';

  @override
  String get lessonSetupTranslation => 'Tłumaczenie';

  @override
  String get lessonSetupAlwaysIncluded => 'zawsze';

  @override
  String get lessonSetupForms => 'Formy';

  @override
  String get lessonSetupFormsSubtitle =>
      'np. formy podstawowe, dopełniacz, rodzaj';

  @override
  String get lessonSetupWhichForms => 'Jakie formy?';

  @override
  String get lessonSetupAllForms => 'Wszystko';

  @override
  String get lessonSetupAllFormsHelp =>
      'Wszystko, co w książce stoi przy słowie: formy podstawowe, liczba mnoga, rodzaj, stopniowanie, przypadek i więcej.';

  @override
  String get lessonSetupPickOneKind => 'Wybierz co najmniej jeden rodzaj.';

  @override
  String get lessonSetupExtrasTitle => 'Inne (maks. 3)';

  @override
  String get lessonSetupExtrasHelp =>
      'Własne pola, np. przykładowe zdanie albo skojarzenie.';

  @override
  String lessonSetupExtraFieldLabel(int number) {
    return 'Inne $number – nazwa';
  }

  @override
  String lessonSetupExtraDefaultName(int number) {
    return 'Inne $number';
  }

  @override
  String get lessonSetupRemove => 'Usuń';

  @override
  String get lessonSetupExtraChip => 'Inne';

  @override
  String get lessonSetupSuggestionExample => 'Przykładowe zdanie';

  @override
  String get lessonSetupSuggestionMnemonic => 'Skojarzenie';

  @override
  String get lessonSetupSuggestionPronunciation => 'Wymowa';

  @override
  String get lessonSetupSuggestionOpposite => 'Przeciwieństwo';

  @override
  String get lessonsTabNewLessonHintTitle => 'Nowa lekcja';

  @override
  String get lessonsTabNewLessonHintText =>
      'Nadaj lekcji nazwę i wybierz język. Potem ustalasz, czego chcesz się uczyć: słowo i tłumaczenie są zawsze, a do tego, jeśli chcesz, formy i maksymalnie trzy własne pola, np. przykładowe zdanie albo skojarzenie.';

  @override
  String get lessonsTabEmptyTitle => 'Nie masz jeszcze lekcji';

  @override
  String get lessonsTabEmptyText =>
      'Utwórz swoją pierwszą lekcję. Słówka wpisujesz sam – albo robisz zdjęcie strony z książki, a aplikacja AI, np. ChatGPT albo Gemini, je odczyta.';

  @override
  String get lessonsTabNewLesson => 'Nowa lekcja';

  @override
  String lessonsTabCardStats(int count, int known) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count słówka',
      many: '$count słówek',
      few: '$count słówka',
      one: '1 słówko',
    );
    return '$_temp0 · opanowane: $known';
  }

  @override
  String get vocabFormDialogTitleNew => 'Nowe słówko';

  @override
  String get vocabFormDialogTitleEdit => 'Edytuj słówko';

  @override
  String get vocabFormDialogWord => 'Słowo';

  @override
  String vocabFormDialogWordWithLanguage(String language) {
    return 'Słowo ($language)';
  }

  @override
  String vocabFormDialogTranslation(String language) {
    return 'Tłumaczenie ($language)';
  }

  @override
  String get vocabFormDialogForms => 'Formy';

  @override
  String get vocabFormDialogAllForms => 'wszystkie formy';

  @override
  String get introWelcomeTitle => 'Witaj w Vokabeltrainer';

  @override
  String get introWelcomeText =>
      'Ucz się słówek w każdym języku – z fiszkami, testami i sprytnymi powtórkami. Każde słówko wraca dokładnie wtedy, tuż zanim byś je zapomniał.';

  @override
  String get introScanTitle => 'Wpisz albo zeskanuj';

  @override
  String get introScanText =>
      'Twórz lekcje i wpisuj słówka. Albo zrób zdjęcie listy ze swojej książki: aplikacja AI, np. ChatGPT albo Gemini, odczyta ją za ciebie.';

  @override
  String get introTestTitle => 'Gotowy na sprawdzian';

  @override
  String get introTestText =>
      'Podaj datę swojego sprawdzianu ze słówek. Aplikacja rozłoży słówka na dni przed nim i będzie ci przypominać o nauce – nigdy po 21:00.';

  @override
  String get introPrivacyTitle => 'Wszystko zostaje na twoim telefonie';

  @override
  String get introPrivacyText =>
      'Bez konta, bez chmury: twoje lekcje i postępy nie są nigdzie zapisywane w internecie. Tylko gdy skanujesz, zdjęcie trafia do aplikacji AI, którą sam wybierzesz.';

  @override
  String get introFreeTitle => 'Całkowicie za darmo';

  @override
  String get introFreeText =>
      'Nic nie zarabiam na tej aplikacji: bez reklam, bez zakupów w aplikacji, bez subskrypcji. Jest po prostu do nauki.';

  @override
  String get privacyScreenTitle => 'Prywatność';

  @override
  String get nameDialogWelcome => 'Witaj!';

  @override
  String get nameDialogTitle => 'Twoje imię';

  @override
  String get nameDialogIntro =>
      'Jak masz na imię? Wtedy aplikacja będzie się z tobą witać po imieniu – także w przypomnieniach. To nieobowiązkowe.';

  @override
  String get nameDialogLabel => 'Twoje imię (opcjonalnie)';

  @override
  String get nameDialogLocalOnly =>
      'Twoje imię jest zapisywane tylko na tym telefonie.';

  @override
  String get hintDialogDontShowAgain => 'Nie pokazuj więcej';

  @override
  String get formKindVerbLabel => 'Formy czasownika';

  @override
  String get formKindNounLabel => 'Formy rzeczownika';

  @override
  String get formKindPluralLabel => 'Liczba mnoga';

  @override
  String get formKindAdjectiveLabel => 'Formy przymiotnika';

  @override
  String get formKindComparisonLabel => 'Stopniowanie';

  @override
  String get formKindGenderLabel => 'Rodzaj';

  @override
  String get formKindInflectionClassLabel => 'Deklinacja/koniugacja';

  @override
  String get formKindGovernmentLabel => 'Przypadek/przyimek';

  @override
  String get formKindWordClassLabel => 'Część mowy';

  @override
  String get formKindVerbExample =>
      'formy podstawowe lub nieregularne, np. vocō, vocāvī, vocātum albo go, went, gone';

  @override
  String get formKindNounExample => 'np. dopełniacz: lūnae';

  @override
  String get formKindPluralExample => 'np. mice, les chevaux';

  @override
  String get formKindAdjectiveExample =>
      'formy pozostałych rodzajów, np. bonus, -a, -um';

  @override
  String get formKindComparisonExample => 'np. good, better, best';

  @override
  String get formKindGenderExample =>
      'przy rzeczownikach, np. m, f, n albo der/die/das';

  @override
  String get formKindInflectionClassExample => 'np. deklinacja a, koniugacja e';

  @override
  String get formKindGovernmentExample =>
      'jaki przypadek lub przyimek następuje, np. + Dat., sich freuen über';

  @override
  String get formKindWordClassExample =>
      'np. czasownik, rzeczownik, przymiotnik, przysłówek';

  @override
  String get vocabModelDefaultBoxName => 'Słówka';

  @override
  String get aiScanColumnWord => 'Słowo';

  @override
  String get aiScanColumnTranslation => 'Tłumaczenie';

  @override
  String get aiScanColumnForms => 'Formy';

  @override
  String get aiScanForeignLanguage => 'obcy';

  @override
  String aiScanPromptIntro(String language, String translationLanguage) {
    return 'Odczytaj wszystkie słówka ze zdjęcia (słowa w języku: $language, tłumaczenie w języku: $translationLanguage).';
  }

  @override
  String get aiScanPromptAnswerOnly =>
      'Odpowiedz WYŁĄCZNIE jednym blokiem kodu dokładnie w tym formacie, bez żadnego innego tekstu:';

  @override
  String get aiScanPromptRules => 'Zasady:';

  @override
  String aiScanPromptRuleColumns(int count, String columns) {
    return 'Jedna linia na słówko, kolumny oddzielone \" | \", zawsze dokładnie $count kolumny w tej kolejności: $columns.';
  }

  @override
  String aiScanPromptRuleNoHeader(String marker) {
    return 'Pomiń linię z nazwami kolumn, pierwsza linia to zawsze $marker.';
  }

  @override
  String aiScanPromptRuleWord(String column) {
    return '$column: zapisane tak jak na zdjęciu, ze wszystkimi znakami specjalnymi i akcentami.';
  }

  @override
  String aiScanPromptRuleTranslation(String column) {
    return '$column: tak jak na zdjęciu; kilka znaczeń oddziel przecinkami.';
  }

  @override
  String aiScanPromptRuleAllForms(String column) {
    return '$column: WSZYSTKIE informacje gramatyczne, które są na zdjęciu przy słowie – niczego nie pomijaj. Na przykład (ale nie tylko):';
  }

  @override
  String get aiScanPromptRuleAllFormsMore =>
      'Tutaj należy też wszystko inne, co dotyczy słowa (skróty, uwagi w nawiasach). Kilka informacji oddziel przecinkami.';

  @override
  String get aiScanPromptRuleAllFormsNone =>
      'Jeśli na zdjęciu nie ma żadnej informacji przy słowie, wpisz \"-\".';

  @override
  String aiScanPromptRuleSomeForms(String column) {
    return '$column: tylko te informacje, kilka oddzielonych przecinkami:';
  }

  @override
  String aiScanPromptRuleOmit(String kinds) {
    return 'Pomiń: $kinds.';
  }

  @override
  String get aiScanPromptRuleSomeFormsNone =>
      'Jeśli słowo nie ma takich informacji (np. przysłówek), wpisz tam \"-\".';

  @override
  String aiScanPromptRuleExtra(String label) {
    return '$label: ze zdjęcia; jeśli nic tam nie ma, wpisz \"-\".';
  }

  @override
  String get aiScanPromptRuleMissing =>
      'Jeśli brakuje jakiejś informacji, wpisz \"-\". Nie wymyślaj niczego, czego nie ma na zdjęciu.';

  @override
  String get aiScanPromptRuleNoPipe => 'Nie używaj \"|\" wewnątrz kolumny.';

  @override
  String get settingsThemeDark => 'Tryb ciemny';

  @override
  String get settingsThemeLight => 'Tryb jasny';

  @override
  String get settingsThemeSystem => 'Systemowy (automatycznie)';

  @override
  String get settingsThemeDarkDesc =>
      'Ciemne tło z jaskrawymi neonowymi kolorami.';

  @override
  String get settingsThemeLightDesc =>
      'Jasny, minimalistyczny wygląd w odcieniach bieli i jasnej szarości.';

  @override
  String get settingsThemeSystemDesc =>
      'Dopasowuje się do ustawień twojego urządzenia.';

  @override
  String get settingsAccentViolet => 'Neonowy fiolet';

  @override
  String get settingsAccentCyan => 'Neonowy cyjan';

  @override
  String get settingsAccentEmerald => 'Neonowy szmaragd';

  @override
  String get settingsAccentOrange => 'Neonowy pomarańcz';

  @override
  String get settingsAccentPink => 'Neonowy róż';

  @override
  String get settingsDirectionForward => 'Słowo → tłumaczenie';

  @override
  String get settingsDirectionBackward => 'Tłumaczenie → słowo';

  @override
  String get settingsDirectionForwardDesc =>
      'Aplikacja pokazuje słowo, ty podajesz znaczenie.';

  @override
  String get settingsDirectionBackwardDesc =>
      'Aplikacja pokazuje tłumaczenie, ty podajesz słowo.';

  @override
  String get settingsAnswerTranslationOnly => 'Tylko tłumaczenie';

  @override
  String get settingsAnswerWordOnly => 'Tylko słowo';

  @override
  String get settingsAnswerFormsOnly => 'Tylko formy';

  @override
  String get settingsAnswerBoth => 'Oba';

  @override
  String get settingsAnswerTranslationOnlyDesc => 'Podajesz tylko tłumaczenie.';

  @override
  String get settingsAnswerWordOnlyDesc => 'Podajesz tylko słowo.';

  @override
  String get settingsAnswerFormsOnlyDesc => 'Podajesz tylko formy.';

  @override
  String get settingsAnswerBothTranslationDesc =>
      'Podajesz tłumaczenie i formy.';

  @override
  String get settingsAnswerBothWordDesc => 'Podajesz słowo i formy.';

  @override
  String get settingsNameTitle => 'Twoje imię';

  @override
  String get settingsNameEmpty =>
      'Nie podano – zapisywane tylko na tym telefonie';

  @override
  String settingsNameSaved(String name) {
    return '$name · zapisane tylko na tym telefonie';
  }

  @override
  String get settingsDesignTitle => 'Wygląd';

  @override
  String get settingsAccentTitle => 'Kolor akcentu (neon)';

  @override
  String get settingsAccentHint =>
      'Kolor akcentu dotyczy przycisków, przełączników i wyróżnień. W trybie ciemnym kolory świecą, a w trybie jasnym są automatycznie nieco przyciemniane, żeby wszystko było czytelne.';

  @override
  String get settingsDirectionTitle => 'Kierunek nauki';

  @override
  String get settingsAnswerModeTitle => 'Co odpytywać w teście';

  @override
  String get settingsAskExtrasTitle => 'Odpytuj też „Inne”';

  @override
  String get settingsAskExtrasSubtitle =>
      'np. przykładowe zdanie albo skojarzenie – jeśli słówko je ma.';

  @override
  String get settingsFormsHint =>
      'Formy to np. formy podstawowe, dopełniacz albo rodzaj. Jeśli słówko nie ma form, odpytywane jest automatycznie tylko tłumaczenie. To ustawienie dotyczy trybu testu.';

  @override
  String get settingsAboutTitle => 'O aplikacji';

  @override
  String get settingsShowIntro => 'Zobacz wprowadzenie';

  @override
  String get settingsPrivacyTitle => 'Prywatność';

  @override
  String get settingsPrivacySubtitle => 'Wszystko zostaje na twoim telefonie';

  @override
  String get settingsLicensesTitle => 'Licencje';

  @override
  String get settingsLicensesSubtitle => 'Użyte oprogramowanie';

  @override
  String get settingsLicensesLegalese =>
      'Za darmo, bez reklam i bez zakupów w aplikacji.';

  @override
  String get backupExported => 'Kopia zapasowa jest pobierana.';

  @override
  String get backupCopied =>
      'Kopia zapasowa skopiowana do schowka – wklej ją np. do notatki.';

  @override
  String get backupRestoreTitle => 'Przywrócić kopię zapasową?';

  @override
  String get backupRestoreMessage =>
      'Twoje obecne postępy w nauce i listy do ćwiczeń zostaną zastąpione kopią zapasową.';

  @override
  String get backupRestoreAction => 'Przywróć';

  @override
  String get backupRestored => 'Kopia zapasowa przywrócona. ✅';

  @override
  String get backupResetTitle => 'Zresetować postępy w nauce?';

  @override
  String get backupResetMessage =>
      'Wszystkie poziomy nauki i terminy powtórek zostaną usunięte. Lekcje i listy do ćwiczeń zostaną.';

  @override
  String get backupResetAction => 'Resetuj';

  @override
  String get backupResetDone => 'Postępy w nauce zresetowane.';

  @override
  String get backupPasteTitle => 'Wklej kopię zapasową';

  @override
  String get backupTitle => 'Dane i kopia zapasowa';

  @override
  String get backupHint =>
      'Twoje postępy są zapisywane tylko na tym urządzeniu. Co jakiś czas zrób kopię zapasową – dzięki niej możesz też przenieść się na inne urządzenie.';

  @override
  String get backupExportTitle => 'Eksportuj kopię zapasową';

  @override
  String get backupExportFile => 'Pobierz jako plik';

  @override
  String get backupExportClipboard => 'Skopiuj do schowka';

  @override
  String get backupImportTitle => 'Importuj kopię zapasową';

  @override
  String get backupImportFile => 'Wybierz plik kopii zapasowej';

  @override
  String get backupImportPaste => 'Wklej zapisany tekst';

  @override
  String get backupResetTile => 'Zresetuj postępy w nauce';

  @override
  String get storeBackupInvalid =>
      'To nie jest prawidłowy plik kopii zapasowej.';

  @override
  String get storeBackupCorrupt => 'Plik kopii zapasowej jest uszkodzony.';

  @override
  String get notifSectionBlocked =>
      'Powiadomienia są zablokowane. Zezwól na nie w ustawieniach Androida dla aplikacji Vokabeltrainer.';

  @override
  String get notifSectionTitle => 'Przypomnienia';

  @override
  String get notifSectionAndroidOnly =>
      '📱 Prawdziwe przypomnienia są w aplikacji na Androida: kilka razy dziennie, z aktualnymi liczbami i nigdy po 21:00.';

  @override
  String get notifSectionSwitchTitle => 'Przypomnienia o nauce';

  @override
  String get notifSectionSwitchSubtitle =>
      'Z aktualnymi liczbami – nigdy po 21:00. Gdy wszystko na dziś jest zrobione, masz spokój.';

  @override
  String get notifSectionHowOften => 'Ile razy dziennie?';

  @override
  String notifSectionTimes(String times) {
    return 'o $times';
  }

  @override
  String get notifSectionSendTest => 'Wyślij testowe powiadomienie';

  @override
  String get notifChannelName => 'Przypomnienia o nauce';

  @override
  String get notifChannelDescription =>
      'Przypomina ci o nauce słówek (nigdy po 21:00).';

  @override
  String get notifTestTitle => '👋 Cześć! Tak wyglądają twoje przypomnienia';

  @override
  String get notifTestBody =>
      'Odezwę się, gdy będą na ciebie czekać słówka – nigdy po 21:00.';

  @override
  String notifFirst1Title(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '🧠 Czeka na ciebie $n słówka',
      many: '🧠 Czeka na ciebie $n słówek',
      few: '🧠 Czekają na ciebie $n słówka',
      one: '🧠 Czeka na ciebie 1 słówko',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst1Body => 'Wystarczy kilka minut – zaczynamy!';

  @override
  String get notifFirst2Title => '⚔️ Słówka atakują!';

  @override
  String notifFirst2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n słówka czeka dziś na pokonanie.',
      many: '$n słówek czeka dziś na pokonanie.',
      few: '$n słówka czekają dziś na pokonanie.',
      one: '1 słówko czeka dziś na pokonanie.',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst3Title => '🕵️ Tajna misja na dziś';

  @override
  String notifFirst3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Rozszyfruj $n słowa. Gotowy?',
      many: 'Rozszyfruj $n słów. Gotowy?',
      few: 'Rozszyfruj $n słowa. Gotowy?',
      one: 'Rozszyfruj 1 słowo. Gotowy?',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst4Title => '📚 Słówka wołają!';

  @override
  String notifFirst4Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Dziś w planie jest $n słówka.',
      many: 'Dziś w planie jest $n słówek.',
      few: 'Dziś w planie są $n słówka.',
      one: 'Dziś w planie jest 1 słówko.',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst5Title => '🎯 Misja dnia';

  @override
  String notifFirst5Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Rozpracuj $n słówka – dasz radę?',
      many: 'Rozpracuj $n słówek – dasz radę wszystkim?',
      few: 'Rozpracuj $n słówka – dasz radę wszystkim?',
      one: 'Rozpracuj 1 słówko – dasz radę?',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst6Title => '🦉 Sowa jest głodna';

  @override
  String notifFirst6Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Nakarm ją $n słówka!',
      many: 'Nakarm ją $n słówkami!',
      few: 'Nakarm ją $n słówkami!',
      one: 'Nakarm ją 1 słówkiem!',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst7Title => '🎲 Mały zakład?';

  @override
  String notifFirst7Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Założę się, że te $n słówka ogarniesz w 5 minut.',
      many: 'Założę się, że tych $n słówek ogarniesz w 5 minut.',
      few: 'Założę się, że te $n słówka ogarniesz w 5 minut.',
      one: 'Założę się, że to jedno słówko ogarniesz w 5 minut.',
    );
    return '$_temp0';
  }

  @override
  String notifNamed1Title(String name) {
    return '👋 Hej, $name!';
  }

  @override
  String notifNamed1Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Dziś czeka na ciebie $n słówka.',
      many: 'Dziś czeka na ciebie $n słówek.',
      few: 'Dziś czekają na ciebie $n słówka.',
      one: 'Dziś czeka na ciebie 1 słówko.',
    );
    return '$_temp0';
  }

  @override
  String notifNamed2Title(String name) {
    return '🎯 $name, twoja misja na dziś';
  }

  @override
  String notifNamed2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Rozpracuj $n słówka – zaczynamy!',
      many: 'Rozpracuj $n słówek – zaczynamy!',
      few: 'Rozpracuj $n słówka – zaczynamy!',
      one: 'Rozpracuj 1 słówko – zaczynamy!',
    );
    return '$_temp0';
  }

  @override
  String notifNamed3Title(String name) {
    return '🧠 $name, chwila nauki?';
  }

  @override
  String notifNamed3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Dziś w planie jest $n słówka.',
      many: 'Dziś w planie jest $n słówek.',
      few: 'Dziś w planie są $n słówka.',
      one: 'Dziś w planie jest 1 słówko.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle1Title => '⏰ Psst… twoje słówka wciąż czekają';

  @override
  String notifMiddle1Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Na dziś zostało jeszcze $n słówka.',
      many: 'Na dziś zostało jeszcze $n słówek.',
      few: 'Na dziś zostały jeszcze $n słówka.',
      one: 'Na dziś zostało jeszcze 1 słówko.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle2Title => '🐢 Słówka się niecierpliwią';

  @override
  String notifMiddle2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Czeka jeszcze $n – to tylko kilka minut!',
      many: 'Czeka jeszcze $n – to tylko kilka minut!',
      few: 'Czekają jeszcze $n – to tylko kilka minut!',
      one: 'Czeka jeszcze 1 – to tylko kilka minut!',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle3Title => '💬 Twoje fiszki pytają, gdzie jesteś';

  @override
  String notifMiddle3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Zostało jeszcze $n słówka.',
      many: 'Zostało jeszcze $n słówek.',
      few: 'Zostały jeszcze $n słówka.',
      one: 'Zostało jeszcze 1 słówko.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle4Title => '🧩 Prawie zapomniane?';

  @override
  String notifMiddle4Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n słówka czeka dziś jeszcze na powtórkę.',
      many: '$n słówek czeka dziś jeszcze na powtórkę.',
      few: '$n słówka czekają dziś jeszcze na powtórkę.',
      one: '1 słówko czeka dziś jeszcze na powtórkę.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle5Title => '🚀 Szybki zastrzyk energii?';

  @override
  String notifMiddle5Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n fiszki i masz spokój.',
      many: '$n fiszek i masz spokój.',
      few: '$n fiszki i masz spokój.',
      one: '1 fiszka i masz spokój.',
    );
    return '$_temp0';
  }

  @override
  String get notifLast1Title => '🌙 Ostatnia szansa na dziś!';

  @override
  String notifLast1Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Jeszcze $n słówka – potem fajrant.',
      many: 'Jeszcze $n słówek – potem fajrant.',
      few: 'Jeszcze $n słówka – potem fajrant.',
      one: 'Jeszcze 1 słówko – potem fajrant.',
    );
    return '$_temp0';
  }

  @override
  String get notifLast2Title => '⌛ Dzień prawie się kończy';

  @override
  String notifLast2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n słówka i na dziś koniec.',
      many: '$n słówek i na dziś koniec.',
      few: '$n słówka i na dziś koniec.',
      one: '1 słówko i na dziś koniec.',
    );
    return '$_temp0';
  }

  @override
  String get notifLast3Title => '🛡️ Finisz na dziś';

  @override
  String notifLast3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Jeszcze $n słówka do fajrantu.',
      many: 'Jeszcze $n słówek do fajrantu.',
      few: 'Jeszcze $n słówka do fajrantu.',
      one: 'Jeszcze 1 słówko do fajrantu.',
    );
    return '$_temp0';
  }

  @override
  String notifStreakTitle(int streak) {
    return '🔥 Twoja seria jest zagrożona! Dni z rzędu: $streak';
  }

  @override
  String notifStreakTitleNamed(String name, int streak) {
    return '🔥 $name, twoja seria jest zagrożona! Dni z rzędu: $streak';
  }

  @override
  String notifStreakBody(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Jeszcze $n słówka – ucz się dziś, żeby jej nie przerwać.',
      many: 'Jeszcze $n słówek – ucz się dziś, żeby jej nie przerwać.',
      few: 'Jeszcze $n słówka – ucz się dziś, żeby jej nie przerwać.',
      one: 'Jeszcze 1 słówko – ucz się dziś, żeby jej nie przerwać.',
    );
    return '$_temp0';
  }

  @override
  String notifExamTomorrowTitle(String list) {
    return '🚨 Jutro „$list”!';
  }

  @override
  String notifExamTomorrowBodyLast(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Ostatnia szansa: powtórz jeszcze $n słówka!',
      many: 'Ostatnia szansa: powtórz jeszcze $n słówek!',
      few: 'Ostatnia szansa: powtórz jeszcze $n słówka!',
      one: 'Ostatnia szansa: powtórz jeszcze 1 słówko!',
    );
    return '$_temp0';
  }

  @override
  String notifExamTomorrowBody(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Dziś ostatni dzień nauki – czeka $n słówka.',
      many: 'Dziś ostatni dzień nauki – czeka $n słówek.',
      few: 'Dziś ostatni dzień nauki – czekają $n słówka.',
      one: 'Dziś ostatni dzień nauki – czeka 1 słówko.',
    );
    return '$_temp0';
  }

  @override
  String notifExamSoonTitle(int days, String list) {
    return '⚡ Jeszcze $days dni do „$list”';
  }

  @override
  String notifExamSoonBody(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Finisz! Dziś do nauki jest $n słówka.',
      many: 'Finisz! Dziś do nauki jest $n słówek.',
      few: 'Finisz! Dziś do nauki są $n słówka.',
      one: 'Finisz! Dziś do nauki jest 1 słówko.',
    );
    return '$_temp0';
  }

  @override
  String notifExamDayTitle(String list) {
    return '🍀 Dziś „$list”!';
  }

  @override
  String get notifExamDayBody =>
      'Ćwiczyłeś – teraz pokaż, co umiesz. Powodzenia! 💪';

  @override
  String get analyseEmptyTitle => 'Nie masz jeszcze list do ćwiczeń';

  @override
  String get analyseEmptyText =>
      'Utwórz listę do ćwiczeń, żeby zobaczyć tu swoje postępy.';

  @override
  String analyseSummary(int total, int good, int neutral, int weak) {
    String _temp0 = intl.Intl.pluralLogic(
      total,
      locale: localeName,
      other: '$total słówka',
      many: '$total słówek',
      few: '$total słówka',
      one: '1 słówko',
    );
    return '$_temp0 · dobrze: $good · neutralnie: $neutral · słabo: $weak';
  }

  @override
  String analyseGoalUntil(String date) {
    return 'Cel do $date';
  }

  @override
  String get analyseOverallGoal => 'Cel ogólny';

  @override
  String analyseKnown(int known, int total) {
    return 'Opanowane słówka: $known/$total';
  }

  @override
  String get analyseDailyGoal => 'Cel dzienny';

  @override
  String get analyseAllDone => 'wszystko zrobione';

  @override
  String analyseLearnedToday(int learned, int target) {
    return 'Dziś: $learned/$target';
  }

  @override
  String get analyseAllKnown => 'Wszystkie słówka opanowane! 🎉';

  @override
  String analyseRemaining(int days, int remaining) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dnia',
      many: '$days dni',
      few: '$days dni',
      one: '1 dzień',
    );
    String _temp1 = intl.Intl.pluralLogic(
      remaining,
      locale: localeName,
      other: '$remaining słówka',
      many: '$remaining słówek',
      few: '$remaining słówka',
      one: '1 słówko',
    );
    return 'Jeszcze $_temp0 · do nauki: $_temp1.';
  }

  @override
  String get vocabDetailNeverPracticed => 'Jeszcze nie ćwiczone';

  @override
  String vocabDetailMemoryDue(int percent, int reps) {
    return 'Pamięć: $percent% · do powtórki teraz · ćwiczone $reps×';
  }

  @override
  String vocabDetailMemoryNext(int percent, String interval, int reps) {
    return 'Pamięć: $percent% · znowu za $interval · ćwiczone $reps×';
  }

  @override
  String get vocabDetailNoHistory => 'Brak historii.';

  @override
  String get vocabDetailWorse => 'Gorzej';

  @override
  String get vocabDetailBetter => 'Lepiej';

  @override
  String get levelVeryGood => 'Bardzo dobrze';

  @override
  String get levelGood => 'Dobrze';

  @override
  String get levelQuiteGood => 'Całkiem dobrze';

  @override
  String get levelOkay => 'W porządku';

  @override
  String get levelSlightlyGood => 'Trochę dobrze';

  @override
  String get levelNeutral => 'Neutralnie';

  @override
  String get levelSlightlyWeak => 'Trochę słabo';

  @override
  String get levelWeak => 'Słabo';

  @override
  String get levelQuiteWeak => 'Dość słabo';

  @override
  String get levelBad => 'Źle';

  @override
  String get levelVeryBad => 'Bardzo źle';

  @override
  String get tutorialTitle => 'Jak działa aplikacja';

  @override
  String get tutorialPage1Title => 'Jak działa Vokabeltrainer';

  @override
  String get tutorialPage1Text =>
      'Ta aplikacja pomaga ci uczyć się słówek w każdym języku – z fiszkami, testami i sprytnymi powtórkami. Przesuń w lewo albo dotknij „Dalej”, żeby wszystko poznać.';

  @override
  String get tutorialPage2Title => 'Utwórz lekcję';

  @override
  String get tutorialPage2Text =>
      'W zakładce „Lekcje” tworzysz lekcję: nazwa, język i czego chcesz się uczyć – słowo i tłumaczenie, jeśli chcesz, także formy i maksymalnie trzy własne pola, np. przykładowe zdanie albo skojarzenie.';

  @override
  String get tutorialPage3Title => 'Skanuj słówka';

  @override
  String get tutorialPage3Text =>
      'Wpisz słówka sam – albo dotknij „Skanuj” i zrób zdjęcie listy ze swojej książki. Aplikacja AI, np. ChatGPT albo Gemini, ją odczyta. Skopiuj odpowiedź, wróć i gotowe.';

  @override
  String get tutorialPage4Title => 'Twórz listy do ćwiczeń';

  @override
  String get tutorialPage4Text =>
      'Na stronie głównej dotknij „Listy do ćwiczeń”, a potem „Nowa lista”. Nadaj liście nazwę, opcjonalnie podaj datę sprawdzianu ze słówek i wybierz słówka ze swoich lekcji.';

  @override
  String get tutorialPage5Title => 'Ucz się codziennie';

  @override
  String get tutorialPage5Text =>
      'Na stronie głównej w sekcji „Dziś” widzisz, co z twoich list jest teraz do zrobienia: najpierw zaległe powtórki, do tego maksymalnie 15 nowych słówek. Dotknij „Zaczynamy”, żeby ruszyć.';

  @override
  String get tutorialPage6Title => 'Fiszki';

  @override
  String get tutorialPage6Text =>
      'Dotknij fiszki, żeby ją odwrócić, i oceń się szczerze: „Jeszcze raz”, „Trudne”, „Dobrze” albo „Łatwe”. Pod każdym przyciskiem widać, kiedy fiszka wróci. Na komputerze: spacja, żeby odwrócić, 1–4, żeby ocenić.';

  @override
  String get tutorialPage7Title => 'Sprytne powtórki';

  @override
  String get tutorialPage7Text =>
      'Aplikacja odpytuje każde słówko dokładnie wtedy, tuż zanim byś je zapomniał (powtórki w odstępach z FSRS, jak w Anki). Dobrze znane słowa wracają rzadziej, trudne częściej. Ucz się codziennie po trochu – to utrzymuje twoją 🔥 serię przy życiu.';

  @override
  String get tutorialPage8Title => 'Sprawdzian pod kontrolą';

  @override
  String get tutorialPage8Text =>
      'Przy tworzeniu listy podaj datę sprawdzianu. Aplikacja rozłoży nowe słówka na dni tak, żebyś skończył dzień PRZED sprawdzianem – wtedy wszystko zostanie jeszcze raz powtórzone. Im bliżej sprawdzianu, tym częściej wracają słówka.';

  @override
  String get tutorialPage9Title => 'Przypomnienia';

  @override
  String get tutorialPage9Text =>
      'Aplikacja przypomina ci maksymalnie 3 razy dziennie – z aktualnymi liczbami i nigdy po 21:00. Gdy wszystko na dziś jest zrobione, masz spokój. Ustawisz to w Ustawienia → Przypomnienia.';

  @override
  String get tutorialPage10Title => 'Tryb testu';

  @override
  String get tutorialPage10Text =>
      'Tutaj sam wpisujesz tłumaczenie i/lub formy – jeśli chcesz, także własne pola (Ustawienia). Przy sprawdzaniu wielkość liter i rodzajniki (np. der/die/das, the) nie mają znaczenia.';

  @override
  String get tutorialPage11Title => 'Zobacz postępy';

  @override
  String get tutorialPage11Text =>
      'W zakładce „Analiza” widzisz każde słówko z jego poziomem nauki: 5 odcieni zieleni (dobrze), szary (neutralnie) i 5 odcieni czerwieni (słabo). Dotknij słówka, żeby zobaczyć wykres historii i ręcznie poprawić albo pogorszyć poziom przyciskami +/−.';

  @override
  String get tutorialPage12Title => 'Twoje dane';

  @override
  String get tutorialPage12Text =>
      'Wszystko jest zapisywane tylko na tym urządzeniu – bez konta, bez internetu. Co jakiś czas zrób w ustawieniach kopię zapasową. Dzięki niej możesz też przenieść się na inne urządzenie.';

  @override
  String get dashboardGreetingNight => 'Jeszcze nie śpisz? 🌙';

  @override
  String dashboardGreetingNightName(String name) {
    return 'Jeszcze nie śpisz, $name? 🌙';
  }

  @override
  String get dashboardGreetingMorning => 'Dzień dobry! ☀️';

  @override
  String dashboardGreetingMorningName(String name) {
    return 'Dzień dobry, $name! ☀️';
  }

  @override
  String get dashboardGreetingDay => 'Cześć! 👋';

  @override
  String dashboardGreetingDayName(String name) {
    return 'Cześć, $name! 👋';
  }

  @override
  String get dashboardGreetingEvening => 'Dobry wieczór! 🌆';

  @override
  String dashboardGreetingEveningName(String name) {
    return 'Dobry wieczór, $name! 🌆';
  }

  @override
  String dashboardStreakLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'dnia z rzędu',
      many: 'dni z rzędu',
      few: 'dni z rzędu',
      one: 'dzień z rzędu',
    );
    return '$_temp0';
  }

  @override
  String get dashboardPracticedToday => 'dziś przećwiczone';

  @override
  String dashboardKnownOf(int total) {
    return 'z $total opanowanych';
  }

  @override
  String get dashboardPracticeLists => 'Listy do ćwiczeń';

  @override
  String get dashboardPracticeListsEmpty => 'Zbierz słówka na sprawdzian';

  @override
  String dashboardListCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count listy',
      many: '$count list',
      few: '$count listy',
      one: '1 lista',
    );
    return '$_temp0';
  }

  @override
  String get dashboardHelpTitle => 'Pomoc i instrukcja';

  @override
  String get dashboardHelpSubtitle => 'Jak działa Vokabeltrainer';

  @override
  String get dashboardStreakNone => 'Zacznij dziś swoją serię!';

  @override
  String get dashboardStreakFirstDay => 'Dzień 1 twojej serii – tak trzymaj!';

  @override
  String dashboardStreakRun(int count) {
    return '🔥 $count dni nauki z rzędu!';
  }

  @override
  String get dashboardGetStarted => 'Do dzieła!';

  @override
  String get dashboardNoListsHint =>
      'Utwórz teraz listę do ćwiczeń: nadaj jej nazwę i wybierz słówka, których chcesz się uczyć.';

  @override
  String get dashboardNoLessonsHint =>
      'Najpierw utwórz lekcję. Słówka wpiszesz sam albo zeskanujesz je z książki aplikacją AI.';

  @override
  String get dashboardCreateList => 'Utwórz listę do ćwiczeń';

  @override
  String get dashboardCreateLesson => 'Utwórz lekcję';

  @override
  String get dashboardAllDone => 'Na dziś wszystko zrobione!';

  @override
  String get dashboardToday => 'Dziś';

  @override
  String dashboardDoneReviewed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Masz dziś za sobą $count pytania. Jutro ciąg dalszy!',
      many: 'Masz dziś za sobą $count pytań. Jutro ciąg dalszy!',
      few: 'Masz dziś za sobą $count pytania. Jutro ciąg dalszy!',
      one: 'Masz dziś za sobą 1 pytanie. Jutro ciąg dalszy!',
    );
    return '$_temp0';
  }

  @override
  String get dashboardNothingDue =>
      'Teraz nic nie czeka na powtórkę. Zajrzyj jutro!';

  @override
  String get dashboardDueLabel => 'do powtórki';

  @override
  String get dashboardNewLabel => 'nowe';

  @override
  String get dashboardFromLists => 'Z twoich list do ćwiczeń';

  @override
  String dashboardExamToday(String name) {
    return 'Dziś „$name”!';
  }

  @override
  String get dashboardExamTodayText =>
      'Ćwiczyłeś – teraz pokaż, co umiesz. Powodzenia!';

  @override
  String dashboardExamTomorrow(String name) {
    return 'Jutro „$name”!';
  }

  @override
  String get dashboardExamTomorrowText =>
      'Dziś ostatni dzień nauki – wszystko zostanie jeszcze raz powtórzone.';

  @override
  String dashboardExamInDays(String name, int days) {
    return '„$name” za $days dni';
  }

  @override
  String dashboardExamFinalSpurt(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Finisz! Zostało $count dnia nauki – każdy się liczy.',
      many: 'Finisz! Zostało $count dni nauki – każdy się liczy.',
      few: 'Finisz! Zostały $count dni nauki – każdy się liczy.',
      one: 'Finisz! Został 1 dzień nauki – każdy się liczy.',
    );
    return '$_temp0';
  }

  @override
  String dashboardExamDaysLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Zostało $count dnia nauki. Aplikacja rozkłada słówka tak, żebyś zdążył na czas.',
      many:
          'Zostało $count dni nauki. Aplikacja rozkłada słówka tak, żebyś zdążył na czas.',
      few:
          'Zostały $count dni nauki. Aplikacja rozkłada słówka tak, żebyś zdążył na czas.',
      one:
          'Został 1 dzień nauki. Aplikacja rozkłada słówka tak, żebyś zdążył na czas.',
    );
    return '$_temp0';
  }

  @override
  String get practiceListsNeedLesson =>
      'Najpierw utwórz w zakładce „Lekcje” lekcję ze słówkami.';

  @override
  String practiceListsLimit(int max) {
    return 'Osiągnięto limit list (maks. $max naraz).';
  }

  @override
  String get practiceListsCountdownPast => ' · po wszystkim ✅';

  @override
  String get practiceListsCountdownToday => ' · dziś! 🍀';

  @override
  String get practiceListsCountdownTomorrow => ' · jutro!';

  @override
  String practiceListsCountdownDays(int days) {
    return ' · jeszcze $days dni';
  }

  @override
  String get practiceListsDueDateTitle => 'Kiedy jest sprawdzian ze słówek?';

  @override
  String get practiceListsChangeDueDate => 'Zmień datę sprawdzianu';

  @override
  String get practiceListsDueDateHint =>
      'Opcjonalnie. Aplikacja rozkłada słówka tak, żebyś do dnia przed sprawdzianem umiał wszystko – w sam dzień sprawdzianu nie musisz już ćwiczyć.';

  @override
  String get practiceListsPickDate => 'Wybierz datę';

  @override
  String get practiceListsRemoveDate => 'Usuń';

  @override
  String practiceListsNotifyOnSnack(String name) {
    return 'Przypomnienia dla „$name” są włączone.';
  }

  @override
  String practiceListsNotifyOffSnack(String name) {
    return 'Koniec przypomnień dla „$name”.';
  }

  @override
  String practiceListsDeleteTitle(String name) {
    return 'Usunąć „$name”?';
  }

  @override
  String get practiceListsDeleteText => 'Lista do ćwiczeń zostanie usunięta.';

  @override
  String get practiceListsNoVocabs => 'Ta lista nie zawiera słówek.';

  @override
  String get practiceListsTitle => 'Twoje listy do ćwiczeń';

  @override
  String get practiceListsNew => 'Nowa lista';

  @override
  String get practiceListsEmptyTitle => 'Nie masz jeszcze list do ćwiczeń';

  @override
  String get practiceListsEmptyText =>
      'Utwórz swoją pierwszą listę przyciskiem na dole.';

  @override
  String practiceListsSubtitleTest(String vocabs, String date) {
    return '$vocabs · sprawdzian: $date';
  }

  @override
  String get practiceListsNotifyDisable => 'Wyłącz przypomnienia';

  @override
  String get practiceListsNotifyEnable => 'Włącz przypomnienia';

  @override
  String get practiceListsNameDialogTitle => 'Nowa lista do ćwiczeń';

  @override
  String get practiceListsNameLabel => 'Nazwa listy';

  @override
  String get practiceListsNameHint => 'np. Sprawdzian 1';

  @override
  String get practiceNothingDue =>
      'Na dziś nic więcej nie czeka – super! 😎 Wybierz „Wszystkie”, jeśli mimo to chcesz poćwiczyć.';

  @override
  String get practiceNoWeak => 'Nie ma słabych słówek. 😎';

  @override
  String get practiceTitle => 'Wybierz tryb';

  @override
  String practiceSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Wybrano $count słówka',
      many: 'Wybrano $count słówek',
      few: 'Wybrano $count słówka',
      one: 'Wybrano 1 słówko',
    );
    return '$_temp0';
  }

  @override
  String get practiceModeFlashcards => 'Fiszki';

  @override
  String get practiceModeTest => 'Test';

  @override
  String get practiceWhichVocabs => 'Które słówka?';

  @override
  String get practiceFilterSmart => 'Powtórki i nowe';

  @override
  String get practiceFilterAll => 'Wszystkie';

  @override
  String get practiceFilterWeak => 'Słabe';

  @override
  String practicePlanSummary(int due, int fresh) {
    return 'do powtórki: $due · nowe: $fresh';
  }

  @override
  String practicePlanSummaryLater(int due, int fresh, int later) {
    return 'do powtórki: $due · nowe: $fresh (kolejne później: $later)';
  }

  @override
  String get practiceFlashcardsHint =>
      'Pokazuje się słowo. Odkrywasz znaczenie i sam się oceniasz: Jeszcze raz, Trudne, Dobrze albo Łatwe.';

  @override
  String get practiceTestHint =>
      'Pokazuje się słowo. Sam wpisujesz tłumaczenie i formy.';

  @override
  String get practiceSmartHint =>
      '„Powtórki i nowe” korzysta z powtórek w odstępach (FSRS): każde słówko wraca dokładnie wtedy, tuż zanim byś je zapomniał. Jeśli lista ma datę sprawdzianu, nowe słówka są rozkładane na dni do dnia przed nim, a wcześniej wszystko jest jeszcze raz powtarzane.';

  @override
  String get practiceStart => 'Start';

  @override
  String get flashcardWord => 'Słowo';

  @override
  String get flashcardTranslation => 'Tłumaczenie';

  @override
  String flashcardTitle(int current, int total) {
    return 'Fiszka $current / $total';
  }

  @override
  String get flashcardTapToFlip => 'Dotknij, żeby odwrócić';

  @override
  String get flashcardFlip => 'Odwróć';

  @override
  String get flashcardRateAgain => 'Jeszcze raz';

  @override
  String get flashcardRateHard => 'Trudne';

  @override
  String get flashcardRateGood => 'Dobrze';

  @override
  String get flashcardRateEasy => 'Łatwe';

  @override
  String testTranslationLabel(String language) {
    return 'Tłumaczenie ($language)';
  }

  @override
  String get testWordLabel => 'Słowo';

  @override
  String testWordLabelWithLanguage(String language) {
    return 'Słowo ($language)';
  }

  @override
  String get testFormsLabel => 'Formy';

  @override
  String testTitle(int current, int total) {
    return 'Test $current / $total';
  }

  @override
  String get testTranslate => 'Przetłumacz:';

  @override
  String testCorrectAnswer(String answer) {
    return 'Poprawnie: $answer';
  }

  @override
  String get testWrong => 'Źle';

  @override
  String get testResultCorrect => 'Dobrze! 🎉';

  @override
  String get testResultWrong => 'Niestety źle.';

  @override
  String get testCheck => 'Sprawdź';

  @override
  String get selectionColumnWord => 'Słowo';

  @override
  String get selectionColumnForms => 'Formy';

  @override
  String get selectionColumnTranslation => 'Tłumaczenie';

  @override
  String get selectionTitle => 'Wybierz słówka';

  @override
  String get selectionMenuTooltip => 'Zaznaczenie';

  @override
  String get selectionSelectAll => 'Zaznacz wszystkie';

  @override
  String get selectionClear => 'Odznacz wszystkie';

  @override
  String selectionConfirm(String label, String vocabs) {
    return '$label ($vocabs)';
  }

  @override
  String get homeTabStart => 'Start';

  @override
  String get homeTabLessons => 'Lekcje';

  @override
  String get homeTabAnalysis => 'Analiza';

  @override
  String get sessionSummaryExcellent => 'Znakomicie!';

  @override
  String get sessionSummaryGreat => 'Super robota!';

  @override
  String get sessionSummaryGood => 'Dobrze poćwiczone!';

  @override
  String get sessionSummaryKeepGoing => 'Nie odpuszczaj!';

  @override
  String sessionSummaryScore(int correct, int total) {
    return 'Za pierwszym razem: $correct z $total.';
  }

  @override
  String get sessionSummaryScheduled =>
      'Aplikacja sama planuje, kiedy każde słówko wróci.';

  @override
  String get sessionSummaryRestart => 'Jeszcze raz';

  @override
  String get changelogTitle => 'Co nowego?';

  @override
  String get changelogGotIt => 'Jasne!';

  @override
  String get changelog6Title => '🔒 Prywatność w skrócie';

  @override
  String get changelog6Text =>
      'W Ustawienia → „O aplikacji” znajdziesz politykę prywatności i wprowadzenie do ponownego przeczytania: wszystko zostaje na twoim telefonie, a aplikacja jest bez reklam i bez zakupów.';

  @override
  String get changelog5Title => '🤖 Skanowanie tylko z aplikacjami AI';

  @override
  String get changelog5Text =>
      'Przy skanowaniu do wyboru są teraz tylko aplikacje AI, np. ChatGPT albo Gemini. Instrukcja dla AI jest od razu dołączana.';

  @override
  String get changelog4Title => '🧩 Więcej form';

  @override
  String get changelog4Text =>
      'Nowe w formach: liczba mnoga, stopniowanie, przypadek/przyimek, deklinacja/koniugacja i część mowy. Z opcją „Wszystko” AI przejmie naprawdę wszystko, co w książce stoi przy słowie.';

  @override
  String get changelog3Title => '👋 Z twoim imieniem';

  @override
  String get changelog3Text =>
      'Jeśli chcesz, aplikacja wita cię po imieniu – także w przypomnieniach. Zmienisz je w ustawieniach.';

  @override
  String get changelog2Title => '💡 Krótkie wskazówki';

  @override
  String get changelog2Text =>
      'Za pierwszym razem małe okienko wyjaśnia, jak działa tworzenie lekcji, wpisywanie i skanowanie. Po zaznaczeniu „Nie pokazuj więcej” znika.';

  @override
  String get changelog1Title => '📚 Lekcje w każdym języku';

  @override
  String get changelog1Text =>
      'Twórz własne lekcje – angielski, francuski, łacina albo czego tam się uczysz – i wpisuj słówka albo skanuj je z książki.';

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
    return '$n mies.';
  }

  @override
  String intervalYears(String n) {
    return '$n r.';
  }

  @override
  String get changelog7Title => '🌍 Teraz w 10 językach';

  @override
  String get changelog7Text =>
      'Aplikacja jest teraz po niemiecku, angielsku, hiszpańsku, francusku, włosku, portugalsku, polsku, turecku, rosyjsku i chińsku. Język zmienisz w ustawieniach.';
}
