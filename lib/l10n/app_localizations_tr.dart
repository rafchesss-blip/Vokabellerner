// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get commonCancel => 'İptal';

  @override
  String get commonSave => 'Kaydet';

  @override
  String get commonDelete => 'Sil';

  @override
  String get commonEdit => 'Düzenle';

  @override
  String get commonNext => 'İleri';

  @override
  String get commonBack => 'Geri';

  @override
  String get commonDone => 'Bitti';

  @override
  String get commonOk => 'Tamam';

  @override
  String get commonClose => 'Kapat';

  @override
  String get commonLetsGo => 'Hadi başla';

  @override
  String get commonSkip => 'Atla';

  @override
  String get commonUndo => 'Geri al';

  @override
  String get commonOptions => 'Seçenekler';

  @override
  String get commonSettings => 'Ayarlar';

  @override
  String get commonHome => 'Ana sayfaya dön';

  @override
  String get languagePickerTitle => 'Uygulama dili';

  @override
  String get languagePickerHint =>
      'Bunu daha sonra ayarlardan değiştirebilirsin.';

  @override
  String get settingsLanguage => 'Dil';

  @override
  String get languageGerman => 'Almanca';

  @override
  String get languageEnglish => 'İngilizce';

  @override
  String get languageSpanish => 'İspanyolca';

  @override
  String get languageFrench => 'Fransızca';

  @override
  String get languageItalian => 'İtalyanca';

  @override
  String get languagePortuguese => 'Portekizce';

  @override
  String get languagePolish => 'Lehçe';

  @override
  String get languageTurkish => 'Türkçe';

  @override
  String get languageRussian => 'Rusça';

  @override
  String get languageChinese => 'Çince';

  @override
  String get languageLatin => 'Latince';

  @override
  String vocabCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kelime',
      one: '1 kelime',
    );
    return '$_temp0';
  }

  @override
  String get lessonScreenManualHintTitle => 'Kelimeleri yaz';

  @override
  String get lessonScreenManualHintText =>
      'Bu dersteki her bilgi için bir alan göreceksin. Sadece kelime ve çeviri doldurulmalı. Sonra herhangi bir kelimeye dokunarak onu değiştirebilirsin.';

  @override
  String lessonScreenVocabAdded(String word) {
    return '“$word” eklendi.';
  }

  @override
  String lessonScreenVocabDeleted(String word) {
    return '“$word” silindi.';
  }

  @override
  String get lessonScreenScanHintTitle => 'Tarama nasıl çalışır';

  @override
  String lessonScreenScanHintText(String columns) {
    return '1. Kelime listesinin fotoğrafını çek – düz ve okunaklı olsun.\n2. Bir yapay zekâ uygulaması seç. Fotoğraf ve talimatla birlikte açılır.\n3. Mesajı gönder.\n4. Cevabı kopyala ve geri gel – kelimeler otomatik olarak tanınır.\n\nOkunacak olanlar: $columns';
  }

  @override
  String get lessonScreenFreeAiHintTitle => 'En iyisi ücretsiz bir yapay zekâ';

  @override
  String get lessonScreenFreeAiHintText =>
      'ChatGPT, Gemini ve benzerleri ücretsiz sürümde de kelimeleri güvenilir şekilde okur – aboneliğe gerek yok. Yapay zekâ için talimat otomatik olarak eklenir.';

  @override
  String lessonScreenAiOpenFailed(String app) {
    return '$app açılamadı.';
  }

  @override
  String get lessonScreenNothingInClipboard =>
      'Panoda kelime yok. Yapay zekâ uygulamasında cevabın tamamını kopyala ve tekrar dene.';

  @override
  String lessonScreenImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kelime eklendi. Düzeltmek için birine dokun.',
      one: '1 kelime eklendi. Düzeltmek için ona dokun.',
    );
    return '$_temp0';
  }

  @override
  String lessonScreenDeleteLessonTitle(String name) {
    return '“$name” silinsin mi?';
  }

  @override
  String get lessonScreenDeleteLessonText =>
      'Ders ve tüm kelimeleri silinecek – çalışma listelerinden de.';

  @override
  String get lessonScreenMenuSettings => 'Dersi ayarla';

  @override
  String get lessonScreenMenuDelete => 'Dersi sil';

  @override
  String get lessonScreenEmpty => 'Bu derste henüz kelime yok.';

  @override
  String get lessonScreenWaitingForAi => 'Yapay zekânın cevabı bekleniyor …';

  @override
  String get lessonScreenWaitingHelp =>
      'Yapay zekâ uygulamasında cevabı kopyala (metin bloğundaki kopyala düğmesi) ve geri gel – kelimeler otomatik olarak tanınır.';

  @override
  String get lessonScreenPasteAnswer => 'Cevabı yapıştır';

  @override
  String get lessonScreenAddTitle => 'Kelime ekle';

  @override
  String get lessonScreenAddManually => 'Kendin yaz';

  @override
  String get lessonScreenScan => 'Tara';

  @override
  String get lessonScreenScanTip =>
      'İpucu: “Tara” ile kitabındaki kelime listesinin fotoğrafını çekersin. ChatGPT veya Gemini gibi bir yapay zekâ uygulaması onu senin için okur – elle yazmana gerek yok.';

  @override
  String get lessonScreenTakePhoto => 'Fotoğraf çek';

  @override
  String get lessonScreenPhotoFromGallery => 'Galeriden fotoğraf';

  @override
  String get lessonScreenWhichAi => 'Hangi yapay zekâ ile?';

  @override
  String get lessonScreenNoAiInstalled =>
      'Telefonunda henüz yapay zekâ uygulaması yok. Ücretsiz birini yükle ve sonra tekrar “Tara”ya dokun.';

  @override
  String lessonScreenInstallApp(String app) {
    return '$app yükle';
  }

  @override
  String get lessonScreenFreeInPlayStore => 'Play Store\'da ücretsiz';

  @override
  String get lessonScreenAiDisclaimer =>
      'Vokabeltrainer bu uygulamalarla veya sağlayıcılarıyla bağlantılı değildir. Onlar için kendi gizlilik politikaları geçerlidir.';

  @override
  String lessonScreenRecognized(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kelime tanındı',
      one: '1 kelime tanındı',
    );
    return '$_temp0';
  }

  @override
  String lessonScreenDuplicatesSkipped(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kelime zaten derste var, atlanacak.',
      one: '1 kelime zaten derste var, atlanacak.',
    );
    return '$_temp0';
  }

  @override
  String lessonScreenImportButton(int count) {
    return '$count kelimeyi ekle';
  }

  @override
  String get lessonSetupTitleNew => 'Yeni ders';

  @override
  String get lessonSetupTitleEdit => 'Dersi ayarla';

  @override
  String get lessonSetupNameLabel => 'Dersin adı';

  @override
  String get lessonSetupNameHint => 'ör. Unit 3 veya Ders 5';

  @override
  String get lessonSetupLanguageLabel => 'Kelimelerin dili';

  @override
  String get lessonSetupTranslationLabel => 'Çeviri dili';

  @override
  String get lessonSetupFieldsTitle => 'Neler girilecek?';

  @override
  String get lessonSetupFieldsHelp =>
      'Giriş, yapay zekâ ile tarama ve test buna göre ayarlanır.';

  @override
  String get lessonSetupWord => 'Kelime';

  @override
  String get lessonSetupTranslation => 'Çeviri';

  @override
  String get lessonSetupAlwaysIncluded => 'her zaman var';

  @override
  String get lessonSetupForms => 'Formlar';

  @override
  String get lessonSetupFormsSubtitle =>
      'ör. temel çekimler, genitif, cinsiyet';

  @override
  String get lessonSetupWhichForms => 'Hangi formlar?';

  @override
  String get lessonSetupAllForms => 'Hepsi';

  @override
  String get lessonSetupAllFormsHelp =>
      'Kitapta kelimeyle ilgili ne varsa: temel çekimler, çoğul, cinsiyet, karşılaştırma, hâl ve daha fazlası.';

  @override
  String get lessonSetupPickOneKind => 'En az bir tür seç.';

  @override
  String get lessonSetupExtrasTitle => 'Diğer (en fazla 3)';

  @override
  String get lessonSetupExtrasHelp =>
      'Kendi alanların, ör. örnek cümle veya hatırlatıcı.';

  @override
  String lessonSetupExtraFieldLabel(int number) {
    return 'Diğer $number – Ad';
  }

  @override
  String lessonSetupExtraDefaultName(int number) {
    return 'Diğer $number';
  }

  @override
  String get lessonSetupRemove => 'Kaldır';

  @override
  String get lessonSetupExtraChip => 'Diğer';

  @override
  String get lessonSetupSuggestionExample => 'Örnek cümle';

  @override
  String get lessonSetupSuggestionMnemonic => 'Hatırlatıcı';

  @override
  String get lessonSetupSuggestionPronunciation => 'Telaffuz';

  @override
  String get lessonSetupSuggestionOpposite => 'Zıt anlam';

  @override
  String get lessonsTabNewLessonHintTitle => 'Yeni ders';

  @override
  String get lessonsTabNewLessonHintText =>
      'Derse bir ad ver ve dili seç. Sonra ne öğrenmek istediğini belirle: Kelime ve çeviri her zaman var, istersen formlar ve örnek cümle veya hatırlatıcı gibi en fazla üç kendi alanın da.';

  @override
  String get lessonsTabEmptyTitle => 'Henüz ders yok';

  @override
  String get lessonsTabEmptyText =>
      'İlk dersini oluştur. Kelimeleri kendin yazarsın – ya da kitabındaki sayfanın fotoğrafını çekip ChatGPT veya Gemini gibi bir yapay zekâ uygulamasına okutursun.';

  @override
  String get lessonsTabNewLesson => 'Yeni ders';

  @override
  String lessonsTabCardStats(int count, int known) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kelime',
      one: '1 kelime',
    );
    return '$_temp0 · $known biliniyor';
  }

  @override
  String get vocabFormDialogTitleNew => 'Yeni kelime';

  @override
  String get vocabFormDialogTitleEdit => 'Kelimeyi düzenle';

  @override
  String get vocabFormDialogWord => 'Kelime';

  @override
  String vocabFormDialogWordWithLanguage(String language) {
    return 'Kelime ($language)';
  }

  @override
  String vocabFormDialogTranslation(String language) {
    return 'Çeviri ($language)';
  }

  @override
  String get vocabFormDialogForms => 'Formlar';

  @override
  String get vocabFormDialogAllForms => 'tüm formlar';

  @override
  String get introWelcomeTitle => 'Vokabeltrainer\'a hoş geldin';

  @override
  String get introWelcomeText =>
      'Her dilde kelime öğren – kartlar, testler ve akıllı tekrarla. Her kelime, tam unutmak üzereyken yeniden karşına çıkar.';

  @override
  String get introScanTitle => 'Yaz veya tara';

  @override
  String get introScanText =>
      'Dersler oluştur ve kelimeleri yaz. Ya da kitabındaki listenin fotoğrafını çek: ChatGPT veya Gemini gibi bir yapay zekâ uygulaması onu senin için okur.';

  @override
  String get introTestTitle => 'Sınava hazır';

  @override
  String get introTestText =>
      'Kelime sınavının tarihini gir. Uygulama kelimeleri önceki günlere dağıtır ve sana çalışmayı hatırlatır – asla saat 21.00\'den sonra değil.';

  @override
  String get introPrivacyTitle => 'Her şey telefonunda kalır';

  @override
  String get introPrivacyText =>
      'Hesap yok, bulut yok: Derslerin ve öğrenme durumun internette hiçbir yere kaydedilmez. Sadece tarama yaptığında fotoğraf, kendi seçtiğin yapay zekâ uygulamasına gider.';

  @override
  String get introFreeTitle => 'Tamamen ücretsiz';

  @override
  String get introFreeText =>
      'Bu uygulamadan hiç para kazanmıyorum: reklam yok, uygulama içi satın alma yok, abonelik yok. Sadece öğrenmek için var.';

  @override
  String get privacyScreenTitle => 'Gizlilik';

  @override
  String get nameDialogWelcome => 'Hoş geldin!';

  @override
  String get nameDialogTitle => 'Adın';

  @override
  String get nameDialogIntro =>
      'Adın ne? O zaman uygulama seni adınla selamlar – hatırlatmalarda da. Bu isteğe bağlı.';

  @override
  String get nameDialogLabel => 'Adın (isteğe bağlı)';

  @override
  String get nameDialogLocalOnly => 'Adın sadece bu telefonda kaydedilir.';

  @override
  String get hintDialogDontShowAgain => 'Bir daha gösterme';

  @override
  String get formKindVerbLabel => 'Fiil formları';

  @override
  String get formKindNounLabel => 'İsim formları';

  @override
  String get formKindPluralLabel => 'Çoğul';

  @override
  String get formKindAdjectiveLabel => 'Sıfat formları';

  @override
  String get formKindComparisonLabel => 'Karşılaştırma';

  @override
  String get formKindGenderLabel => 'Cinsiyet';

  @override
  String get formKindInflectionClassLabel => 'Çekim grubu';

  @override
  String get formKindGovernmentLabel => 'Hâl/Edat';

  @override
  String get formKindWordClassLabel => 'Sözcük türü';

  @override
  String get formKindVerbExample =>
      'temel çekimler veya düzensiz formlar, ör. vocō, vocāvī, vocātum ya da go, went, gone';

  @override
  String get formKindNounExample => 'ör. genitif: lūnae';

  @override
  String get formKindPluralExample => 'ör. mice, les chevaux';

  @override
  String get formKindAdjectiveExample =>
      'diğer cinsiyetlerin formları, ör. bonus, -a, -um';

  @override
  String get formKindComparisonExample => 'ör. good, better, best';

  @override
  String get formKindGenderExample => 'isimlerde, ör. m, f, n veya der/die/das';

  @override
  String get formKindInflectionClassExample =>
      'ör. a-deklinasyonu, e-konjugasyonu';

  @override
  String get formKindGovernmentExample =>
      'ardından hangi hâlin veya hangi edatın geldiği, ör. + Dat., sich freuen über';

  @override
  String get formKindWordClassExample => 'ör. fiil, isim, sıfat, zarf';

  @override
  String get vocabModelDefaultBoxName => 'Kelimeler';

  @override
  String get aiScanColumnWord => 'Kelime';

  @override
  String get aiScanColumnTranslation => 'Çeviri';

  @override
  String get aiScanColumnForms => 'Formlar';

  @override
  String get aiScanForeignLanguage => 'yabancı dil';

  @override
  String aiScanPromptIntro(String language, String translationLanguage) {
    return 'Fotoğraftaki tüm kelimeleri oku (kelimelerin dili: $language, çeviri dili: $translationLanguage).';
  }

  @override
  String get aiScanPromptAnswerOnly =>
      'SADECE tek bir kod bloğuyla, tam olarak şu formatta ve başka hiçbir metin eklemeden cevap ver:';

  @override
  String get aiScanPromptRules => 'Kurallar:';

  @override
  String aiScanPromptRuleColumns(int count, String columns) {
    return 'Her kelime için bir satır, sütunlar \" | \" ile ayrılmış, her zaman tam olarak $count sütun, şu sırayla: $columns.';
  }

  @override
  String aiScanPromptRuleNoHeader(String marker) {
    return 'Sütun adlarının olduğu satırı yazma, ilk satır her zaman $marker olsun.';
  }

  @override
  String aiScanPromptRuleWord(String column) {
    return '$column: fotoğraftaki gibi yazılmış, tüm özel karakterler ve aksanlarla.';
  }

  @override
  String aiScanPromptRuleTranslation(String column) {
    return '$column: fotoğraftaki gibi; birden fazla anlamı virgülle ayır.';
  }

  @override
  String aiScanPromptRuleAllForms(String column) {
    return '$column: fotoğrafta kelimenin yanında yazan TÜM dil bilgisi bilgileri – hiçbir şeyi atlama. Örneğin (ama sadece bunlar değil):';
  }

  @override
  String get aiScanPromptRuleAllFormsMore =>
      'Kelimeye ait diğer her şey de (kısaltmalar, parantez içindeki notlar) buraya girer. Birden fazla bilgiyi virgülle ayır.';

  @override
  String get aiScanPromptRuleAllFormsNone =>
      'Fotoğrafta kelimeyle ilgili bilgi yoksa \"-\" yaz.';

  @override
  String aiScanPromptRuleSomeForms(String column) {
    return '$column: sadece şu bilgiler, birden fazlaysa virgülle ayrılmış:';
  }

  @override
  String aiScanPromptRuleOmit(String kinds) {
    return 'Bunları yazma: $kinds.';
  }

  @override
  String get aiScanPromptRuleSomeFormsNone =>
      'Bir kelimenin böyle bir bilgisi yoksa (ör. bir zarf), oraya \"-\" yaz.';

  @override
  String aiScanPromptRuleExtra(String label) {
    return '$label: fotoğraftan; orada bir şey yoksa \"-\".';
  }

  @override
  String get aiScanPromptRuleMissing =>
      'Bir bilgi eksikse \"-\" yaz. Fotoğrafta olmayan hiçbir şey uydurma.';

  @override
  String get aiScanPromptRuleNoPipe => 'Bir sütunun içinde \"|\" kullanma.';

  @override
  String get settingsThemeDark => 'Koyu mod';

  @override
  String get settingsThemeLight => 'Açık mod';

  @override
  String get settingsThemeSystem => 'Sistem (otomatik)';

  @override
  String get settingsThemeDarkDesc => 'Parlak neon renklerle koyu arka plan.';

  @override
  String get settingsThemeLightDesc =>
      'Beyaz ve açık gri tonlarıyla aydınlık, minimalist tasarım.';

  @override
  String get settingsThemeSystemDesc => 'Cihazının ayarına göre değişir.';

  @override
  String get settingsAccentViolet => 'Neon Mor';

  @override
  String get settingsAccentCyan => 'Neon Camgöbeği';

  @override
  String get settingsAccentEmerald => 'Neon Zümrüt';

  @override
  String get settingsAccentOrange => 'Neon Turuncu';

  @override
  String get settingsAccentPink => 'Neon Pembe';

  @override
  String get settingsDirectionForward => 'Kelime → Çeviri';

  @override
  String get settingsDirectionBackward => 'Çeviri → Kelime';

  @override
  String get settingsDirectionForwardDesc =>
      'Uygulama kelimeyi gösterir, sen anlamını cevaplarsın.';

  @override
  String get settingsDirectionBackwardDesc =>
      'Uygulama çeviriyi gösterir, sen kelimeyi cevaplarsın.';

  @override
  String get settingsAnswerTranslationOnly => 'Sadece çeviri';

  @override
  String get settingsAnswerWordOnly => 'Sadece kelime';

  @override
  String get settingsAnswerFormsOnly => 'Sadece formlar';

  @override
  String get settingsAnswerBoth => 'İkisi de';

  @override
  String get settingsAnswerTranslationOnlyDesc =>
      'Sadece çeviriyi cevaplarsın.';

  @override
  String get settingsAnswerWordOnlyDesc => 'Sadece kelimeyi cevaplarsın.';

  @override
  String get settingsAnswerFormsOnlyDesc => 'Sadece formları cevaplarsın.';

  @override
  String get settingsAnswerBothTranslationDesc =>
      'Çeviriyi ve formları cevaplarsın.';

  @override
  String get settingsAnswerBothWordDesc => 'Kelimeyi ve formları cevaplarsın.';

  @override
  String get settingsNameTitle => 'Adın';

  @override
  String get settingsNameEmpty =>
      'Belirtilmedi – sadece bu telefonda kaydedilir';

  @override
  String settingsNameSaved(String name) {
    return '$name · sadece bu telefonda kayıtlı';
  }

  @override
  String get settingsDesignTitle => 'Tasarım';

  @override
  String get settingsAccentTitle => 'Vurgu rengi (neon)';

  @override
  String get settingsAccentHint =>
      'Vurgu rengi düğmeler, anahtarlar ve vurgular için geçerlidir. Koyu modda renkler parlar, açık modda ise her şey okunaklı kalsın diye otomatik olarak biraz koyulaştırılır.';

  @override
  String get settingsDirectionTitle => 'Dil yönü';

  @override
  String get settingsAnswerModeTitle => 'Testte sorma modu';

  @override
  String get settingsAskExtrasTitle => 'Diğer alanları da sor';

  @override
  String get settingsAskExtrasSubtitle =>
      'ör. örnek cümle veya hatırlatıcı – kelimede varsa.';

  @override
  String get settingsFormsHint =>
      'Formlar ör. temel çekimler, genitif veya cinsiyettir. Bir kelimenin formu yoksa otomatik olarak sadece çevirisi sorulur. Sorma modu test modu için geçerlidir.';

  @override
  String get settingsAboutTitle => 'Uygulama hakkında';

  @override
  String get settingsShowIntro => 'Tanıtımı göster';

  @override
  String get settingsPrivacyTitle => 'Gizlilik';

  @override
  String get settingsPrivacySubtitle => 'Her şey telefonunda kalır';

  @override
  String get settingsLicensesTitle => 'Lisanslar';

  @override
  String get settingsLicensesSubtitle => 'Kullanılan yazılımlar';

  @override
  String get settingsLicensesLegalese =>
      'Ücretsiz, reklamsız ve uygulama içi satın alma olmadan.';

  @override
  String get backupExported => 'Yedek indiriliyor.';

  @override
  String get backupCopied => 'Yedek panoya kopyalandı – ör. bir nota yapıştır.';

  @override
  String get backupRestoreTitle => 'Yedek geri yüklensin mi?';

  @override
  String get backupRestoreMessage =>
      'Mevcut öğrenme ilerlemen ve çalışma listelerin yedektekilerle değiştirilecek.';

  @override
  String get backupRestoreAction => 'Geri yükle';

  @override
  String get backupRestored => 'Yedek geri yüklendi. ✅';

  @override
  String get backupResetTitle => 'Öğrenme ilerlemesi sıfırlansın mı?';

  @override
  String get backupResetMessage =>
      'Tüm öğrenme seviyeleri ve tekrar tarihleri silinecek. Dersler ve çalışma listeleri kalır.';

  @override
  String get backupResetAction => 'Sıfırla';

  @override
  String get backupResetDone => 'Öğrenme ilerlemesi sıfırlandı.';

  @override
  String get backupPasteTitle => 'Yedeği yapıştır';

  @override
  String get backupTitle => 'Veriler ve yedekleme';

  @override
  String get backupHint =>
      'İlerlemen sadece bu cihazda kaydedilir. Arada bir yedek al – böylece başka bir cihaza da geçebilirsin.';

  @override
  String get backupExportTitle => 'Yedeği dışa aktar';

  @override
  String get backupExportFile => 'Dosya olarak indir';

  @override
  String get backupExportClipboard => 'Panoya kopyala';

  @override
  String get backupImportTitle => 'Yedeği içe aktar';

  @override
  String get backupImportFile => 'Yedek dosyası seç';

  @override
  String get backupImportPaste => 'Yedeklenmiş metni yapıştır';

  @override
  String get backupResetTile => 'Öğrenme ilerlemesini sıfırla';

  @override
  String get storeBackupInvalid => 'Bu geçerli bir yedek dosyası değil.';

  @override
  String get storeBackupCorrupt => 'Yedek dosyası bozuk.';

  @override
  String get notifSectionBlocked =>
      'Bildirimler engellendi. Android ayarlarından Vokabeltrainer için bildirimlere izin ver.';

  @override
  String get notifSectionTitle => 'Hatırlatmalar';

  @override
  String get notifSectionAndroidOnly =>
      '📱 Gerçek hatırlatmalar Android uygulamasında var: günde birkaç kez, güncel sayılarla ve asla saat 21.00\'den sonra değil.';

  @override
  String get notifSectionSwitchTitle => 'Çalışma hatırlatmaları';

  @override
  String get notifSectionSwitchSubtitle =>
      'Güncel sayılarla – asla saat 21.00\'den sonra değil. Bugünlük her şeyi öğrendiysen rahat bırakır.';

  @override
  String get notifSectionHowOften => 'Günde kaç kez?';

  @override
  String notifSectionTimes(String times) {
    return 'saat $times';
  }

  @override
  String get notifSectionSendTest => 'Deneme bildirimi gönder';

  @override
  String get notifChannelName => 'Çalışma hatırlatmaları';

  @override
  String get notifChannelDescription =>
      'Sana kelime çalışmayı hatırlatır (asla saat 21.00\'den sonra değil).';

  @override
  String get notifTestTitle => '👋 Merhaba! Hatırlatmaların böyle görünecek';

  @override
  String get notifTestBody =>
      'Seni bekleyen kelimeler olduğunda haber veririm – asla saat 21.00\'den sonra değil.';

  @override
  String notifFirst1Title(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '🧠 $n kelime seni bekliyor',
      one: '🧠 1 kelime seni bekliyor',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst1Body => 'Birkaç dakika yeter – hadi başla!';

  @override
  String get notifFirst2Title => '⚔️ Kelimeler saldırıya geçti!';

  @override
  String notifFirst2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Bugün $n tanesi yenilmek istiyor.',
      one: 'Bugün 1 tanesi yenilmek istiyor.',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst3Title => '🕵️ Bugünün gizli görevi';

  @override
  String notifFirst3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n kelimenin şifresini çöz. Hazır mısın?',
      one: '1 kelimenin şifresini çöz. Hazır mısın?',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst4Title => '📚 Kelimelerin seni çağırıyor!';

  @override
  String notifFirst4Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Bugün planda $n kelime var.',
      one: 'Bugün planda 1 kelime var.',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst5Title => '🎯 Günün görevi';

  @override
  String notifFirst5Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n kelimeyi çöz – hepsini başarabilir misin?',
      one: '1 kelimeyi çöz – başarabilir misin?',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst6Title => '🦉 Öğrenme baykuşu acıktı';

  @override
  String notifFirst6Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Onu $n kelimeyle besle!',
      one: 'Onu 1 kelimeyle besle!',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst7Title => '🎲 Küçük bir iddiaya var mısın?';

  @override
  String notifFirst7Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'İddiaya girerim, $n kelimeyi 5 dakikada halledersin.',
      one: 'İddiaya girerim, o tek kelimeyi 5 dakikada halledersin.',
    );
    return '$_temp0';
  }

  @override
  String notifNamed1Title(String name) {
    return '👋 Selam $name!';
  }

  @override
  String notifNamed1Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Bugün $n kelime seni bekliyor.',
      one: 'Bugün 1 kelime seni bekliyor.',
    );
    return '$_temp0';
  }

  @override
  String notifNamed2Title(String name) {
    return '🎯 $name, bugünkü görevin';
  }

  @override
  String notifNamed2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n kelimeyi çöz – hadi başla!',
      one: '1 kelimeyi çöz – hadi başla!',
    );
    return '$_temp0';
  }

  @override
  String notifNamed3Title(String name) {
    return '🧠 $name, biraz çalışalım mı?';
  }

  @override
  String notifNamed3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Bugün planda $n kelime var.',
      one: 'Bugün planda 1 kelime var.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle1Title => '⏰ Psst… kelimelerin hâlâ bekliyor';

  @override
  String notifMiddle1Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Bugün daha $n tane kaldı.',
      one: 'Bugün daha 1 tane kaldı.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle2Title => '🐢 Kelimeler sabırsızlanıyor';

  @override
  String notifMiddle2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Daha $n tane bekliyor – sadece birkaç dakika!',
      one: 'Daha 1 tane bekliyor – sadece birkaç dakika!',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle3Title => '💬 Kartların nerede kaldığını soruyor';

  @override
  String notifMiddle3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n kelime daha kaldı.',
      one: '1 kelime daha kaldı.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle4Title => '🧩 Neredeyse unutuyordun?';

  @override
  String notifMiddle4Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n kelime bugün tekrar edilmeyi bekliyor.',
      one: '1 kelime bugün tekrar edilmeyi bekliyor.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle5Title => '🚀 Hızlı bir tur atalım mı?';

  @override
  String notifMiddle5Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n kart, sonra rahatsın.',
      one: '1 kart, sonra rahatsın.',
    );
    return '$_temp0';
  }

  @override
  String get notifLast1Title => '🌙 Bugün için son şans!';

  @override
  String notifLast1Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n kelime daha – sonra paydos.',
      one: '1 kelime daha – sonra paydos.',
    );
    return '$_temp0';
  }

  @override
  String get notifLast2Title => '⌛ Gün neredeyse bitti';

  @override
  String notifLast2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n kelime, sonra bugünlük işin bitti.',
      one: '1 kelime, sonra bugünlük işin bitti.',
    );
    return '$_temp0';
  }

  @override
  String get notifLast3Title => '🛡️ Bugün için son düzlük';

  @override
  String notifLast3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Paydosa $n kelime kaldı.',
      one: 'Paydosa 1 kelime kaldı.',
    );
    return '$_temp0';
  }

  @override
  String notifStreakTitle(int streak) {
    return '🔥 $streak günlük serin tehlikede!';
  }

  @override
  String notifStreakTitleNamed(String name, int streak) {
    return '🔥 $name, $streak günlük serin tehlikede!';
  }

  @override
  String notifStreakBody(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n kelime daha – serin bozulmasın diye bugün çalış.',
      one: '1 kelime daha – serin bozulmasın diye bugün çalış.',
    );
    return '$_temp0';
  }

  @override
  String notifExamTomorrowTitle(String list) {
    return '🚨 Yarın “$list” var!';
  }

  @override
  String notifExamTomorrowBodyLast(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Son şans: $n kelimeyi daha tekrar et!',
      one: 'Son şans: 1 kelimeyi daha tekrar et!',
    );
    return '$_temp0';
  }

  @override
  String notifExamTomorrowBody(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Bugün son çalışma günü – $n kelime bekliyor.',
      one: 'Bugün son çalışma günü – 1 kelime bekliyor.',
    );
    return '$_temp0';
  }

  @override
  String notifExamSoonTitle(int days, String list) {
    return '⚡ “$list” için $days gün kaldı';
  }

  @override
  String notifExamSoonBody(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Son düzlük! Bugün $n kelime sırada.',
      one: 'Son düzlük! Bugün 1 kelime sırada.',
    );
    return '$_temp0';
  }

  @override
  String notifExamDayTitle(String list) {
    return '🍀 Bugün “$list” var!';
  }

  @override
  String get notifExamDayBody =>
      'Çalıştın – şimdi neler yapabildiğini göster. Bol şans! 💪';

  @override
  String get analyseEmptyTitle => 'Henüz çalışma listesi yok';

  @override
  String get analyseEmptyText =>
      'İlerlemeni burada görmek için bir çalışma listesi oluştur.';

  @override
  String analyseSummary(int total, int good, int neutral, int weak) {
    String _temp0 = intl.Intl.pluralLogic(
      total,
      locale: localeName,
      other: '$total kelime',
      one: '1 kelime',
    );
    return '$_temp0 · $good iyi · $neutral nötr · $weak zayıf';
  }

  @override
  String analyseGoalUntil(String date) {
    return 'Hedef: $date';
  }

  @override
  String get analyseOverallGoal => 'Genel hedef';

  @override
  String analyseKnown(int known, int total) {
    return '$known/$total kelime biliniyor';
  }

  @override
  String get analyseDailyGoal => 'Günlük hedef';

  @override
  String get analyseAllDone => 'hepsi tamam';

  @override
  String analyseLearnedToday(int learned, int target) {
    return 'bugün $learned/$target öğrenildi';
  }

  @override
  String get analyseAllKnown => 'Tüm kelimeler biliniyor! 🎉';

  @override
  String analyseRemaining(int days, int remaining) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days gün',
      one: '1 gün',
    );
    String _temp1 = intl.Intl.pluralLogic(
      remaining,
      locale: localeName,
      other: '$remaining kelime',
      one: '1 kelime',
    );
    return '$_temp0 kaldı · $_temp1 öğrenilecek.';
  }

  @override
  String get vocabDetailNeverPracticed => 'Hiç çalışılmadı';

  @override
  String vocabDetailMemoryDue(int percent, int reps) {
    return 'Hafıza: %$percent · şimdi sırada · $reps× çalışıldı';
  }

  @override
  String vocabDetailMemoryNext(int percent, String interval, int reps) {
    return 'Hafıza: %$percent · $interval sonra tekrar · $reps× çalışıldı';
  }

  @override
  String get vocabDetailNoHistory => 'Henüz geçmiş yok.';

  @override
  String get vocabDetailWorse => 'Daha kötü';

  @override
  String get vocabDetailBetter => 'Daha iyi';

  @override
  String get levelVeryGood => 'Çok iyi';

  @override
  String get levelGood => 'İyi';

  @override
  String get levelQuiteGood => 'Oldukça iyi';

  @override
  String get levelOkay => 'Fena değil';

  @override
  String get levelSlightlyGood => 'Biraz iyi';

  @override
  String get levelNeutral => 'Nötr';

  @override
  String get levelSlightlyWeak => 'Biraz zayıf';

  @override
  String get levelWeak => 'Zayıf';

  @override
  String get levelQuiteWeak => 'Oldukça zayıf';

  @override
  String get levelBad => 'Kötü';

  @override
  String get levelVeryBad => 'Çok kötü';

  @override
  String get tutorialTitle => 'Uygulama nasıl çalışır';

  @override
  String get tutorialPage1Title => 'Vokabeltrainer nasıl çalışır';

  @override
  String get tutorialPage1Text =>
      'Bu uygulama her dilde kelime öğrenmene yardım eder – kartlar, testler ve akıllı tekrarla. Her şeyi tanımak için sola kaydır veya “İleri”ye dokun.';

  @override
  String get tutorialPage2Title => 'Ders oluştur';

  @override
  String get tutorialPage2Text =>
      '“Dersler” sekmesinde bir ders oluşturursun: ad, dil ve ne öğrenmek istediğin – kelime ve çeviri, istersen formlar ve örnek cümle veya hatırlatıcı gibi en fazla üç kendi alanın.';

  @override
  String get tutorialPage3Title => 'Kelimeleri tara';

  @override
  String get tutorialPage3Text =>
      'Kelimeleri kendin yaz – ya da “Tara”ya dokun ve kitabındaki listenin fotoğrafını çek. ChatGPT veya Gemini gibi bir yapay zekâ uygulaması onu okur. Cevabını kopyala, geri gel, bitti.';

  @override
  String get tutorialPage4Title => 'Çalışma listeleri oluştur';

  @override
  String get tutorialPage4Text =>
      'Ana sayfada “Çalışma listeleri”ne, sonra “Yeni liste”ye dokun. Listeye bir ad ver, istersen kelime sınavının tarihini gir ve derslerinden kelimeleri seç.';

  @override
  String get tutorialPage5Title => 'Her gün öğren';

  @override
  String get tutorialPage5Text =>
      'Ana sayfada “Bugün” altında listelerinden şu an sırada olanlar yazar: önce zamanı gelen tekrarlar, ardından en fazla 15 yeni kelime. Başlamak için “Hadi başla”ya dokun.';

  @override
  String get tutorialPage6Title => 'Kartlar';

  @override
  String get tutorialPage6Text =>
      'Kartı çevirmek için ona dokun ve kendini dürüstçe değerlendir: “Tekrar”, “Zor”, “İyi” veya “Kolay”. Her düğmenin altında kartın ne zaman geri geleceği yazar. Bilgisayarda: çevirmek için boşluk tuşu, değerlendirmek için 1–4.';

  @override
  String get tutorialPage7Title => 'Akıllı tekrar';

  @override
  String get tutorialPage7Text =>
      'Uygulama her kelimeyi tam unutmak üzereyken sorar (Anki\'deki gibi FSRS ile aralıklı tekrar). İyi bildiğin kelimeler daha seyrek, zor olanlar daha sık gelir. Her gün biraz çalış – bu, 🔥 öğrenme serini canlı tutar.';

  @override
  String get tutorialPage8Title => 'Kelime sınavı takipte';

  @override
  String get tutorialPage8Text =>
      'Liste oluştururken sınavının tarihini gir. Uygulama yeni kelimeleri günlere öyle dağıtır ki sınavdan ÖNCEKİ gün bitirmiş olursun – o gün her şey bir kez daha tekrar edilir. Sınav yaklaştıkça kelimeler daha sık gelir.';

  @override
  String get tutorialPage9Title => 'Hatırlatmalar';

  @override
  String get tutorialPage9Text =>
      'Uygulama sana günde en fazla 3 kez hatırlatır – güncel sayılarla ve asla saat 21.00\'den sonra değil. Bugünlük her şeyi öğrendiysen rahat bırakır. Bunu Ayarlar → Hatırlatmalar bölümünden ayarlayabilirsin.';

  @override
  String get tutorialPage10Title => 'Test modu';

  @override
  String get tutorialPage10Text =>
      'Burada çeviriyi ve/veya formları kendin yazarsın – istersen kendi alanlarını da (Ayarlar). Kontrolde büyük/küçük harf ve artikeller (ör. der/die/das, the) önemli değil.';

  @override
  String get tutorialPage11Title => 'İlerlemeni gör';

  @override
  String get tutorialPage11Text =>
      '“Analiz” sekmesinde her kelimeyi öğrenme seviyesiyle görürsün: 5 yeşil ton (iyi), gri (nötr) ve 5 kırmızı ton (zayıf). Gelişim grafiğini görmek ve +/− ile seviyeyi elle yükseltmek ya da düşürmek için bir kelimeye dokun.';

  @override
  String get tutorialPage12Title => 'Verilerin';

  @override
  String get tutorialPage12Text =>
      'Her şey sadece bu cihazda kaydedilir – hesapsız, internetsiz. Ayarlardan arada bir yedek al. Böylece başka bir cihaza da geçebilirsin.';

  @override
  String get dashboardGreetingNight => 'Hâlâ uyanık mısın? 🌙';

  @override
  String dashboardGreetingNightName(String name) {
    return 'Hâlâ uyanık mısın, $name? 🌙';
  }

  @override
  String get dashboardGreetingMorning => 'Günaydın! ☀️';

  @override
  String dashboardGreetingMorningName(String name) {
    return 'Günaydın, $name! ☀️';
  }

  @override
  String get dashboardGreetingDay => 'Merhaba! 👋';

  @override
  String dashboardGreetingDayName(String name) {
    return 'Merhaba, $name! 👋';
  }

  @override
  String get dashboardGreetingEvening => 'İyi akşamlar! 🌆';

  @override
  String dashboardGreetingEveningName(String name) {
    return 'İyi akşamlar, $name! 🌆';
  }

  @override
  String dashboardStreakLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'günlük seri',
      one: 'günlük seri',
    );
    return '$_temp0';
  }

  @override
  String get dashboardPracticedToday => 'bugün çalışıldı';

  @override
  String dashboardKnownOf(int total) {
    return '/ $total biliniyor';
  }

  @override
  String get dashboardPracticeLists => 'Çalışma listeleri';

  @override
  String get dashboardPracticeListsEmpty =>
      'Bir sınav için kelimeleri bir araya getir';

  @override
  String dashboardListCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count liste',
      one: '1 liste',
    );
    return '$_temp0';
  }

  @override
  String get dashboardHelpTitle => 'Yardım ve kılavuz';

  @override
  String get dashboardHelpSubtitle => 'Vokabeltrainer nasıl çalışır';

  @override
  String get dashboardStreakNone => 'Öğrenme serine bugün başla!';

  @override
  String get dashboardStreakFirstDay =>
      'Öğrenme serinin 1. günü – böyle devam!';

  @override
  String dashboardStreakRun(int count) {
    return '🔥 $count gündür üst üste çalışıyorsun!';
  }

  @override
  String get dashboardGetStarted => 'Hadi başla!';

  @override
  String get dashboardNoListsHint =>
      'Şimdi bir çalışma listesi oluştur: Ona bir ad ver ve öğrenmek istediğin kelimeleri seç.';

  @override
  String get dashboardNoLessonsHint =>
      'Önce bir ders oluştur. Kelimeleri kendin yazarsın ya da kitabından bir yapay zekâ uygulamasıyla tararsın.';

  @override
  String get dashboardCreateList => 'Çalışma listesi oluştur';

  @override
  String get dashboardCreateLesson => 'Ders oluştur';

  @override
  String get dashboardAllDone => 'Bugünlük her şey tamam!';

  @override
  String get dashboardToday => 'Bugün';

  @override
  String dashboardDoneReviewed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Bugün $count soruyu hallettin. Yarın devam!',
      one: 'Bugün 1 soruyu hallettin. Yarın devam!',
    );
    return '$_temp0';
  }

  @override
  String get dashboardNothingDue =>
      'Şu an sırada bir şey yok. Yarın yine uğra!';

  @override
  String get dashboardDueLabel => 'tekrar';

  @override
  String get dashboardNewLabel => 'yeni';

  @override
  String get dashboardFromLists => 'Çalışma listelerinden';

  @override
  String dashboardExamToday(String name) {
    return 'Bugün “$name” var!';
  }

  @override
  String get dashboardExamTodayText =>
      'Çalıştın – şimdi neler yapabildiğini göster. Bol şans!';

  @override
  String dashboardExamTomorrow(String name) {
    return 'Yarın “$name” var!';
  }

  @override
  String get dashboardExamTomorrowText =>
      'Bugün son çalışma günü – her şey bir kez daha tekrar edilir.';

  @override
  String dashboardExamInDays(String name, int days) {
    return '“$name” $days gün sonra';
  }

  @override
  String dashboardExamFinalSpurt(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Son düzlük! $count çalışma günü kaldı – her biri önemli.',
      one: 'Son düzlük! 1 çalışma günü kaldı – iyi değerlendir.',
    );
    return '$_temp0';
  }

  @override
  String dashboardExamDaysLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count çalışma günü kaldı. Uygulama kelimeleri, zamanında bitirebileceğin şekilde dağıtır.',
      one:
          '1 çalışma günü kaldı. Uygulama kelimeleri, zamanında bitirebileceğin şekilde dağıtır.',
    );
    return '$_temp0';
  }

  @override
  String get practiceListsNeedLesson =>
      'Önce “Dersler” sekmesinde kelimeleri olan bir ders oluştur.';

  @override
  String practiceListsLimit(int max) {
    return 'Sınıra ulaşıldı: Aynı anda en fazla $max listen olabilir.';
  }

  @override
  String get practiceListsCountdownPast => ' · bitti ✅';

  @override
  String get practiceListsCountdownToday => ' · bugün! 🍀';

  @override
  String get practiceListsCountdownTomorrow => ' · yarın!';

  @override
  String practiceListsCountdownDays(int days) {
    return ' · $days gün kaldı';
  }

  @override
  String get practiceListsDueDateTitle => 'Kelime sınavı ne zaman?';

  @override
  String get practiceListsChangeDueDate => 'Sınav tarihini değiştir';

  @override
  String get practiceListsDueDateHint =>
      'İsteğe bağlı. Uygulama kelimeleri, sınavdan önceki güne kadar hepsini bilecek şekilde dağıtır – sınav günü artık çalışman gerekmez.';

  @override
  String get practiceListsPickDate => 'Tarih seç';

  @override
  String get practiceListsRemoveDate => 'Kaldır';

  @override
  String practiceListsNotifyOnSnack(String name) {
    return '“$name” için hatırlatmalar açık.';
  }

  @override
  String practiceListsNotifyOffSnack(String name) {
    return '“$name” için artık hatırlatma yok.';
  }

  @override
  String practiceListsDeleteTitle(String name) {
    return '“$name” silinsin mi?';
  }

  @override
  String get practiceListsDeleteText => 'Çalışma listesi kaldırılacak.';

  @override
  String get practiceListsNoVocabs => 'Bu listede hiç kelime yok.';

  @override
  String get practiceListsTitle => 'Çalışma listelerin';

  @override
  String get practiceListsNew => 'Yeni liste';

  @override
  String get practiceListsEmptyTitle => 'Henüz çalışma listesi yok';

  @override
  String get practiceListsEmptyText =>
      'İlk listeni aşağıdaki düğmeyle oluştur.';

  @override
  String practiceListsSubtitleTest(String vocabs, String date) {
    return '$vocabs · Sınav: $date';
  }

  @override
  String get practiceListsNotifyDisable => 'Hatırlatmaları kapat';

  @override
  String get practiceListsNotifyEnable => 'Hatırlatmaları aç';

  @override
  String get practiceListsNameDialogTitle => 'Yeni çalışma listesi';

  @override
  String get practiceListsNameLabel => 'Listenin adı';

  @override
  String get practiceListsNameHint => 'ör. Kelime sınavı 1';

  @override
  String get practiceNothingDue =>
      'Bugün için sırada başka bir şey yok – süper! 😎 Yine de çalışmak istersen “Hepsi”ni seç.';

  @override
  String get practiceNoWeak => 'Zayıf kelime yok. 😎';

  @override
  String get practiceTitle => 'Mod seç';

  @override
  String practiceSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kelime seçildi',
      one: '1 kelime seçildi',
    );
    return '$_temp0';
  }

  @override
  String get practiceModeFlashcards => 'Kartlar';

  @override
  String get practiceModeTest => 'Test';

  @override
  String get practiceWhichVocabs => 'Hangi kelimeler?';

  @override
  String get practiceFilterSmart => 'Sırada & yeni';

  @override
  String get practiceFilterAll => 'Hepsi';

  @override
  String get practiceFilterWeak => 'Zayıflar';

  @override
  String practicePlanSummary(int due, int fresh) {
    return '$due sırada · $fresh yeni';
  }

  @override
  String practicePlanSummaryLater(int due, int fresh, int later) {
    return '$due sırada · $fresh yeni ($later tane daha sonra)';
  }

  @override
  String get practiceFlashcardsHint =>
      'Bir kelime gösterilir. Anlamını açarsın ve kendini değerlendirirsin: Tekrar, Zor, İyi veya Kolay.';

  @override
  String get practiceTestHint =>
      'Bir kelime gösterilir. Çeviriyi ve formları kendin yazarsın.';

  @override
  String get practiceSmartHint =>
      '“Sırada & yeni” aralıklı tekrar (FSRS) kullanır: Her kelime tam unutmak üzereyken yeniden gelir. Listenin bir sınav tarihi varsa, yeni kelimeler sınavdan önceki güne kadar dağıtılır ve önceden her şey bir kez daha tekrar edilir.';

  @override
  String get practiceStart => 'Başlat';

  @override
  String get flashcardWord => 'Kelime';

  @override
  String get flashcardTranslation => 'Çeviri';

  @override
  String flashcardTitle(int current, int total) {
    return 'Kart $current / $total';
  }

  @override
  String get flashcardTapToFlip => 'Çevirmek için dokun';

  @override
  String get flashcardFlip => 'Çevir';

  @override
  String get flashcardRateAgain => 'Tekrar';

  @override
  String get flashcardRateHard => 'Zor';

  @override
  String get flashcardRateGood => 'İyi';

  @override
  String get flashcardRateEasy => 'Kolay';

  @override
  String testTranslationLabel(String language) {
    return 'Çeviri ($language)';
  }

  @override
  String get testWordLabel => 'Kelime';

  @override
  String testWordLabelWithLanguage(String language) {
    return 'Kelime ($language)';
  }

  @override
  String get testFormsLabel => 'Formlar';

  @override
  String testTitle(int current, int total) {
    return 'Test $current / $total';
  }

  @override
  String get testTranslate => 'Çevir:';

  @override
  String testCorrectAnswer(String answer) {
    return 'Doğrusu: $answer';
  }

  @override
  String get testWrong => 'Yanlış';

  @override
  String get testResultCorrect => 'Doğru! 🎉';

  @override
  String get testResultWrong => 'Maalesef yanlış.';

  @override
  String get testCheck => 'Kontrol et';

  @override
  String get selectionColumnWord => 'Kelime';

  @override
  String get selectionColumnForms => 'Formlar';

  @override
  String get selectionColumnTranslation => 'Çeviri';

  @override
  String get selectionTitle => 'Kelimeleri seç';

  @override
  String get selectionMenuTooltip => 'Seçim';

  @override
  String get selectionSelectAll => 'Hepsini seç';

  @override
  String get selectionClear => 'Seçimi kaldır';

  @override
  String selectionConfirm(String label, String vocabs) {
    return '$label ($vocabs)';
  }

  @override
  String get homeTabStart => 'Ana sayfa';

  @override
  String get homeTabLessons => 'Dersler';

  @override
  String get homeTabAnalysis => 'Analiz';

  @override
  String get sessionSummaryExcellent => 'Mükemmel!';

  @override
  String get sessionSummaryGreat => 'Harika iş!';

  @override
  String get sessionSummaryGood => 'İyi çalıştın!';

  @override
  String get sessionSummaryKeepGoing => 'Devam et!';

  @override
  String sessionSummaryScore(int correct, int total) {
    return '$total kelimeden $correct tanesini ilk denemede bildin.';
  }

  @override
  String get sessionSummaryScheduled =>
      'Uygulama her kelimenin ne zaman yeniden geleceğini otomatik olarak planlar.';

  @override
  String get sessionSummaryRestart => 'Tekrar';

  @override
  String get changelogTitle => 'Yenilikler neler?';

  @override
  String get changelogGotIt => 'Anladım!';

  @override
  String get changelog6Title => '🔒 Bir bakışta gizlilik';

  @override
  String get changelog6Text =>
      'Ayarlar → “Uygulama hakkında” bölümünde gizlilik politikasını ve tanıtımı yeniden okuyabilirsin: Her şey telefonunda kalır, uygulamada reklam ve satın alma yoktur.';

  @override
  String get changelog5Title => '🤖 Tarama sadece yapay zekâ uygulamalarıyla';

  @override
  String get changelog5Text =>
      'Tararken artık sadece ChatGPT veya Gemini gibi yapay zekâ uygulamalarını seçebilirsin. Yapay zekâ için talimat da hemen birlikte gönderilir.';

  @override
  String get changelog4Title => '🧩 Daha fazla form';

  @override
  String get changelog4Text =>
      'Formlarda yeni: çoğul, karşılaştırma, hâl/edat, çekim grubu ve sözcük türü. “Hepsi” ile yapay zekâ, kitapta kelimeyle ilgili ne varsa gerçekten hepsini alır.';

  @override
  String get changelog3Title => '👋 Adınla';

  @override
  String get changelog3Text =>
      'İstersen uygulama seni adınla selamlar – hatırlatmalarda da. Adını ayarlardan değiştirebilirsin.';

  @override
  String get changelog2Title => '💡 Kısa ipuçları';

  @override
  String get changelog2Text =>
      'İlk seferde küçük bir pencere ders oluşturmanın, kelime yazmanın ve taramanın nasıl çalıştığını açıklar. “Bir daha gösterme” ile kaybolur.';

  @override
  String get changelog1Title => '📚 Her dilde dersler';

  @override
  String get changelog1Text =>
      'Kendi derslerini oluştur – İngilizce, Fransızca, Latince ya da ne öğreniyorsan – ve kelimeleri yaz veya kitaptan tara.';

  @override
  String intervalMinutes(int n) {
    return '$n dk';
  }

  @override
  String intervalHours(int n) {
    return '$n sa';
  }

  @override
  String intervalDays(int n) {
    return '$n g';
  }

  @override
  String intervalMonths(int n) {
    return '$n ay';
  }

  @override
  String intervalYears(String n) {
    return '$n yıl';
  }

  @override
  String get changelog7Title => '🌍 Artık 10 dilde';

  @override
  String get changelog7Text =>
      'Uygulama artık Almanca, İngilizce, İspanyolca, Fransızca, İtalyanca, Portekizce, Lehçe, Türkçe, Rusça ve Çince. Dili ayarlardan değiştirebilirsin.';

  @override
  String get appTitle => 'Kelime Öğren';
}
