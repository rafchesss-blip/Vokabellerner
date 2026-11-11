// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get commonCancel => 'Отмена';

  @override
  String get commonSave => 'Сохранить';

  @override
  String get commonDelete => 'Удалить';

  @override
  String get commonEdit => 'Изменить';

  @override
  String get commonNext => 'Далее';

  @override
  String get commonBack => 'Назад';

  @override
  String get commonDone => 'Готово';

  @override
  String get commonOk => 'OK';

  @override
  String get commonClose => 'Закрыть';

  @override
  String get commonLetsGo => 'Поехали';

  @override
  String get commonSkip => 'Пропустить';

  @override
  String get commonUndo => 'Отменить';

  @override
  String get commonOptions => 'Параметры';

  @override
  String get commonSettings => 'Настройки';

  @override
  String get commonHome => 'На главную';

  @override
  String get languagePickerTitle => 'Язык приложения';

  @override
  String get languagePickerHint => 'Его можно поменять позже в настройках.';

  @override
  String get settingsLanguage => 'Язык';

  @override
  String get languageGerman => 'Немецкий';

  @override
  String get languageEnglish => 'Английский';

  @override
  String get languageSpanish => 'Испанский';

  @override
  String get languageFrench => 'Французский';

  @override
  String get languageItalian => 'Итальянский';

  @override
  String get languagePortuguese => 'Португальский';

  @override
  String get languagePolish => 'Польский';

  @override
  String get languageTurkish => 'Турецкий';

  @override
  String get languageRussian => 'Русский';

  @override
  String get languageChinese => 'Китайский';

  @override
  String get languageLatin => 'Латинский';

  @override
  String vocabCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count слова',
      many: '$count слов',
      few: '$count слова',
      one: '$count слово',
    );
    return '$_temp0';
  }

  @override
  String get lessonScreenManualHintTitle => 'Ввести слова';

  @override
  String get lessonScreenManualHintText =>
      'Для каждого пункта этого урока будет своё поле. Заполнить нужно только слово и перевод. Потом можно нажать на любое слово, чтобы его изменить.';

  @override
  String lessonScreenVocabAdded(String word) {
    return '«$word» добавлено.';
  }

  @override
  String lessonScreenVocabDeleted(String word) {
    return '«$word» удалено.';
  }

  @override
  String get lessonScreenScanHintTitle => 'Как работает сканирование';

  @override
  String lessonScreenScanHintText(String columns) {
    return '1. Сфотографируй список слов – ровно и чётко.\n2. Выбери ИИ-приложение. Оно откроется с фото и инструкцией.\n3. Отправь сообщение.\n4. Скопируй ответ и возвращайся – слова распознаются автоматически.\n\nСчитывается: $columns';
  }

  @override
  String get lessonScreenFreeAiHintTitle => 'Лучше всего – бесплатный ИИ';

  @override
  String get lessonScreenFreeAiHintText =>
      'ChatGPT, Gemini и другие надёжно считывают слова и в бесплатной версии – подписка не нужна. Инструкция для ИИ вставляется автоматически.';

  @override
  String lessonScreenAiOpenFailed(String app) {
    return 'Не удалось открыть $app.';
  }

  @override
  String get lessonScreenNothingInClipboard =>
      'В буфере обмена нет слов. Скопируй в ИИ-приложении весь ответ и попробуй ещё раз.';

  @override
  String lessonScreenImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Добавлено $count слова. Нажми на слово, чтобы исправить.',
      many: 'Добавлено $count слов. Нажми на слово, чтобы исправить.',
      few: 'Добавлено $count слова. Нажми на слово, чтобы исправить.',
      one: 'Добавлено $count слово. Нажми на него, чтобы исправить.',
    );
    return '$_temp0';
  }

  @override
  String lessonScreenDeleteLessonTitle(String name) {
    return 'Удалить «$name»?';
  }

  @override
  String get lessonScreenDeleteLessonText =>
      'Урок и все его слова будут удалены – в том числе из твоих учебных списков.';

  @override
  String get lessonScreenMenuSettings => 'Настроить урок';

  @override
  String get lessonScreenMenuDelete => 'Удалить урок';

  @override
  String get lessonScreenEmpty => 'В этом уроке пока нет слов.';

  @override
  String get lessonScreenWaitingForAi => 'Ждём ответа ИИ …';

  @override
  String get lessonScreenWaitingHelp =>
      'Скопируй ответ в ИИ-приложении (кнопка копирования у блока текста) и возвращайся – слова распознаются автоматически.';

  @override
  String get lessonScreenPasteAnswer => 'Вставить ответ';

  @override
  String get lessonScreenAddTitle => 'Добавить слова';

  @override
  String get lessonScreenAddManually => 'Ввести вручную';

  @override
  String get lessonScreenScan => 'Сканировать';

  @override
  String get lessonScreenScanTip =>
      'Совет: с помощью «Сканировать» ты фотографируешь список слов из учебника. ИИ-приложение, например ChatGPT или Gemini, считает его за тебя – печатать ничего не нужно.';

  @override
  String get lessonScreenTakePhoto => 'Сделать фото';

  @override
  String get lessonScreenPhotoFromGallery => 'Фото из галереи';

  @override
  String get lessonScreenWhichAi => 'Какой ИИ?';

  @override
  String get lessonScreenNoAiInstalled =>
      'На твоём телефоне пока нет ИИ-приложения. Установи одно – бесплатно – и снова нажми «Сканировать».';

  @override
  String lessonScreenInstallApp(String app) {
    return 'Установить $app';
  }

  @override
  String get lessonScreenFreeInPlayStore => 'бесплатно в Play Store';

  @override
  String get lessonScreenAiDisclaimer =>
      'Vokabeltrainer не связан с этими приложениями и их разработчиками. Для них действует их собственная политика конфиденциальности.';

  @override
  String lessonScreenRecognized(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Распознано $count слова',
      many: 'Распознано $count слов',
      few: 'Распознано $count слова',
      one: 'Распознано $count слово',
    );
    return '$_temp0';
  }

  @override
  String lessonScreenDuplicatesSkipped(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count слова уже есть в уроке и будут пропущены.',
      many: '$count слов уже есть в уроке и будут пропущены.',
      few: '$count слова уже есть в уроке и будут пропущены.',
      one: '$count слово уже есть в уроке и будет пропущено.',
    );
    return '$_temp0';
  }

  @override
  String lessonScreenImportButton(int count) {
    return 'Добавить: $count';
  }

  @override
  String get lessonSetupTitleNew => 'Новый урок';

  @override
  String get lessonSetupTitleEdit => 'Настроить урок';

  @override
  String get lessonSetupNameLabel => 'Название урока';

  @override
  String get lessonSetupNameHint => 'например, Unit 3 или Урок 5';

  @override
  String get lessonSetupLanguageLabel => 'Язык слов';

  @override
  String get lessonSetupTranslationLabel => 'Язык перевода';

  @override
  String get lessonSetupFieldsTitle => 'Что вводим?';

  @override
  String get lessonSetupFieldsHelp =>
      'От этого зависят ввод, сканирование с ИИ и тест.';

  @override
  String get lessonSetupWord => 'Слово';

  @override
  String get lessonSetupTranslation => 'Перевод';

  @override
  String get lessonSetupAlwaysIncluded => 'всегда есть';

  @override
  String get lessonSetupForms => 'Формы';

  @override
  String get lessonSetupFormsSubtitle =>
      'например, основные формы, родительный падеж, род';

  @override
  String get lessonSetupWhichForms => 'Какие формы?';

  @override
  String get lessonSetupAllForms => 'Всё';

  @override
  String get lessonSetupAllFormsHelp =>
      'Всё, что написано в учебнике к слову: основные формы, множественное число, род, степени сравнения, падеж и многое другое.';

  @override
  String get lessonSetupPickOneKind => 'Выбери хотя бы один вид.';

  @override
  String get lessonSetupExtrasTitle => 'Другое (до 3)';

  @override
  String get lessonSetupExtrasHelp =>
      'Свои поля, например пример предложения или подсказка.';

  @override
  String lessonSetupExtraFieldLabel(int number) {
    return 'Другое $number – название';
  }

  @override
  String lessonSetupExtraDefaultName(int number) {
    return 'Другое $number';
  }

  @override
  String get lessonSetupRemove => 'Убрать';

  @override
  String get lessonSetupExtraChip => 'Другое';

  @override
  String get lessonSetupSuggestionExample => 'Пример';

  @override
  String get lessonSetupSuggestionMnemonic => 'Подсказка';

  @override
  String get lessonSetupSuggestionPronunciation => 'Произношение';

  @override
  String get lessonSetupSuggestionOpposite => 'Антоним';

  @override
  String get lessonsTabNewLessonHintTitle => 'Новый урок';

  @override
  String get lessonsTabNewLessonHintText =>
      'Дай уроку название и выбери язык. Потом реши, что хочешь учить: слово и перевод есть всегда, а по желанию ещё формы и до трёх своих полей, например пример или подсказка.';

  @override
  String get lessonsTabEmptyTitle => 'Пока нет уроков';

  @override
  String get lessonsTabEmptyText =>
      'Создай свой первый урок. Слова можно ввести самому – или сфотографировать страницу учебника, и ИИ-приложение, например ChatGPT или Gemini, считает их.';

  @override
  String get lessonsTabNewLesson => 'Новый урок';

  @override
  String lessonsTabCardStats(int count, int known) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count слова',
      many: '$count слов',
      few: '$count слова',
      one: '$count слово',
    );
    return '$_temp0 · знаешь $known';
  }

  @override
  String get vocabFormDialogTitleNew => 'Новое слово';

  @override
  String get vocabFormDialogTitleEdit => 'Изменить слово';

  @override
  String get vocabFormDialogWord => 'Слово';

  @override
  String vocabFormDialogWordWithLanguage(String language) {
    return 'Слово ($language)';
  }

  @override
  String vocabFormDialogTranslation(String language) {
    return 'Перевод ($language)';
  }

  @override
  String get vocabFormDialogForms => 'Формы';

  @override
  String get vocabFormDialogAllForms => 'все формы';

  @override
  String get introWelcomeTitle => 'Добро пожаловать в Vokabeltrainer';

  @override
  String get introWelcomeText =>
      'Учи слова на любом языке – с карточками, тестами и умным повторением. Каждое слово возвращается как раз перед тем, как ты бы его забыл.';

  @override
  String get introScanTitle => 'Ввести или отсканировать';

  @override
  String get introScanText =>
      'Создавай уроки и вводи слова. Или сфотографируй список из учебника: ИИ-приложение, например ChatGPT или Gemini, считает его за тебя.';

  @override
  String get introTestTitle => 'Готов к контрольной';

  @override
  String get introTestText =>
      'Укажи дату своей контрольной по словам. Приложение распределит слова на дни до неё и напомнит об учёбе – но никогда после 21:00.';

  @override
  String get introPrivacyTitle => 'Всё остаётся на твоём телефоне';

  @override
  String get introPrivacyText =>
      'Без аккаунта, без облака: твои уроки и прогресс нигде в интернете не хранятся. Только при сканировании фото уходит в ИИ-приложение, которое ты сам выбираешь.';

  @override
  String get introFreeTitle => 'Полностью бесплатно';

  @override
  String get introFreeText =>
      'Я ничего не зарабатываю на этом приложении: без рекламы, без покупок в приложении, без подписки. Оно просто для учёбы.';

  @override
  String get privacyScreenTitle => 'Конфиденциальность';

  @override
  String get nameDialogWelcome => 'Привет!';

  @override
  String get nameDialogTitle => 'Твоё имя';

  @override
  String get nameDialogIntro =>
      'Как тебя зовут? Тогда приложение будет приветствовать тебя по имени – и в напоминаниях тоже. Это по желанию.';

  @override
  String get nameDialogLabel => 'Твоё имя (необязательно)';

  @override
  String get nameDialogLocalOnly =>
      'Твоё имя хранится только на этом телефоне.';

  @override
  String get hintDialogDontShowAgain => 'Больше не показывать';

  @override
  String get formKindVerbLabel => 'Формы глагола';

  @override
  String get formKindNounLabel => 'Формы существительного';

  @override
  String get formKindPluralLabel => 'Множественное число';

  @override
  String get formKindAdjectiveLabel => 'Формы прилагательного';

  @override
  String get formKindComparisonLabel => 'Степени сравнения';

  @override
  String get formKindGenderLabel => 'Род';

  @override
  String get formKindInflectionClassLabel => 'Склонение/спряжение';

  @override
  String get formKindGovernmentLabel => 'Падеж/предлог';

  @override
  String get formKindWordClassLabel => 'Часть речи';

  @override
  String get formKindVerbExample =>
      'основные или неправильные формы, например vocō, vocāvī, vocātum или go, went, gone';

  @override
  String get formKindNounExample => 'например, родительный падеж: lūnae';

  @override
  String get formKindPluralExample => 'например, mice, les chevaux';

  @override
  String get formKindAdjectiveExample =>
      'формы других родов, например bonus, -a, -um';

  @override
  String get formKindComparisonExample => 'например, good, better, best';

  @override
  String get formKindGenderExample =>
      'у существительных, например m, f, n или der/die/das';

  @override
  String get formKindInflectionClassExample =>
      'например, a-склонение, e-спряжение';

  @override
  String get formKindGovernmentExample =>
      'какой падеж или предлог идёт после слова, например + Dat., sich freuen über';

  @override
  String get formKindWordClassExample =>
      'например, глагол, существительное, прилагательное, наречие';

  @override
  String get vocabModelDefaultBoxName => 'Слова';

  @override
  String get aiScanColumnWord => 'Слово';

  @override
  String get aiScanColumnTranslation => 'Перевод';

  @override
  String get aiScanColumnForms => 'Формы';

  @override
  String get aiScanForeignLanguage => 'иностранный';

  @override
  String aiScanPromptIntro(String language, String translationLanguage) {
    return 'Считай все слова с фото (язык слов: $language, язык перевода: $translationLanguage).';
  }

  @override
  String get aiScanPromptAnswerOnly =>
      'Ответь ТОЛЬКО одним блоком кода точно в этом формате, без другого текста:';

  @override
  String get aiScanPromptRules => 'Правила:';

  @override
  String aiScanPromptRuleColumns(int count, String columns) {
    return 'Одна строка на слово, столбцы разделены \" | \", число столбцов всегда ровно $count, в таком порядке: $columns.';
  }

  @override
  String aiScanPromptRuleNoHeader(String marker) {
    return 'Строку с названиями столбцов не пиши, первая строка всегда $marker.';
  }

  @override
  String aiScanPromptRuleWord(String column) {
    return '$column: так, как написано на фото, со всеми особыми символами и ударениями.';
  }

  @override
  String aiScanPromptRuleTranslation(String column) {
    return '$column: как на фото; несколько значений разделяй запятой.';
  }

  @override
  String aiScanPromptRuleAllForms(String column) {
    return '$column: ВСЕ грамматические сведения, которые указаны на фото к слову – ничего не пропускай. Например (но не только):';
  }

  @override
  String get aiScanPromptRuleAllFormsMore =>
      'Сюда же относится всё остальное, что связано со словом (сокращения, пометки в скобках). Несколько сведений разделяй запятой.';

  @override
  String get aiScanPromptRuleAllFormsNone =>
      'Если на фото к слову ничего не указано, то \"-\".';

  @override
  String aiScanPromptRuleSomeForms(String column) {
    return '$column: только эти сведения, несколько – через запятую:';
  }

  @override
  String aiScanPromptRuleOmit(String kinds) {
    return 'Не указывай: $kinds.';
  }

  @override
  String get aiScanPromptRuleSomeFormsNone =>
      'Если у слова нет таких сведений (например, у наречия), пиши \"-\".';

  @override
  String aiScanPromptRuleExtra(String label) {
    return '$label: с фото; если там ничего нет, то \"-\".';
  }

  @override
  String get aiScanPromptRuleMissing =>
      'Если каких-то сведений нет, пиши \"-\". Ничего не придумывай, чего нет на фото.';

  @override
  String get aiScanPromptRuleNoPipe => 'Не используй \"|\" внутри столбца.';

  @override
  String get settingsThemeDark => 'Тёмная тема';

  @override
  String get settingsThemeLight => 'Светлая тема';

  @override
  String get settingsThemeSystem => 'Системная (авто)';

  @override
  String get settingsThemeDarkDesc => 'Тёмный фон с яркими неоновыми цветами.';

  @override
  String get settingsThemeLightDesc =>
      'Светлый минималистичный дизайн в белых и светло-серых тонах.';

  @override
  String get settingsThemeSystemDesc => 'Как в настройках твоего устройства.';

  @override
  String get settingsAccentViolet => 'Неон-фиолетовый';

  @override
  String get settingsAccentCyan => 'Неон-голубой';

  @override
  String get settingsAccentEmerald => 'Неон-изумрудный';

  @override
  String get settingsAccentOrange => 'Неон-оранжевый';

  @override
  String get settingsAccentPink => 'Неон-розовый';

  @override
  String get settingsDirectionForward => 'Слово → перевод';

  @override
  String get settingsDirectionBackward => 'Перевод → слово';

  @override
  String get settingsDirectionForwardDesc =>
      'Приложение показывает слово, ты отвечаешь значение.';

  @override
  String get settingsDirectionBackwardDesc =>
      'Приложение показывает перевод, ты отвечаешь слово.';

  @override
  String get settingsAnswerTranslationOnly => 'Только перевод';

  @override
  String get settingsAnswerWordOnly => 'Только слово';

  @override
  String get settingsAnswerFormsOnly => 'Только формы';

  @override
  String get settingsAnswerBoth => 'Оба';

  @override
  String get settingsAnswerTranslationOnlyDesc =>
      'Ты отвечаешь только перевод.';

  @override
  String get settingsAnswerWordOnlyDesc => 'Ты отвечаешь только слово.';

  @override
  String get settingsAnswerFormsOnlyDesc => 'Ты отвечаешь только формы.';

  @override
  String get settingsAnswerBothTranslationDesc =>
      'Ты отвечаешь перевод и формы.';

  @override
  String get settingsAnswerBothWordDesc => 'Ты отвечаешь слово и формы.';

  @override
  String get settingsNameTitle => 'Твоё имя';

  @override
  String get settingsNameEmpty =>
      'Не указано – хранится только на этом телефоне';

  @override
  String settingsNameSaved(String name) {
    return '$name · хранится только на этом телефоне';
  }

  @override
  String get settingsDesignTitle => 'Оформление';

  @override
  String get settingsAccentTitle => 'Акцентный цвет (неон)';

  @override
  String get settingsAccentHint =>
      'Акцентный цвет используется для кнопок, переключателей и выделений. В тёмной теме цвета светятся, в светлой они автоматически становятся чуть темнее, чтобы всё легко читалось.';

  @override
  String get settingsDirectionTitle => 'Направление';

  @override
  String get settingsAnswerModeTitle => 'Что спрашивать в тесте';

  @override
  String get settingsAskExtrasTitle => 'Спрашивать и «Другое»';

  @override
  String get settingsAskExtrasSubtitle =>
      'например, пример или подсказку – если они есть у слова.';

  @override
  String get settingsFormsHint =>
      'Формы – это, например, основные формы, родительный падеж или род. Если у слова нет форм, автоматически спрашивается только перевод. Этот выбор действует в режиме теста.';

  @override
  String get settingsAboutTitle => 'О приложении';

  @override
  String get settingsShowIntro => 'Посмотреть введение';

  @override
  String get settingsPrivacyTitle => 'Конфиденциальность';

  @override
  String get settingsPrivacySubtitle => 'Всё остаётся на твоём телефоне';

  @override
  String get settingsLicensesTitle => 'Лицензии';

  @override
  String get settingsLicensesSubtitle => 'Используемое ПО';

  @override
  String get settingsLicensesLegalese =>
      'Бесплатно, без рекламы и без покупок в приложении.';

  @override
  String get backupExported => 'Резервная копия скачивается.';

  @override
  String get backupCopied =>
      'Резервная копия скопирована в буфер обмена – вставь её, например, в заметку.';

  @override
  String get backupRestoreTitle => 'Восстановить резервную копию?';

  @override
  String get backupRestoreMessage =>
      'Твой текущий прогресс и учебные списки будут заменены резервной копией.';

  @override
  String get backupRestoreAction => 'Восстановить';

  @override
  String get backupRestored => 'Резервная копия восстановлена. ✅';

  @override
  String get backupResetTitle => 'Сбросить прогресс?';

  @override
  String get backupResetMessage =>
      'Все уровни и даты повторений будут удалены. Уроки и учебные списки останутся.';

  @override
  String get backupResetAction => 'Сбросить';

  @override
  String get backupResetDone => 'Прогресс сброшен.';

  @override
  String get backupPasteTitle => 'Вставить резервную копию';

  @override
  String get backupTitle => 'Данные и резервная копия';

  @override
  String get backupHint =>
      'Твой прогресс хранится только на этом устройстве. Время от времени делай резервную копию – с ней можно и перейти на другое устройство.';

  @override
  String get backupExportTitle => 'Экспорт резервной копии';

  @override
  String get backupExportFile => 'Скачать как файл';

  @override
  String get backupExportClipboard => 'Скопировать в буфер обмена';

  @override
  String get backupImportTitle => 'Импорт резервной копии';

  @override
  String get backupImportFile => 'Выбрать файл копии';

  @override
  String get backupImportPaste => 'Вставить сохранённый текст';

  @override
  String get backupResetTile => 'Сбросить прогресс';

  @override
  String get storeBackupInvalid => 'Это не файл резервной копии.';

  @override
  String get storeBackupCorrupt => 'Файл резервной копии повреждён.';

  @override
  String get notifSectionBlocked =>
      'Уведомления заблокированы. Разреши их для Vokabeltrainer в настройках Android.';

  @override
  String get notifSectionTitle => 'Напоминания';

  @override
  String get notifSectionAndroidOnly =>
      '📱 Настоящие напоминания есть в Android-приложении: несколько раз в день, с актуальными цифрами и никогда после 21:00.';

  @override
  String get notifSectionSwitchTitle => 'Напоминания об учёбе';

  @override
  String get notifSectionSwitchSubtitle =>
      'С актуальными цифрами – никогда после 21:00. Если на сегодня всё выучено, тишина.';

  @override
  String get notifSectionHowOften => 'Сколько раз в день?';

  @override
  String notifSectionTimes(String times) {
    return 'в $times';
  }

  @override
  String get notifSectionSendTest => 'Отправить тестовое уведомление';

  @override
  String get notifChannelName => 'Напоминания об учёбе';

  @override
  String get notifChannelDescription =>
      'Напоминает учить слова (никогда после 21:00).';

  @override
  String get notifTestTitle => '👋 Привет! Так выглядят твои напоминания';

  @override
  String get notifTestBody =>
      'Я напишу, когда тебя будут ждать слова – никогда после 21:00.';

  @override
  String notifFirst1Title(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '🧠 Тебя ждут $n слова',
      many: '🧠 Тебя ждут $n слов',
      few: '🧠 Тебя ждут $n слова',
      one: '🧠 Тебя ждёт $n слово',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst1Body => 'Хватит пары минут – поехали!';

  @override
  String get notifFirst2Title => '⚔️ Слова атакуют!';

  @override
  String notifFirst2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Сегодня нужно победить $n слова.',
      many: 'Сегодня нужно победить $n слов.',
      few: 'Сегодня нужно победить $n слова.',
      one: 'Сегодня нужно победить $n слово.',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst3Title => '🕵️ Секретное задание на сегодня';

  @override
  String notifFirst3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Расшифруй $n слова. Готов?',
      many: 'Расшифруй $n слов. Готов?',
      few: 'Расшифруй $n слова. Готов?',
      one: 'Расшифруй $n слово. Готов?',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst4Title => '📚 Слова зовут!';

  @override
  String notifFirst4Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Сегодня в плане $n слова.',
      many: 'Сегодня в плане $n слов.',
      few: 'Сегодня в плане $n слова.',
      one: 'Сегодня в плане $n слово.',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst5Title => '🎯 Миссия дня';

  @override
  String notifFirst5Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Расколи $n слова – справишься со всеми?',
      many: 'Расколи $n слов – справишься со всеми?',
      few: 'Расколи $n слова – справишься со всеми?',
      one: 'Расколи $n слово – справишься?',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst6Title => '🦉 Учёная сова проголодалась';

  @override
  String notifFirst6Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Покорми её: $n слова!',
      many: 'Покорми её: $n слов!',
      few: 'Покорми её: $n слова!',
      one: 'Покорми её: $n слово!',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst7Title => '🎲 Спорим?';

  @override
  String notifFirst7Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Держу пари: ты осилишь $n слова за 5 минут.',
      many: 'Держу пари: ты осилишь $n слов за 5 минут.',
      few: 'Держу пари: ты осилишь $n слова за 5 минут.',
      one: 'Держу пари: ты осилишь $n слово за 5 минут.',
    );
    return '$_temp0';
  }

  @override
  String notifNamed1Title(String name) {
    return '👋 Привет, $name!';
  }

  @override
  String notifNamed1Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Сегодня тебя ждут $n слова.',
      many: 'Сегодня тебя ждут $n слов.',
      few: 'Сегодня тебя ждут $n слова.',
      one: 'Сегодня тебя ждёт $n слово.',
    );
    return '$_temp0';
  }

  @override
  String notifNamed2Title(String name) {
    return '🎯 $name, твоя миссия на сегодня';
  }

  @override
  String notifNamed2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Расколи $n слова – поехали!',
      many: 'Расколи $n слов – поехали!',
      few: 'Расколи $n слова – поехали!',
      one: 'Расколи $n слово – поехали!',
    );
    return '$_temp0';
  }

  @override
  String notifNamed3Title(String name) {
    return '🧠 $name, немного поучим?';
  }

  @override
  String notifNamed3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Сегодня в плане $n слова.',
      many: 'Сегодня в плане $n слов.',
      few: 'Сегодня в плане $n слова.',
      one: 'Сегодня в плане $n слово.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle1Title => '⏰ Псст… слова всё ещё ждут';

  @override
  String notifMiddle1Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Сегодня осталось $n слова.',
      many: 'Сегодня осталось $n слов.',
      few: 'Сегодня осталось $n слова.',
      one: 'Сегодня осталось $n слово.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle2Title => '🐢 Слова теряют терпение';

  @override
  String notifMiddle2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Ждут ещё $n – всего пара минут!',
      many: 'Ждут ещё $n – всего пара минут!',
      few: 'Ждут ещё $n – всего пара минут!',
      one: 'Ждёт ещё $n – всего пара минут!',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle3Title => '💬 Карточки спрашивают, где ты';

  @override
  String notifMiddle3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Осталось ещё $n слова.',
      many: 'Осталось ещё $n слов.',
      few: 'Осталось ещё $n слова.',
      one: 'Осталось ещё $n слово.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle4Title => '🧩 Почти забыл?';

  @override
  String notifMiddle4Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n слова ещё нужно повторить сегодня.',
      many: '$n слов ещё нужно повторить сегодня.',
      few: '$n слова ещё нужно повторить сегодня.',
      one: '$n слово ещё нужно повторить сегодня.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle5Title => '🚀 Небольшой рывок?';

  @override
  String notifMiddle5Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n карточки – и свободен.',
      many: '$n карточек – и свободен.',
      few: '$n карточки – и свободен.',
      one: '$n карточка – и свободен.',
    );
    return '$_temp0';
  }

  @override
  String get notifLast1Title => '🌙 Последний шанс на сегодня!';

  @override
  String notifLast1Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Ещё $n слова – и на сегодня всё.',
      many: 'Ещё $n слов – и на сегодня всё.',
      few: 'Ещё $n слова – и на сегодня всё.',
      one: 'Ещё $n слово – и на сегодня всё.',
    );
    return '$_temp0';
  }

  @override
  String get notifLast2Title => '⌛ День почти закончился';

  @override
  String notifLast2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n слова – и на сегодня ты всё.',
      many: '$n слов – и на сегодня ты всё.',
      few: '$n слова – и на сегодня ты всё.',
      one: '$n слово – и на сегодня ты всё.',
    );
    return '$_temp0';
  }

  @override
  String get notifLast3Title => '🛡️ Финишный рывок';

  @override
  String notifLast3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'До отдыха осталось $n слова.',
      many: 'До отдыха осталось $n слов.',
      few: 'До отдыха осталось $n слова.',
      one: 'До отдыха осталось $n слово.',
    );
    return '$_temp0';
  }

  @override
  String notifStreakTitle(int streak) {
    return '🔥 Твоя серия (дней подряд: $streak) под угрозой!';
  }

  @override
  String notifStreakTitleNamed(String name, int streak) {
    return '🔥 $name, твоя серия (дней подряд: $streak) под угрозой!';
  }

  @override
  String notifStreakBody(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Ещё $n слова – позанимайся сегодня, чтобы она не прервалась.',
      many: 'Ещё $n слов – позанимайся сегодня, чтобы она не прервалась.',
      few: 'Ещё $n слова – позанимайся сегодня, чтобы она не прервалась.',
      one: 'Ещё $n слово – позанимайся сегодня, чтобы она не прервалась.',
    );
    return '$_temp0';
  }

  @override
  String notifExamTomorrowTitle(String list) {
    return '🚨 Завтра «$list»!';
  }

  @override
  String notifExamTomorrowBodyLast(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Последний шанс: повтори ещё $n слова!',
      many: 'Последний шанс: повтори ещё $n слов!',
      few: 'Последний шанс: повтори ещё $n слова!',
      one: 'Последний шанс: повтори ещё $n слово!',
    );
    return '$_temp0';
  }

  @override
  String notifExamTomorrowBody(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Сегодня последний день учёбы – ждут $n слова.',
      many: 'Сегодня последний день учёбы – ждут $n слов.',
      few: 'Сегодня последний день учёбы – ждут $n слова.',
      one: 'Сегодня последний день учёбы – ждёт $n слово.',
    );
    return '$_temp0';
  }

  @override
  String notifExamSoonTitle(int days, String list) {
    return '⚡ До «$list» осталось $days дня';
  }

  @override
  String notifExamSoonBody(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Финишный рывок! Сегодня на очереди $n слова.',
      many: 'Финишный рывок! Сегодня на очереди $n слов.',
      few: 'Финишный рывок! Сегодня на очереди $n слова.',
      one: 'Финишный рывок! Сегодня на очереди $n слово.',
    );
    return '$_temp0';
  }

  @override
  String notifExamDayTitle(String list) {
    return '🍀 Сегодня «$list»!';
  }

  @override
  String get notifExamDayBody =>
      'Ты тренировался – теперь покажи, на что способен. Удачи! 💪';

  @override
  String get analyseEmptyTitle => 'Пока нет учебных списков';

  @override
  String get analyseEmptyText =>
      'Создай учебный список, чтобы видеть здесь свой прогресс.';

  @override
  String analyseSummary(int total, int good, int neutral, int weak) {
    String _temp0 = intl.Intl.pluralLogic(
      total,
      locale: localeName,
      other: '$total слова',
      many: '$total слов',
      few: '$total слова',
      one: '$total слово',
    );
    return '$_temp0 · $good хорошо · $neutral нейтр. · $weak слабо';
  }

  @override
  String analyseGoalUntil(String date) {
    return 'Цель до $date';
  }

  @override
  String get analyseOverallGoal => 'Общая цель';

  @override
  String analyseKnown(int known, int total) {
    return 'Знаешь слов: $known/$total';
  }

  @override
  String get analyseDailyGoal => 'Цель на день';

  @override
  String get analyseAllDone => 'всё сделано';

  @override
  String analyseLearnedToday(int learned, int target) {
    return 'Сегодня выучено: $learned/$target';
  }

  @override
  String get analyseAllKnown => 'Все слова выучены! 🎉';

  @override
  String analyseRemaining(int days, int remaining) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Осталось $days дня',
      many: 'Осталось $days дней',
      few: 'Осталось $days дня',
      one: 'Остался $days день',
    );
    String _temp1 = intl.Intl.pluralLogic(
      remaining,
      locale: localeName,
      other: '$remaining слова',
      many: '$remaining слов',
      few: '$remaining слова',
      one: '$remaining слово',
    );
    return '$_temp0 · ещё $_temp1.';
  }

  @override
  String get vocabDetailNeverPracticed => 'Ещё ни разу не повторялось';

  @override
  String vocabDetailMemoryDue(int percent, int reps) {
    return 'Память: $percent % · пора повторить · повторено $reps×';
  }

  @override
  String vocabDetailMemoryNext(int percent, String interval, int reps) {
    return 'Память: $percent % · снова через $interval · повторено $reps×';
  }

  @override
  String get vocabDetailNoHistory => 'Истории пока нет.';

  @override
  String get vocabDetailWorse => 'Хуже';

  @override
  String get vocabDetailBetter => 'Лучше';

  @override
  String get levelVeryGood => 'Отлично';

  @override
  String get levelGood => 'Хорошо';

  @override
  String get levelQuiteGood => 'Довольно хорошо';

  @override
  String get levelOkay => 'Неплохо';

  @override
  String get levelSlightlyGood => 'Чуть лучше';

  @override
  String get levelNeutral => 'Нейтрально';

  @override
  String get levelSlightlyWeak => 'Чуть слабо';

  @override
  String get levelWeak => 'Слабо';

  @override
  String get levelQuiteWeak => 'Довольно слабо';

  @override
  String get levelBad => 'Плохо';

  @override
  String get levelVeryBad => 'Очень плохо';

  @override
  String get tutorialTitle => 'Как работает приложение';

  @override
  String get tutorialPage1Title => 'Как работает Vokabeltrainer';

  @override
  String get tutorialPage1Text =>
      'Это приложение помогает учить слова на любом языке – с карточками, тестами и умным повторением. Смахни влево или нажми «Далее», чтобы со всем познакомиться.';

  @override
  String get tutorialPage2Title => 'Создать урок';

  @override
  String get tutorialPage2Text =>
      'Во вкладке «Уроки» ты создаёшь урок: название, язык и что хочешь учить – слово и перевод, по желанию формы и до трёх своих полей, например пример или подсказка.';

  @override
  String get tutorialPage3Title => 'Сканировать слова';

  @override
  String get tutorialPage3Text =>
      'Введи слова сам – или нажми «Сканировать» и сфотографируй список из учебника. ИИ-приложение, например ChatGPT или Gemini, считает его. Скопируй ответ, вернись – готово.';

  @override
  String get tutorialPage4Title => 'Создать учебные списки';

  @override
  String get tutorialPage4Text =>
      'На главной нажми «Учебные списки», а потом «Новый список». Дай списку название, по желанию укажи дату контрольной и выбери слова из своих уроков.';

  @override
  String get tutorialPage5Title => 'Учиться каждый день';

  @override
  String get tutorialPage5Text =>
      'На главной в разделе «Сегодня» видно, что из твоих списков сейчас на очереди: сначала повторения, плюс до 15 новых слов. Нажми «Поехали», чтобы начать.';

  @override
  String get tutorialPage6Title => 'Карточки';

  @override
  String get tutorialPage6Text =>
      'Нажми на карточку, чтобы перевернуть её, и честно оцени себя: «Снова», «Трудно», «Хорошо» или «Легко». Под каждой кнопкой видно, когда карточка вернётся. На компьютере: пробел – перевернуть, 1–4 – оценить.';

  @override
  String get tutorialPage7Title => 'Умное повторение';

  @override
  String get tutorialPage7Text =>
      'Приложение спрашивает каждое слово как раз перед тем, как ты бы его забыл (интервальное повторение с FSRS, как в Anki). Хорошо выученные слова появляются реже, трудные – чаще. Учись каждый день понемногу – так твоя 🔥 серия не прервётся.';

  @override
  String get tutorialPage8Title => 'Контрольная под контролем';

  @override
  String get tutorialPage8Text =>
      'При создании списка укажи дату контрольной. Приложение распределит новые слова по дням так, чтобы ты закончил за день ДО контрольной – тогда всё повторяется ещё раз. Чем ближе контрольная, тем чаще появляются слова.';

  @override
  String get tutorialPage9Title => 'Напоминания';

  @override
  String get tutorialPage9Text =>
      'Приложение напоминает до 3 раз в день – с актуальными цифрами и никогда после 21:00. Если на сегодня всё выучено, тишина. Настроить это можно в Настройки → Напоминания.';

  @override
  String get tutorialPage10Title => 'Режим теста';

  @override
  String get tutorialPage10Text =>
      'Здесь ты сам вводишь перевод и/или формы – по желанию и свои поля (в настройках). При проверке заглавные/строчные буквы и артикли (например, der/die/das) не важны.';

  @override
  String get tutorialPage11Title => 'Смотреть прогресс';

  @override
  String get tutorialPage11Text =>
      'Во вкладке «Анализ» видно каждое слово с его уровнем: 5 оттенков зелёного (хорошо), серый (нейтрально) и 5 оттенков красного (слабо). Нажми на слово, чтобы увидеть график и вручную улучшить или ухудшить его с помощью +/−.';

  @override
  String get tutorialPage12Title => 'Твои данные';

  @override
  String get tutorialPage12Text =>
      'Всё хранится только на этом устройстве – без аккаунта, без интернета. Время от времени делай резервную копию в настройках. С ней можно и перейти на другое устройство.';

  @override
  String get dashboardGreetingNight => 'Ещё не спишь? 🌙';

  @override
  String dashboardGreetingNightName(String name) {
    return 'Ещё не спишь, $name? 🌙';
  }

  @override
  String get dashboardGreetingMorning => 'Доброе утро! ☀️';

  @override
  String dashboardGreetingMorningName(String name) {
    return 'Доброе утро, $name! ☀️';
  }

  @override
  String get dashboardGreetingDay => 'Привет! 👋';

  @override
  String dashboardGreetingDayName(String name) {
    return 'Привет, $name! 👋';
  }

  @override
  String get dashboardGreetingEvening => 'Добрый вечер! 🌆';

  @override
  String dashboardGreetingEveningName(String name) {
    return 'Добрый вечер, $name! 🌆';
  }

  @override
  String dashboardStreakLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'дня подряд',
      many: 'дней подряд',
      few: 'дня подряд',
      one: 'день подряд',
    );
    return '$_temp0';
  }

  @override
  String get dashboardPracticedToday => 'сегодня повторено';

  @override
  String dashboardKnownOf(int total) {
    return 'знаешь из $total';
  }

  @override
  String get dashboardPracticeLists => 'Учебные списки';

  @override
  String get dashboardPracticeListsEmpty => 'Собери слова для контрольной';

  @override
  String dashboardListCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count списка',
      many: '$count списков',
      few: '$count списка',
      one: '$count список',
    );
    return '$_temp0';
  }

  @override
  String get dashboardHelpTitle => 'Помощь и инструкция';

  @override
  String get dashboardHelpSubtitle => 'Как работает Vokabeltrainer';

  @override
  String get dashboardStreakNone => 'Начни свою серию сегодня!';

  @override
  String get dashboardStreakFirstDay => 'День 1 твоей серии – так держать!';

  @override
  String dashboardStreakRun(int count) {
    return '🔥 Учишься уже дней подряд: $count!';
  }

  @override
  String get dashboardGetStarted => 'Начинай!';

  @override
  String get dashboardNoListsHint =>
      'Создай учебный список: дай ему название и выбери слова, которые хочешь выучить.';

  @override
  String get dashboardNoLessonsHint =>
      'Сначала создай урок. Слова можно ввести самому или отсканировать из учебника с помощью ИИ-приложения.';

  @override
  String get dashboardCreateList => 'Создать учебный список';

  @override
  String get dashboardCreateLesson => 'Создать урок';

  @override
  String get dashboardAllDone => 'На сегодня всё сделано!';

  @override
  String get dashboardToday => 'Сегодня';

  @override
  String dashboardDoneReviewed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Сегодня ты ответил на $count вопроса. Завтра продолжим!',
      many: 'Сегодня ты ответил на $count вопросов. Завтра продолжим!',
      few: 'Сегодня ты ответил на $count вопроса. Завтра продолжим!',
      one: 'Сегодня ты ответил на $count вопрос. Завтра продолжим!',
    );
    return '$_temp0';
  }

  @override
  String get dashboardNothingDue => 'Сейчас повторять нечего. Загляни завтра!';

  @override
  String get dashboardDueLabel => 'повторить';

  @override
  String get dashboardNewLabel => 'новые';

  @override
  String get dashboardFromLists => 'Из твоих учебных списков';

  @override
  String dashboardExamToday(String name) {
    return 'Сегодня «$name»!';
  }

  @override
  String get dashboardExamTodayText =>
      'Ты тренировался – теперь покажи, на что способен. Удачи!';

  @override
  String dashboardExamTomorrow(String name) {
    return 'Завтра «$name»!';
  }

  @override
  String get dashboardExamTomorrowText =>
      'Сегодня последний день учёбы – всё повторяется ещё раз.';

  @override
  String dashboardExamInDays(String name, int days) {
    return '«$name» через $days дн.';
  }

  @override
  String dashboardExamFinalSpurt(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Финишный рывок! Осталось $count дня учёбы – каждый важен.',
      many: 'Финишный рывок! Осталось $count дней учёбы – каждый важен.',
      few: 'Финишный рывок! Осталось $count дня учёбы – каждый важен.',
      one: 'Финишный рывок! Остался $count день учёбы – каждый важен.',
    );
    return '$_temp0';
  }

  @override
  String dashboardExamDaysLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Осталось $count дня учёбы. Приложение распределит слова так, чтобы ты успел вовремя.',
      many:
          'Осталось $count дней учёбы. Приложение распределит слова так, чтобы ты успел вовремя.',
      few:
          'Осталось $count дня учёбы. Приложение распределит слова так, чтобы ты успел вовремя.',
      one:
          'Остался $count день учёбы. Приложение распределит слова так, чтобы ты успел вовремя.',
    );
    return '$_temp0';
  }

  @override
  String get practiceListsNeedLesson =>
      'Сначала создай во вкладке «Уроки» урок со словами.';

  @override
  String practiceListsLimit(int max) {
    return 'Лимит достигнут: у тебя может быть не больше $max списков одновременно.';
  }

  @override
  String get practiceListsCountdownPast => ' · прошла ✅';

  @override
  String get practiceListsCountdownToday => ' · сегодня! 🍀';

  @override
  String get practiceListsCountdownTomorrow => ' · завтра!';

  @override
  String practiceListsCountdownDays(int days) {
    return ' · через $days дн.';
  }

  @override
  String get practiceListsDueDateTitle => 'Когда контрольная?';

  @override
  String get practiceListsChangeDueDate => 'Изменить дату контрольной';

  @override
  String get practiceListsDueDateHint =>
      'Необязательно. Приложение распределит слова так, чтобы ты знал всё за день до контрольной – в сам день контрольной заниматься уже не нужно.';

  @override
  String get practiceListsPickDate => 'Выбрать дату';

  @override
  String get practiceListsRemoveDate => 'Убрать';

  @override
  String practiceListsNotifyOnSnack(String name) {
    return 'Напоминания для «$name» включены.';
  }

  @override
  String practiceListsNotifyOffSnack(String name) {
    return 'Напоминаний для «$name» больше не будет.';
  }

  @override
  String practiceListsDeleteTitle(String name) {
    return 'Удалить «$name»?';
  }

  @override
  String get practiceListsDeleteText => 'Учебный список будет удалён.';

  @override
  String get practiceListsNoVocabs => 'В этом списке нет слов.';

  @override
  String get practiceListsTitle => 'Твои учебные списки';

  @override
  String get practiceListsNew => 'Новый список';

  @override
  String get practiceListsEmptyTitle => 'Пока нет учебных списков';

  @override
  String get practiceListsEmptyText =>
      'Создай свой первый список кнопкой внизу.';

  @override
  String practiceListsSubtitleTest(String vocabs, String date) {
    return '$vocabs · Контрольная: $date';
  }

  @override
  String get practiceListsNotifyDisable => 'Выключить напоминания';

  @override
  String get practiceListsNotifyEnable => 'Включить напоминания';

  @override
  String get practiceListsNameDialogTitle => 'Новый учебный список';

  @override
  String get practiceListsNameLabel => 'Название списка';

  @override
  String get practiceListsNameHint => 'например, Контрольная 1';

  @override
  String get practiceNothingDue =>
      'На сегодня больше ничего не нужно – супер! 😎 Выбери «Все», если всё равно хочешь позаниматься.';

  @override
  String get practiceNoWeak => 'Слабых слов нет. 😎';

  @override
  String get practiceTitle => 'Выбери режим';

  @override
  String practiceSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Выбрано $count слова',
      many: 'Выбрано $count слов',
      few: 'Выбрано $count слова',
      one: 'Выбрано $count слово',
    );
    return '$_temp0';
  }

  @override
  String get practiceModeFlashcards => 'Карточки';

  @override
  String get practiceModeTest => 'Тест';

  @override
  String get practiceWhichVocabs => 'Какие слова?';

  @override
  String get practiceFilterSmart => 'Повтор и новые';

  @override
  String get practiceFilterAll => 'Все';

  @override
  String get practiceFilterWeak => 'Слабые';

  @override
  String practicePlanSummary(int due, int fresh) {
    return '$due повторить · $fresh новых';
  }

  @override
  String practicePlanSummaryLater(int due, int fresh, int later) {
    return '$due повторить · $fresh новых (ещё $later позже)';
  }

  @override
  String get practiceFlashcardsHint =>
      'Показывается слово. Ты открываешь значение и сам себя оцениваешь: Снова, Трудно, Хорошо или Легко.';

  @override
  String get practiceTestHint =>
      'Показывается слово. Ты сам вводишь перевод и формы.';

  @override
  String get practiceSmartHint =>
      '«Повтор и новые» использует интервальное повторение (FSRS): каждое слово возвращается как раз перед тем, как ты бы его забыл. Если у списка есть дата контрольной, новые слова распределяются по дням до предыдущего дня, а перед этим всё ещё раз повторяется.';

  @override
  String get practiceStart => 'Начать';

  @override
  String get flashcardWord => 'Слово';

  @override
  String get flashcardTranslation => 'Перевод';

  @override
  String flashcardTitle(int current, int total) {
    return 'Карточка $current / $total';
  }

  @override
  String get flashcardTapToFlip => 'Нажми, чтобы перевернуть';

  @override
  String get flashcardFlip => 'Перевернуть';

  @override
  String get flashcardRateAgain => 'Снова';

  @override
  String get flashcardRateHard => 'Трудно';

  @override
  String get flashcardRateGood => 'Хорошо';

  @override
  String get flashcardRateEasy => 'Легко';

  @override
  String testTranslationLabel(String language) {
    return 'Перевод ($language)';
  }

  @override
  String get testWordLabel => 'Слово';

  @override
  String testWordLabelWithLanguage(String language) {
    return 'Слово ($language)';
  }

  @override
  String get testFormsLabel => 'Формы';

  @override
  String testTitle(int current, int total) {
    return 'Тест $current / $total';
  }

  @override
  String get testTranslate => 'Переведи:';

  @override
  String testCorrectAnswer(String answer) {
    return 'Правильно: $answer';
  }

  @override
  String get testWrong => 'Неверно';

  @override
  String get testResultCorrect => 'Правильно! 🎉';

  @override
  String get testResultWrong => 'К сожалению, неверно.';

  @override
  String get testCheck => 'Проверить';

  @override
  String get selectionColumnWord => 'Слово';

  @override
  String get selectionColumnForms => 'Формы';

  @override
  String get selectionColumnTranslation => 'Перевод';

  @override
  String get selectionTitle => 'Выбрать слова';

  @override
  String get selectionMenuTooltip => 'Выбор';

  @override
  String get selectionSelectAll => 'Выбрать все';

  @override
  String get selectionClear => 'Снять выбор';

  @override
  String selectionConfirm(String label, String vocabs) {
    return '$label ($vocabs)';
  }

  @override
  String get homeTabStart => 'Главная';

  @override
  String get homeTabLessons => 'Уроки';

  @override
  String get homeTabAnalysis => 'Анализ';

  @override
  String get sessionSummaryExcellent => 'Превосходно!';

  @override
  String get sessionSummaryGreat => 'Отлично сработано!';

  @override
  String get sessionSummaryGood => 'Хорошо позанимался!';

  @override
  String get sessionSummaryKeepGoing => 'Не сдавайся!';

  @override
  String sessionSummaryScore(int correct, int total) {
    return 'С первой попытки: $correct из $total.';
  }

  @override
  String get sessionSummaryScheduled =>
      'Приложение само планирует, когда каждое слово появится снова.';

  @override
  String get sessionSummaryRestart => 'Ещё раз';

  @override
  String get changelogTitle => 'Что нового?';

  @override
  String get changelogGotIt => 'Понятно!';

  @override
  String get changelog6Title => '🔒 Конфиденциальность с первого взгляда';

  @override
  String get changelog6Text =>
      'В Настройки → «О приложении» есть политика конфиденциальности и введение, чтобы перечитать: всё остаётся на твоём телефоне, а приложение без рекламы и без покупок.';

  @override
  String get changelog5Title => '🤖 Сканирование только с ИИ-приложениями';

  @override
  String get changelog5Text =>
      'При сканировании для выбора теперь показываются только ИИ-приложения, например ChatGPT или Gemini. Инструкция для ИИ отправляется сразу вместе с фото.';

  @override
  String get changelog4Title => '🧩 Больше форм';

  @override
  String get changelog4Text =>
      'Новое в формах: множественное число, степени сравнения, падеж/предлог, склонение/спряжение и часть речи. С «Всё» ИИ берёт действительно всё, что написано в учебнике к слову.';

  @override
  String get changelog3Title => '👋 С твоим именем';

  @override
  String get changelog3Text =>
      'Если хочешь, приложение будет приветствовать тебя по имени – и в напоминаниях тоже. Изменить его можно в настройках.';

  @override
  String get changelog2Title => '💡 Короткие советы';

  @override
  String get changelog2Text =>
      'В первый раз маленькое окно объясняет, как создать урок, вводить и сканировать слова. С «Больше не показывать» оно исчезнет.';

  @override
  String get changelog1Title => '📚 Уроки на любом языке';

  @override
  String get changelog1Text =>
      'Создавай свои уроки – английский, французский, латынь или что ты учишь – и вводи слова или сканируй их из учебника.';

  @override
  String intervalMinutes(int n) {
    return '$n мин';
  }

  @override
  String intervalHours(int n) {
    return '$n ч';
  }

  @override
  String intervalDays(int n) {
    return '$n д';
  }

  @override
  String intervalMonths(int n) {
    return '$n мес';
  }

  @override
  String intervalYears(String n) {
    return '$n г';
  }

  @override
  String get changelog7Title => '🌍 Теперь на 10 языках';

  @override
  String get changelog7Text =>
      'Приложение теперь доступно на немецком, английском, испанском, французском, итальянском, португальском, польском, турецком, русском и китайском. Язык можно сменить в настройках.';
}
