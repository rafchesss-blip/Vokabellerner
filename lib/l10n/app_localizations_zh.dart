// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get commonCancel => '取消';

  @override
  String get commonSave => '保存';

  @override
  String get commonDelete => '删除';

  @override
  String get commonEdit => '编辑';

  @override
  String get commonNext => '下一步';

  @override
  String get commonBack => '返回';

  @override
  String get commonDone => '完成';

  @override
  String get commonOk => '好的';

  @override
  String get commonClose => '关闭';

  @override
  String get commonLetsGo => '开始吧';

  @override
  String get commonSkip => '跳过';

  @override
  String get commonUndo => '撤销';

  @override
  String get commonOptions => '选项';

  @override
  String get commonSettings => '设置';

  @override
  String get commonHome => '回到首页';

  @override
  String get languagePickerTitle => '应用语言';

  @override
  String get languagePickerHint => '之后可以在设置里更改。';

  @override
  String get settingsLanguage => '语言';

  @override
  String get languageGerman => '德语';

  @override
  String get languageEnglish => '英语';

  @override
  String get languageSpanish => '西班牙语';

  @override
  String get languageFrench => '法语';

  @override
  String get languageItalian => '意大利语';

  @override
  String get languagePortuguese => '葡萄牙语';

  @override
  String get languagePolish => '波兰语';

  @override
  String get languageTurkish => '土耳其语';

  @override
  String get languageRussian => '俄语';

  @override
  String get languageChinese => '中文';

  @override
  String get languageLatin => '拉丁语';

  @override
  String vocabCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个单词',
      one: '1 个单词',
    );
    return '$_temp0';
  }

  @override
  String get lessonScreenManualHintTitle => '手动输入单词';

  @override
  String get lessonScreenManualHintText =>
      '这节课的每一项都有一个输入框。只有单词和翻译是必填的。之后点一下任意单词就能修改。';

  @override
  String lessonScreenVocabAdded(String word) {
    return '已添加“$word”。';
  }

  @override
  String lessonScreenVocabDeleted(String word) {
    return '已删除“$word”。';
  }

  @override
  String get lessonScreenScanHintTitle => '扫描是这样用的';

  @override
  String lessonScreenScanHintText(String columns) {
    return '1. 给单词表拍张照——要拍正、拍清楚。\n2. 选一个 AI 应用，它会带着照片和说明打开。\n3. 把消息发出去。\n4. 复制 AI 的回答再回来——单词会被自动识别。\n\n会识别这些内容：$columns';
  }

  @override
  String get lessonScreenFreeAiHintTitle => '用免费的 AI 就够了';

  @override
  String get lessonScreenFreeAiHintText =>
      'ChatGPT、Gemini 等用免费版也能准确识别单词——不需要订阅。给 AI 的说明会自动填好。';

  @override
  String lessonScreenAiOpenFailed(String app) {
    return '无法打开 $app。';
  }

  @override
  String get lessonScreenNothingInClipboard =>
      '剪贴板里没有单词。请在 AI 应用里复制完整的回答，然后再试一次。';

  @override
  String lessonScreenImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已导入 $count 个单词。点任意一个就能修改。',
      one: '已导入 1 个单词。点一下就能修改。',
    );
    return '$_temp0';
  }

  @override
  String lessonScreenDeleteLessonTitle(String name) {
    return '删除“$name”？';
  }

  @override
  String get lessonScreenDeleteLessonText =>
      '这节课和里面所有的单词都会被删除——你的练习列表里的也会一起删掉。';

  @override
  String get lessonScreenMenuSettings => '课程设置';

  @override
  String get lessonScreenMenuDelete => '删除课程';

  @override
  String get lessonScreenEmpty => '这节课还没有单词。';

  @override
  String get lessonScreenWaitingForAi => '正在等待 AI 的回答……';

  @override
  String get lessonScreenWaitingHelp =>
      '在 AI 应用里复制回答（点文本框上的复制按钮），然后回来——单词会被自动识别。';

  @override
  String get lessonScreenPasteAnswer => '粘贴回答';

  @override
  String get lessonScreenAddTitle => '添加单词';

  @override
  String get lessonScreenAddManually => '自己输入';

  @override
  String get lessonScreenScan => '扫描';

  @override
  String get lessonScreenScanTip =>
      '小提示：用“扫描”给课本上的单词表拍张照。ChatGPT 或 Gemini 这样的 AI 应用会帮你识别——不用自己打字。';

  @override
  String get lessonScreenTakePhoto => '拍照';

  @override
  String get lessonScreenPhotoFromGallery => '从相册选择';

  @override
  String get lessonScreenWhichAi => '用哪个 AI？';

  @override
  String get lessonScreenNoAiInstalled => '你的手机上还没有 AI 应用。先免费装一个，然后再点一次“扫描”。';

  @override
  String lessonScreenInstallApp(String app) {
    return '安装 $app';
  }

  @override
  String get lessonScreenFreeInPlayStore => '在 Play 商店免费下载';

  @override
  String get lessonScreenAiDisclaimer =>
      'Vokabeltrainer 与这些应用及其提供商没有关联。它们适用各自的隐私政策。';

  @override
  String lessonScreenRecognized(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '识别到 $count 个单词',
      one: '识别到 1 个单词',
    );
    return '$_temp0';
  }

  @override
  String lessonScreenDuplicatesSkipped(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '有 $count 个已经在这节课里了，将被跳过。',
      one: '有 1 个已经在这节课里了，将被跳过。',
    );
    return '$_temp0';
  }

  @override
  String lessonScreenImportButton(int count) {
    return '导入 $count 个';
  }

  @override
  String get lessonSetupTitleNew => '新课程';

  @override
  String get lessonSetupTitleEdit => '课程设置';

  @override
  String get lessonSetupNameLabel => '课程名称';

  @override
  String get lessonSetupNameHint => '例如 Unit 3 或第 5 课';

  @override
  String get lessonSetupLanguageLabel => '单词的语言';

  @override
  String get lessonSetupTranslationLabel => '翻译成';

  @override
  String get lessonSetupFieldsTitle => '要输入哪些内容？';

  @override
  String get lessonSetupFieldsHelp => '输入、AI 扫描和测试都会按这个来。';

  @override
  String get lessonSetupWord => '单词';

  @override
  String get lessonSetupTranslation => '翻译';

  @override
  String get lessonSetupAlwaysIncluded => '必选';

  @override
  String get lessonSetupForms => '词形';

  @override
  String get lessonSetupFormsSubtitle => '例如动词变位、属格、性';

  @override
  String get lessonSetupWhichForms => '哪些词形？';

  @override
  String get lessonSetupAllForms => '全部';

  @override
  String get lessonSetupAllFormsHelp => '书上关于这个词的所有信息：动词基本形式、复数、性、比较级、格等等。';

  @override
  String get lessonSetupPickOneKind => '至少选择一种。';

  @override
  String get lessonSetupExtrasTitle => '其他（最多 3 个）';

  @override
  String get lessonSetupExtrasHelp => '自定义字段，例如例句或记忆技巧。';

  @override
  String lessonSetupExtraFieldLabel(int number) {
    return '其他 $number – 名称';
  }

  @override
  String lessonSetupExtraDefaultName(int number) {
    return '其他 $number';
  }

  @override
  String get lessonSetupRemove => '移除';

  @override
  String get lessonSetupExtraChip => '其他';

  @override
  String get lessonSetupSuggestionExample => '例句';

  @override
  String get lessonSetupSuggestionMnemonic => '记忆技巧';

  @override
  String get lessonSetupSuggestionPronunciation => '发音';

  @override
  String get lessonSetupSuggestionOpposite => '反义词';

  @override
  String get lessonsTabNewLessonHintTitle => '新课程';

  @override
  String get lessonsTabNewLessonHintText =>
      '给课程起个名字，再选好语言。然后决定你要学什么：单词和翻译是必选的，还可以加上词形和最多三个自定义字段，比如例句或记忆技巧。';

  @override
  String get lessonsTabEmptyTitle => '还没有课程';

  @override
  String get lessonsTabEmptyText =>
      '创建你的第一节课吧。单词可以自己输入——也可以给课本拍张照，让 ChatGPT 或 Gemini 这样的 AI 应用帮你识别。';

  @override
  String get lessonsTabNewLesson => '新课程';

  @override
  String lessonsTabCardStats(int count, int known) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个单词',
      one: '1 个单词',
    );
    return '$_temp0 · 已掌握 $known 个';
  }

  @override
  String get vocabFormDialogTitleNew => '新单词';

  @override
  String get vocabFormDialogTitleEdit => '编辑单词';

  @override
  String get vocabFormDialogWord => '单词';

  @override
  String vocabFormDialogWordWithLanguage(String language) {
    return '单词（$language）';
  }

  @override
  String vocabFormDialogTranslation(String language) {
    return '翻译（$language）';
  }

  @override
  String get vocabFormDialogForms => '词形';

  @override
  String get vocabFormDialogAllForms => '所有词形';

  @override
  String get introWelcomeTitle => '欢迎使用 Vokabeltrainer';

  @override
  String get introWelcomeText =>
      '学习任何语言的单词——用单词卡、测试和聪明的复习方法。每个单词都会在你快要忘记之前及时出现。';

  @override
  String get introScanTitle => '手动输入或扫描';

  @override
  String get introScanText =>
      '创建课程并输入单词。或者给课本上的单词表拍张照：ChatGPT 或 Gemini 这样的 AI 应用会帮你识别。';

  @override
  String get introTestTitle => '准备好考试';

  @override
  String get introTestText =>
      '填上你单词测验的日期。应用会把单词分配到考试前的几天里，并提醒你学习——晚上 9 点以后绝不打扰。';

  @override
  String get introPrivacyTitle => '一切都留在你的手机上';

  @override
  String get introPrivacyText =>
      '无需账号，没有云端：你的课程和学习进度不会保存在网上任何地方。只有在扫描时，照片才会发送给你自己选择的 AI 应用。';

  @override
  String get introFreeTitle => '完全免费';

  @override
  String get introFreeText => '我不靠这个应用赚钱：没有广告，没有应用内购买，没有订阅。它就是为了帮你学习。';

  @override
  String get privacyScreenTitle => '隐私';

  @override
  String get nameDialogWelcome => '欢迎！';

  @override
  String get nameDialogTitle => '你的名字';

  @override
  String get nameDialogIntro => '你叫什么名字？这样应用就能叫你的名字跟你打招呼——提醒里也会。填不填都可以。';

  @override
  String get nameDialogLabel => '你的名字（可选）';

  @override
  String get nameDialogLocalOnly => '你的名字只保存在这部手机上。';

  @override
  String get hintDialogDontShowAgain => '不再显示';

  @override
  String get formKindVerbLabel => '动词形式';

  @override
  String get formKindNounLabel => '名词形式';

  @override
  String get formKindPluralLabel => '复数';

  @override
  String get formKindAdjectiveLabel => '形容词形式';

  @override
  String get formKindComparisonLabel => '比较级';

  @override
  String get formKindGenderLabel => '性';

  @override
  String get formKindInflectionClassLabel => '变格/变位类型';

  @override
  String get formKindGovernmentLabel => '格/介词';

  @override
  String get formKindWordClassLabel => '词性';

  @override
  String get formKindVerbExample =>
      '动词基本形式或不规则形式，例如 vocō, vocāvī, vocātum 或 go, went, gone';

  @override
  String get formKindNounExample => '例如属格：lūnae';

  @override
  String get formKindPluralExample => '例如 mice, les chevaux';

  @override
  String get formKindAdjectiveExample => '其他性的形式，例如 bonus, -a, -um';

  @override
  String get formKindComparisonExample => '例如 good, better, best';

  @override
  String get formKindGenderExample => '名词的性，例如 m, f, n 或 der/die/das';

  @override
  String get formKindInflectionClassExample => '例如 a 变格、e 变位';

  @override
  String get formKindGovernmentExample =>
      '后面接哪个格或哪个介词，例如 + Dat., sich freuen über';

  @override
  String get formKindWordClassExample => '例如动词、名词、形容词、副词';

  @override
  String get vocabModelDefaultBoxName => '单词';

  @override
  String get aiScanColumnWord => '单词';

  @override
  String get aiScanColumnTranslation => '翻译';

  @override
  String get aiScanColumnForms => '词形';

  @override
  String get aiScanForeignLanguage => '外语';

  @override
  String aiScanPromptIntro(String language, String translationLanguage) {
    return '请识别照片中的所有单词（单词为$language，翻译为$translationLanguage）。';
  }

  @override
  String get aiScanPromptAnswerOnly => '只用一个代码块回答，严格按照下面的格式，不要写任何其他文字：';

  @override
  String get aiScanPromptRules => '规则：';

  @override
  String aiScanPromptRuleColumns(int count, String columns) {
    return '每个单词一行，各列用 \" | \" 分隔，始终正好 $count 列，顺序如下：$columns。';
  }

  @override
  String aiScanPromptRuleNoHeader(String marker) {
    return '不要写列名那一行，第一行始终是 $marker。';
  }

  @override
  String aiScanPromptRuleWord(String column) {
    return '$column：按照片中的写法，保留所有特殊字符和重音符号。';
  }

  @override
  String aiScanPromptRuleTranslation(String column) {
    return '$column：按照片中的内容；多个意思用逗号分隔。';
  }

  @override
  String aiScanPromptRuleAllForms(String column) {
    return '$column：照片中这个词旁边的所有语法信息——一个都不要漏。例如（但不限于）：';
  }

  @override
  String get aiScanPromptRuleAllFormsMore =>
      '其他所有属于这个词的内容（缩写、括号里的说明）也写在这里。多项信息用逗号分隔。';

  @override
  String get aiScanPromptRuleAllFormsNone => '如果照片中这个词没有任何信息，就写 \"-\"。';

  @override
  String aiScanPromptRuleSomeForms(String column) {
    return '$column：只写下面这些信息，多项用逗号分隔：';
  }

  @override
  String aiScanPromptRuleOmit(String kinds) {
    return '不要写：$kinds。';
  }

  @override
  String get aiScanPromptRuleSomeFormsNone => '如果某个词没有这类信息（例如副词），就写 \"-\"。';

  @override
  String aiScanPromptRuleExtra(String label) {
    return '$label：取自照片；如果没有，就写 \"-\"。';
  }

  @override
  String get aiScanPromptRuleMissing => '缺少某项信息时，写 \"-\"。不要编造照片里没有的内容。';

  @override
  String get aiScanPromptRuleNoPipe => '列内不要使用 \"|\"。';

  @override
  String get settingsThemeDark => '深色模式';

  @override
  String get settingsThemeLight => '浅色模式';

  @override
  String get settingsThemeSystem => '跟随系统（自动）';

  @override
  String get settingsThemeDarkDesc => '深色背景配上亮眼的霓虹色。';

  @override
  String get settingsThemeLightDesc => '明亮简约的设计，以白色和浅灰色为主。';

  @override
  String get settingsThemeSystemDesc => '跟随你设备的设置。';

  @override
  String get settingsAccentViolet => '霓虹紫';

  @override
  String get settingsAccentCyan => '霓虹青';

  @override
  String get settingsAccentEmerald => '霓虹翠绿';

  @override
  String get settingsAccentOrange => '霓虹橙';

  @override
  String get settingsAccentPink => '霓虹粉';

  @override
  String get settingsDirectionForward => '单词 → 翻译';

  @override
  String get settingsDirectionBackward => '翻译 → 单词';

  @override
  String get settingsDirectionForwardDesc => '应用显示单词，你来回答意思。';

  @override
  String get settingsDirectionBackwardDesc => '应用显示翻译，你来回答单词。';

  @override
  String get settingsAnswerTranslationOnly => '只考翻译';

  @override
  String get settingsAnswerWordOnly => '只考单词';

  @override
  String get settingsAnswerFormsOnly => '只考词形';

  @override
  String get settingsAnswerBoth => '都考';

  @override
  String get settingsAnswerTranslationOnlyDesc => '你只需要回答翻译。';

  @override
  String get settingsAnswerWordOnlyDesc => '你只需要回答单词。';

  @override
  String get settingsAnswerFormsOnlyDesc => '你只需要回答词形。';

  @override
  String get settingsAnswerBothTranslationDesc => '你要回答翻译和词形。';

  @override
  String get settingsAnswerBothWordDesc => '你要回答单词和词形。';

  @override
  String get settingsNameTitle => '你的名字';

  @override
  String get settingsNameEmpty => '未填写——只保存在这部手机上';

  @override
  String settingsNameSaved(String name) {
    return '$name · 只保存在这部手机上';
  }

  @override
  String get settingsDesignTitle => '外观';

  @override
  String get settingsAccentTitle => '强调色（霓虹）';

  @override
  String get settingsAccentHint =>
      '强调色用于按钮、开关和高亮部分。深色模式下颜色会发光，浅色模式下会自动调暗一点，保证内容清晰易读。';

  @override
  String get settingsDirectionTitle => '语言方向';

  @override
  String get settingsAnswerModeTitle => '测试的提问方式';

  @override
  String get settingsAskExtrasTitle => '一起考“其他”字段';

  @override
  String get settingsAskExtrasSubtitle => '例如例句或记忆技巧——如果这个单词有的话。';

  @override
  String get settingsFormsHint =>
      '词形指的是动词基本形式、属格或性等。如果单词没有词形，就自动只考翻译。提问方式只对测试模式有效。';

  @override
  String get settingsAboutTitle => '关于应用';

  @override
  String get settingsShowIntro => '查看介绍';

  @override
  String get settingsPrivacyTitle => '隐私';

  @override
  String get settingsPrivacySubtitle => '一切都留在你的手机上';

  @override
  String get settingsLicensesTitle => '许可证';

  @override
  String get settingsLicensesSubtitle => '使用的软件';

  @override
  String get settingsLicensesLegalese => '免费，无广告，无应用内购买。';

  @override
  String get backupExported => '正在下载备份。';

  @override
  String get backupCopied => '备份已复制到剪贴板——可以粘贴到笔记里。';

  @override
  String get backupRestoreTitle => '恢复备份？';

  @override
  String get backupRestoreMessage => '你当前的学习进度和练习列表将被备份替换。';

  @override
  String get backupRestoreAction => '恢复';

  @override
  String get backupRestored => '备份已恢复。✅';

  @override
  String get backupResetTitle => '重置学习进度？';

  @override
  String get backupResetMessage => '所有学习等级和复习时间都会被删除。课程和练习列表会保留。';

  @override
  String get backupResetAction => '重置';

  @override
  String get backupResetDone => '学习进度已重置。';

  @override
  String get backupPasteTitle => '粘贴备份';

  @override
  String get backupTitle => '数据与备份';

  @override
  String get backupHint => '你的进度只保存在这台设备上。时不时做个备份吧——这样也能换到另一台设备上继续用。';

  @override
  String get backupExportTitle => '导出备份';

  @override
  String get backupExportFile => '下载为文件';

  @override
  String get backupExportClipboard => '复制到剪贴板';

  @override
  String get backupImportTitle => '导入备份';

  @override
  String get backupImportFile => '选择备份文件';

  @override
  String get backupImportPaste => '粘贴备份文本';

  @override
  String get backupResetTile => '重置学习进度';

  @override
  String get storeBackupInvalid => '这不是有效的备份文件。';

  @override
  String get storeBackupCorrupt => '备份文件已损坏。';

  @override
  String get notifSectionBlocked =>
      '通知已被阻止。请在 Android 设置中允许 Vokabeltrainer 发送通知。';

  @override
  String get notifSectionTitle => '提醒';

  @override
  String get notifSectionAndroidOnly =>
      '📱 真正的提醒只在 Android 应用里有：每天好几次，带最新数字，晚上 9 点以后绝不打扰。';

  @override
  String get notifSectionSwitchTitle => '学习提醒';

  @override
  String get notifSectionSwitchSubtitle =>
      '带最新数字——晚上 9 点以后绝不打扰。今天的都学完了，就不会再提醒。';

  @override
  String get notifSectionHowOften => '每天几次？';

  @override
  String notifSectionTimes(String times) {
    return '时间：$times';
  }

  @override
  String get notifSectionSendTest => '发送测试通知';

  @override
  String get notifChannelName => '学习提醒';

  @override
  String get notifChannelDescription => '提醒你背单词（晚上 9 点以后绝不打扰）。';

  @override
  String get notifTestTitle => '👋 你好！你的提醒长这样';

  @override
  String get notifTestBody => '有单词等着你的时候我会提醒你——晚上 9 点以后绝不打扰。';

  @override
  String notifFirst1Title(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '🧠 有 $n 个单词在等你',
      one: '🧠 有 1 个单词在等你',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst1Body => '几分钟就够了——开始吧！';

  @override
  String get notifFirst2Title => '⚔️ 单词来袭！';

  @override
  String notifFirst2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '今天有 $n 个等着被你打败。',
      one: '今天有 1 个等着被你打败。',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst3Title => '🕵️ 今日秘密任务';

  @override
  String notifFirst3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '破解 $n 个单词。准备好了吗？',
      one: '破解 1 个单词。准备好了吗？',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst4Title => '📚 你的单词在呼唤你！';

  @override
  String notifFirst4Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '今天的计划里有 $n 个单词。',
      one: '今天的计划里有 1 个单词。',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst5Title => '🎯 今日任务';

  @override
  String notifFirst5Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '拿下 $n 个单词——你能全部搞定吗？',
      one: '拿下 1 个单词——你能搞定吗？',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst6Title => '🦉 学习猫头鹰饿了';

  @override
  String notifFirst6Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '喂它 $n 个单词吧！',
      one: '喂它 1 个单词吧！',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst7Title => '🎲 打个赌？';

  @override
  String notifFirst7Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '我赌你 5 分钟就能搞定这 $n 个单词。',
      one: '我赌你 5 分钟就能搞定这 1 个单词。',
    );
    return '$_temp0';
  }

  @override
  String notifNamed1Title(String name) {
    return '👋 嘿，$name！';
  }

  @override
  String notifNamed1Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '今天有 $n 个单词在等你。',
      one: '今天有 1 个单词在等你。',
    );
    return '$_temp0';
  }

  @override
  String notifNamed2Title(String name) {
    return '🎯 $name，这是你今天的任务';
  }

  @override
  String notifNamed2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '拿下 $n 个单词——开始吧！',
      one: '拿下 1 个单词——开始吧！',
    );
    return '$_temp0';
  }

  @override
  String notifNamed3Title(String name) {
    return '🧠 $name，学一会儿？';
  }

  @override
  String notifNamed3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '今天的计划里有 $n 个单词。',
      one: '今天的计划里有 1 个单词。',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle1Title => '⏰ 嘘……你的单词还在等你';

  @override
  String notifMiddle1Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '今天还剩 $n 个没学。',
      one: '今天还剩 1 个没学。',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle2Title => '🐢 单词们等得不耐烦了';

  @override
  String notifMiddle2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '还有 $n 个在等——只要几分钟！',
      one: '还有 1 个在等——只要几分钟！',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle3Title => '💬 你的卡片在问你去哪儿了';

  @override
  String notifMiddle3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '还剩 $n 个单词。',
      one: '还剩 1 个单词。',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle4Title => '🧩 差点忘了？';

  @override
  String notifMiddle4Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '今天还有 $n 个单词要复习。',
      one: '今天还有 1 个单词要复习。',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle5Title => '🚀 来点快速充电？';

  @override
  String notifMiddle5Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n 张卡片，然后就轻松了。',
      one: '1 张卡片，然后就轻松了。',
    );
    return '$_temp0';
  }

  @override
  String get notifLast1Title => '🌙 今天最后的机会！';

  @override
  String notifLast1Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '还有 $n 个单词——学完就收工。',
      one: '还有 1 个单词——学完就收工。',
    );
    return '$_temp0';
  }

  @override
  String get notifLast2Title => '⌛ 今天快结束了';

  @override
  String notifLast2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '再学 $n 个单词，今天就搞定了。',
      one: '再学 1 个单词，今天就搞定了。',
    );
    return '$_temp0';
  }

  @override
  String get notifLast3Title => '🛡️ 今天最后冲刺';

  @override
  String notifLast3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '离收工还差 $n 个单词。',
      one: '离收工还差 1 个单词。',
    );
    return '$_temp0';
  }

  @override
  String notifStreakTitle(int streak) {
    return '🔥 你的 $streak 天连续记录有危险！';
  }

  @override
  String notifStreakTitleNamed(String name, int streak) {
    return '🔥 $name，你的 $streak 天连续记录有危险！';
  }

  @override
  String notifStreakBody(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '还有 $n 个单词——今天学完，别让记录断掉。',
      one: '还有 1 个单词——今天学完，别让记录断掉。',
    );
    return '$_temp0';
  }

  @override
  String notifExamTomorrowTitle(String list) {
    return '🚨 明天就是“$list”了！';
  }

  @override
  String notifExamTomorrowBodyLast(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '最后的机会：再复习 $n 个单词！',
      one: '最后的机会：再复习 1 个单词！',
    );
    return '$_temp0';
  }

  @override
  String notifExamTomorrowBody(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '今天是最后一个学习日——有 $n 个单词在等你。',
      one: '今天是最后一个学习日——有 1 个单词在等你。',
    );
    return '$_temp0';
  }

  @override
  String notifExamSoonTitle(int days, String list) {
    return '⚡ 离“$list”还有 $days 天';
  }

  @override
  String notifExamSoonBody(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '最后冲刺！今天要学 $n 个单词。',
      one: '最后冲刺！今天要学 1 个单词。',
    );
    return '$_temp0';
  }

  @override
  String notifExamDayTitle(String list) {
    return '🍀 今天就是“$list”！';
  }

  @override
  String get notifExamDayBody => '你已经练过了——现在展示你的实力吧。祝你成功！💪';

  @override
  String get analyseEmptyTitle => '还没有练习列表';

  @override
  String get analyseEmptyText => '创建一个练习列表，就能在这里看到你的进步。';

  @override
  String analyseSummary(int total, int good, int neutral, int weak) {
    String _temp0 = intl.Intl.pluralLogic(
      total,
      locale: localeName,
      other: '$total 个单词',
      one: '1 个单词',
    );
    return '$_temp0 · $good 好 · $neutral 一般 · $weak 弱';
  }

  @override
  String analyseGoalUntil(String date) {
    return '目标：$date 前';
  }

  @override
  String get analyseOverallGoal => '总目标';

  @override
  String analyseKnown(int known, int total) {
    return '已掌握 $known/$total 个单词';
  }

  @override
  String get analyseDailyGoal => '每日目标';

  @override
  String get analyseAllDone => '全部完成';

  @override
  String analyseLearnedToday(int learned, int target) {
    return '今天已学 $learned/$target';
  }

  @override
  String get analyseAllKnown => '所有单词都掌握了！🎉';

  @override
  String analyseRemaining(int days, int remaining) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days 天',
      one: '1 天',
    );
    String _temp1 = intl.Intl.pluralLogic(
      remaining,
      locale: localeName,
      other: '$remaining 个单词',
      one: '1 个单词',
    );
    return '还有 $_temp0 · $_temp1没学。';
  }

  @override
  String get vocabDetailNeverPracticed => '还没练过';

  @override
  String vocabDetailMemoryDue(int percent, int reps) {
    return '记忆：$percent% · 现在该复习 · 已练 $reps 次';
  }

  @override
  String vocabDetailMemoryNext(int percent, String interval, int reps) {
    return '记忆：$percent% · $interval后复习 · 已练 $reps 次';
  }

  @override
  String get vocabDetailNoHistory => '还没有历史记录。';

  @override
  String get vocabDetailWorse => '降低';

  @override
  String get vocabDetailBetter => '提高';

  @override
  String get levelVeryGood => '非常好';

  @override
  String get levelGood => '好';

  @override
  String get levelQuiteGood => '挺好';

  @override
  String get levelOkay => '还行';

  @override
  String get levelSlightlyGood => '稍好';

  @override
  String get levelNeutral => '一般';

  @override
  String get levelSlightlyWeak => '稍弱';

  @override
  String get levelWeak => '弱';

  @override
  String get levelQuiteWeak => '挺弱';

  @override
  String get levelBad => '差';

  @override
  String get levelVeryBad => '非常差';

  @override
  String get tutorialTitle => '应用使用方法';

  @override
  String get tutorialPage1Title => 'Vokabeltrainer 是这样用的';

  @override
  String get tutorialPage1Text =>
      '这个应用帮你学习任何语言的单词——用单词卡、测试和聪明的复习方法。向左滑动或点“下一步”，了解所有功能。';

  @override
  String get tutorialPage2Title => '创建课程';

  @override
  String get tutorialPage2Text =>
      '在“课程”标签页里创建课程：名称、语言，以及你要学什么——单词和翻译，还可以加上词形和最多三个自定义字段，比如例句或记忆技巧。';

  @override
  String get tutorialPage3Title => '扫描单词';

  @override
  String get tutorialPage3Text =>
      '自己输入单词——或者点“扫描”，给课本上的单词表拍张照。ChatGPT 或 Gemini 这样的 AI 应用会帮你识别。复制它的回答，回到这里，搞定。';

  @override
  String get tutorialPage4Title => '创建练习列表';

  @override
  String get tutorialPage4Text =>
      '在首页点“练习列表”，再点“新列表”。给列表起个名字，可以填上单词测验的日期，然后从你的课程里选出单词。';

  @override
  String get tutorialPage5Title => '每天学一点';

  @override
  String get tutorialPage5Text =>
      '首页的“今天”下面会显示你的列表中现在该学的内容：先是要复习的，再加上最多 15 个新单词。点“开始吧”就能开始。';

  @override
  String get tutorialPage6Title => '单词卡';

  @override
  String get tutorialPage6Text =>
      '点一下卡片把它翻过来，然后诚实地给自己打分：“再来”“困难”“良好”或“简单”。每个按钮下面都写着卡片什么时候再出现。在电脑上：空格键翻卡，1–4 打分。';

  @override
  String get tutorialPage7Title => '聪明地复习';

  @override
  String get tutorialPage7Text =>
      '应用会在你快要忘记某个单词之前及时考你（使用 FSRS 间隔重复，和 Anki 一样）。掌握得好的单词出现得少，难的出现得多。每天学一点——让你的 🔥 连续学习记录保持下去。';

  @override
  String get tutorialPage8Title => '盯紧单词测验';

  @override
  String get tutorialPage8Text =>
      '创建列表时填上考试日期。应用会把新单词分配到各天，让你在考试前一天学完——那天会把所有内容再复习一遍。离考试越近，单词出现得越频繁。';

  @override
  String get tutorialPage9Title => '提醒';

  @override
  String get tutorialPage9Text =>
      '应用每天最多提醒你 3 次——带最新数字，晚上 9 点以后绝不打扰。今天的都学完了，就不会再提醒。可以在“设置 → 提醒”里调整。';

  @override
  String get tutorialPage10Title => '测试模式';

  @override
  String get tutorialPage10Text =>
      '在这里你要自己输入翻译和/或词形——也可以加上自定义字段（在设置里）。检查时不区分大小写，也不管冠词（如 der/die/das、the）。';

  @override
  String get tutorialPage11Title => '查看学习进度';

  @override
  String get tutorialPage11Text =>
      '在“分析”标签页里能看到每个单词和它的学习等级：5 种绿色（好）、灰色（一般）和 5 种红色（弱）。点一个单词可以看历史图表，还能用 +/− 手动提高或降低等级。';

  @override
  String get tutorialPage12Title => '你的数据';

  @override
  String get tutorialPage12Text =>
      '所有数据只保存在这台设备上——不需要账号，不需要联网。时不时在设置里做个备份吧。这样也能换到另一台设备上继续用。';

  @override
  String get dashboardGreetingNight => '还没睡？🌙';

  @override
  String dashboardGreetingNightName(String name) {
    return '还没睡呀，$name？🌙';
  }

  @override
  String get dashboardGreetingMorning => '早上好！☀️';

  @override
  String dashboardGreetingMorningName(String name) {
    return '早上好，$name！☀️';
  }

  @override
  String get dashboardGreetingDay => '你好！👋';

  @override
  String dashboardGreetingDayName(String name) {
    return '你好，$name！👋';
  }

  @override
  String get dashboardGreetingEvening => '晚上好！🌆';

  @override
  String dashboardGreetingEveningName(String name) {
    return '晚上好，$name！🌆';
  }

  @override
  String dashboardStreakLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '连续天数',
      one: '连续天数',
    );
    return '$_temp0';
  }

  @override
  String get dashboardPracticedToday => '今天已练';

  @override
  String dashboardKnownOf(int total) {
    return '共 $total 个，已掌握';
  }

  @override
  String get dashboardPracticeLists => '练习列表';

  @override
  String get dashboardPracticeListsEmpty => '为考试整理一组单词';

  @override
  String dashboardListCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个列表',
      one: '1 个列表',
    );
    return '$_temp0';
  }

  @override
  String get dashboardHelpTitle => '帮助与教程';

  @override
  String get dashboardHelpSubtitle => 'Vokabeltrainer 是这样用的';

  @override
  String get dashboardStreakNone => '今天就开始你的连续学习吧！';

  @override
  String get dashboardStreakFirstDay => '连续学习第 1 天——继续加油！';

  @override
  String dashboardStreakRun(int count) {
    return '🔥 已连续学习 $count 天！';
  }

  @override
  String get dashboardGetStarted => '开始吧！';

  @override
  String get dashboardNoListsHint => '现在就创建一个练习列表：起个名字，再选出你想学的单词。';

  @override
  String get dashboardNoLessonsHint => '先创建一节课。单词可以自己输入，也可以用 AI 应用从课本上扫描。';

  @override
  String get dashboardCreateList => '创建练习列表';

  @override
  String get dashboardCreateLesson => '创建课程';

  @override
  String get dashboardAllDone => '今天的都完成啦！';

  @override
  String get dashboardToday => '今天';

  @override
  String dashboardDoneReviewed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '你今天完成了 $count 次练习。明天继续！',
      one: '你今天完成了 1 次练习。明天继续！',
    );
    return '$_temp0';
  }

  @override
  String get dashboardNothingDue => '现在没有要复习的。明天再来看看吧！';

  @override
  String get dashboardDueLabel => '要复习';

  @override
  String get dashboardNewLabel => '新单词';

  @override
  String get dashboardFromLists => '来自你的练习列表';

  @override
  String dashboardExamToday(String name) {
    return '今天就是“$name”！';
  }

  @override
  String get dashboardExamTodayText => '你已经练过了——现在展示你的实力吧。祝你成功！';

  @override
  String dashboardExamTomorrow(String name) {
    return '明天就是“$name”！';
  }

  @override
  String get dashboardExamTomorrowText => '今天是最后一个学习日——所有内容会再复习一遍。';

  @override
  String dashboardExamInDays(String name, int days) {
    return '离“$name”还有 $days 天';
  }

  @override
  String dashboardExamFinalSpurt(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '最后冲刺！还剩 $count 个学习日——每一天都很重要。',
      one: '最后冲刺！还剩 1 个学习日——每一天都很重要。',
    );
    return '$_temp0';
  }

  @override
  String dashboardExamDaysLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '还剩 $count 个学习日。应用会合理分配单词，让你按时学完。',
      one: '还剩 1 个学习日。应用会合理分配单词，让你按时学完。',
    );
    return '$_temp0';
  }

  @override
  String get practiceListsNeedLesson => '先在“课程”里创建一节有单词的课。';

  @override
  String practiceListsLimit(int max) {
    return '已达上限：最多只能同时有 $max 个列表。';
  }

  @override
  String get practiceListsCountdownPast => ' · 已结束 ✅';

  @override
  String get practiceListsCountdownToday => ' · 就是今天！🍀';

  @override
  String get practiceListsCountdownTomorrow => ' · 就在明天！';

  @override
  String practiceListsCountdownDays(int days) {
    return ' · 还有 $days 天';
  }

  @override
  String get practiceListsDueDateTitle => '单词测验是哪天？';

  @override
  String get practiceListsChangeDueDate => '更改考试日期';

  @override
  String get practiceListsDueDateHint =>
      '可选。应用会合理分配单词，让你在考试前一天全部掌握——考试当天就不用再练了。';

  @override
  String get practiceListsPickDate => '选择日期';

  @override
  String get practiceListsRemoveDate => '移除';

  @override
  String practiceListsNotifyOnSnack(String name) {
    return '已开启“$name”的提醒。';
  }

  @override
  String practiceListsNotifyOffSnack(String name) {
    return '已关闭“$name”的提醒。';
  }

  @override
  String practiceListsDeleteTitle(String name) {
    return '删除“$name”？';
  }

  @override
  String get practiceListsDeleteText => '这个练习列表将被删除。';

  @override
  String get practiceListsNoVocabs => '这个列表里没有单词。';

  @override
  String get practiceListsTitle => '你的练习列表';

  @override
  String get practiceListsNew => '新列表';

  @override
  String get practiceListsEmptyTitle => '还没有练习列表';

  @override
  String get practiceListsEmptyText => '点下面的按钮创建你的第一个列表。';

  @override
  String practiceListsSubtitleTest(String vocabs, String date) {
    return '$vocabs · 考试：$date';
  }

  @override
  String get practiceListsNotifyDisable => '关闭提醒';

  @override
  String get practiceListsNotifyEnable => '开启提醒';

  @override
  String get practiceListsNameDialogTitle => '新练习列表';

  @override
  String get practiceListsNameLabel => '列表名称';

  @override
  String get practiceListsNameHint => '例如 单词测验 1';

  @override
  String get practiceNothingDue => '今天没有要学的了——太棒了！😎 如果还想练，就选“全部”。';

  @override
  String get practiceNoWeak => '没有薄弱的单词。😎';

  @override
  String get practiceTitle => '选择模式';

  @override
  String practiceSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已选 $count 个单词',
      one: '已选 1 个单词',
    );
    return '$_temp0';
  }

  @override
  String get practiceModeFlashcards => '单词卡';

  @override
  String get practiceModeTest => '测试';

  @override
  String get practiceWhichVocabs => '练哪些单词？';

  @override
  String get practiceFilterSmart => '待复习和新词';

  @override
  String get practiceFilterAll => '全部';

  @override
  String get practiceFilterWeak => '薄弱';

  @override
  String practicePlanSummary(int due, int fresh) {
    return '$due 个待复习 · $fresh 个新词';
  }

  @override
  String practicePlanSummaryLater(int due, int fresh, int later) {
    return '$due 个待复习 · $fresh 个新词（之后还有 $later 个）';
  }

  @override
  String get practiceFlashcardsHint => '屏幕上会显示一个单词。你翻开看意思，然后给自己打分：再来、困难、良好或简单。';

  @override
  String get practiceTestHint => '屏幕上会显示一个单词。你自己输入翻译和词形。';

  @override
  String get practiceSmartHint =>
      '“待复习和新词”使用间隔重复（FSRS）：每个单词都会在你快要忘记之前及时出现。如果列表有考试日期，新单词会分配到考试前一天为止的各天，并在考试前把所有内容再复习一遍。';

  @override
  String get practiceStart => '开始';

  @override
  String get flashcardWord => '单词';

  @override
  String get flashcardTranslation => '翻译';

  @override
  String flashcardTitle(int current, int total) {
    return '卡片 $current / $total';
  }

  @override
  String get flashcardTapToFlip => '点击翻面';

  @override
  String get flashcardFlip => '翻面';

  @override
  String get flashcardRateAgain => '再来';

  @override
  String get flashcardRateHard => '困难';

  @override
  String get flashcardRateGood => '良好';

  @override
  String get flashcardRateEasy => '简单';

  @override
  String testTranslationLabel(String language) {
    return '翻译（$language）';
  }

  @override
  String get testWordLabel => '单词';

  @override
  String testWordLabelWithLanguage(String language) {
    return '单词（$language）';
  }

  @override
  String get testFormsLabel => '词形';

  @override
  String testTitle(int current, int total) {
    return '测试 $current / $total';
  }

  @override
  String get testTranslate => '翻译：';

  @override
  String testCorrectAnswer(String answer) {
    return '正确答案：$answer';
  }

  @override
  String get testWrong => '错误';

  @override
  String get testResultCorrect => '正确！🎉';

  @override
  String get testResultWrong => '可惜答错了。';

  @override
  String get testCheck => '检查';

  @override
  String get selectionColumnWord => '单词';

  @override
  String get selectionColumnForms => '词形';

  @override
  String get selectionColumnTranslation => '翻译';

  @override
  String get selectionTitle => '选择单词';

  @override
  String get selectionMenuTooltip => '选择';

  @override
  String get selectionSelectAll => '全选';

  @override
  String get selectionClear => '取消选择';

  @override
  String selectionConfirm(String label, String vocabs) {
    return '$label（$vocabs）';
  }

  @override
  String get homeTabStart => '首页';

  @override
  String get homeTabLessons => '课程';

  @override
  String get homeTabAnalysis => '分析';

  @override
  String get sessionSummaryExcellent => '太出色了！';

  @override
  String get sessionSummaryGreat => '干得漂亮！';

  @override
  String get sessionSummaryGood => '练得不错！';

  @override
  String get sessionSummaryKeepGoing => '坚持下去！';

  @override
  String sessionSummaryScore(int correct, int total) {
    return '第一次就答对了 $correct 个，共 $total 个。';
  }

  @override
  String get sessionSummaryScheduled => '应用会自动安排每个单词下次什么时候出现。';

  @override
  String get sessionSummaryRestart => '再练一次';

  @override
  String get changelogTitle => '有什么新功能？';

  @override
  String get changelogGotIt => '知道了！';

  @override
  String get changelog6Title => '🔒 隐私一目了然';

  @override
  String get changelog6Text =>
      '在“设置 → 关于应用”里可以看到隐私政策和介绍：一切都留在你的手机上，应用没有广告，也没有任何购买。';

  @override
  String get changelog5Title => '🤖 扫描只用 AI 应用';

  @override
  String get changelog5Text =>
      '扫描时现在只会显示 ChatGPT 或 Gemini 这样的 AI 应用供你选择。给 AI 的说明会一起发过去。';

  @override
  String get changelog4Title => '🧩 更多词形';

  @override
  String get changelog4Text =>
      '词形新增：复数、比较级、格/介词、变格/变位类型和词性。选“全部”，AI 会把书上关于这个词的所有信息都识别出来。';

  @override
  String get changelog3Title => '👋 叫你的名字';

  @override
  String get changelog3Text => '如果你愿意，应用会叫你的名字跟你打招呼——提醒里也会。可以在设置里修改。';

  @override
  String get changelog2Title => '💡 小提示';

  @override
  String get changelog2Text => '第一次使用时，会有一个小窗口告诉你怎么创建课程、输入和扫描。点“不再显示”就不会再出现。';

  @override
  String get changelog1Title => '📚 支持任何语言的课程';

  @override
  String get changelog1Text => '创建你自己的课程——英语、法语、拉丁语或任何你在学的语言——自己输入单词，或者从课本上扫描。';

  @override
  String intervalMinutes(int n) {
    return '$n分钟';
  }

  @override
  String intervalHours(int n) {
    return '$n小时';
  }

  @override
  String intervalDays(int n) {
    return '$n天';
  }

  @override
  String intervalMonths(int n) {
    return '$n个月';
  }

  @override
  String intervalYears(String n) {
    return '$n年';
  }

  @override
  String get changelog7Title => '🌍 现已支持 10 种语言';

  @override
  String get changelog7Text =>
      '应用现在支持德语、英语、西班牙语、法语、意大利语、葡萄牙语、波兰语、土耳其语、俄语和中文。你可以在设置中切换语言。';
}
