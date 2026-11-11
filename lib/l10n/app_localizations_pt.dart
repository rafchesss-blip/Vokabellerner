// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonSave => 'Salvar';

  @override
  String get commonDelete => 'Excluir';

  @override
  String get commonEdit => 'Editar';

  @override
  String get commonNext => 'Avançar';

  @override
  String get commonBack => 'Voltar';

  @override
  String get commonDone => 'Pronto';

  @override
  String get commonOk => 'OK';

  @override
  String get commonClose => 'Fechar';

  @override
  String get commonLetsGo => 'Vamos lá';

  @override
  String get commonSkip => 'Pular';

  @override
  String get commonUndo => 'Desfazer';

  @override
  String get commonOptions => 'Opções';

  @override
  String get commonSettings => 'Configurações';

  @override
  String get commonHome => 'Ir para o início';

  @override
  String get languagePickerTitle => 'Idioma do app';

  @override
  String get languagePickerHint =>
      'Você pode mudar isso depois nas configurações.';

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get languageGerman => 'Alemão';

  @override
  String get languageEnglish => 'Inglês';

  @override
  String get languageSpanish => 'Espanhol';

  @override
  String get languageFrench => 'Francês';

  @override
  String get languageItalian => 'Italiano';

  @override
  String get languagePortuguese => 'Português';

  @override
  String get languagePolish => 'Polonês';

  @override
  String get languageTurkish => 'Turco';

  @override
  String get languageRussian => 'Russo';

  @override
  String get languageChinese => 'Chinês';

  @override
  String get languageLatin => 'Latim';

  @override
  String vocabCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count palavras',
      one: '1 palavra',
    );
    return '$_temp0';
  }

  @override
  String get lessonScreenManualHintTitle => 'Digitar palavras';

  @override
  String get lessonScreenManualHintText =>
      'Você recebe um campo para cada informação desta lição. Só a palavra e a tradução são obrigatórias. Depois, é só tocar em uma palavra para alterá-la.';

  @override
  String lessonScreenVocabAdded(String word) {
    return '“$word” adicionada.';
  }

  @override
  String lessonScreenVocabDeleted(String word) {
    return '“$word” excluída.';
  }

  @override
  String get lessonScreenScanHintTitle => 'Como funciona o escaneamento';

  @override
  String lessonScreenScanHintText(String columns) {
    return '1. Tire uma foto da lista de vocabulário – reta e bem legível.\n2. Escolha um app de IA. Ele abre com a foto e as instruções.\n3. Envie a mensagem.\n4. Copie a resposta e volte aqui – as palavras são reconhecidas automaticamente.\n\nSerá lido: $columns';
  }

  @override
  String get lessonScreenFreeAiHintTitle => 'De preferência, uma IA gratuita';

  @override
  String get lessonScreenFreeAiHintText =>
      'ChatGPT, Gemini e outros leem vocabulário com precisão também na versão gratuita – você não precisa de assinatura. As instruções para a IA são inseridas automaticamente.';

  @override
  String lessonScreenAiOpenFailed(String app) {
    return 'Não foi possível abrir o $app.';
  }

  @override
  String get lessonScreenNothingInClipboard =>
      'Nenhuma palavra na área de transferência. Copie a resposta inteira no app de IA e tente de novo.';

  @override
  String lessonScreenImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count palavras adicionadas. Toque em uma para corrigir.',
      one: '1 palavra adicionada. Toque nela para corrigir.',
    );
    return '$_temp0';
  }

  @override
  String lessonScreenDeleteLessonTitle(String name) {
    return 'Excluir “$name”?';
  }

  @override
  String get lessonScreenDeleteLessonText =>
      'A lição e todas as suas palavras serão excluídas – também das suas listas de prática.';

  @override
  String get lessonScreenMenuSettings => 'Configurar lição';

  @override
  String get lessonScreenMenuDelete => 'Excluir lição';

  @override
  String get lessonScreenEmpty => 'Ainda não há palavras nesta lição.';

  @override
  String get lessonScreenWaitingForAi => 'Esperando a resposta da IA …';

  @override
  String get lessonScreenWaitingHelp =>
      'No app de IA, copie a resposta (botão de copiar no bloco de texto) e volte aqui – as palavras serão reconhecidas automaticamente.';

  @override
  String get lessonScreenPasteAnswer => 'Colar resposta';

  @override
  String get lessonScreenAddTitle => 'Adicionar palavras';

  @override
  String get lessonScreenAddManually => 'Digitar';

  @override
  String get lessonScreenScan => 'Escanear';

  @override
  String get lessonScreenScanTip =>
      'Dica: com “Escanear” você tira uma foto da lista de vocabulário do seu livro. Um app de IA como ChatGPT ou Gemini lê tudo para você – sem precisar digitar.';

  @override
  String get lessonScreenTakePhoto => 'Tirar foto';

  @override
  String get lessonScreenPhotoFromGallery => 'Foto da galeria';

  @override
  String get lessonScreenWhichAi => 'Com qual IA?';

  @override
  String get lessonScreenNoAiInstalled =>
      'Ainda não há nenhum app de IA no seu celular. Instale um – é grátis – e depois toque de novo em “Escanear”.';

  @override
  String lessonScreenInstallApp(String app) {
    return 'Instalar $app';
  }

  @override
  String get lessonScreenFreeInPlayStore => 'grátis na Play Store';

  @override
  String get lessonScreenAiDisclaimer =>
      'O Vokabeltrainer não tem ligação com esses apps nem com seus fornecedores. Para eles vale a política de privacidade de cada um.';

  @override
  String lessonScreenRecognized(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count palavras reconhecidas',
      one: '1 palavra reconhecida',
    );
    return '$_temp0';
  }

  @override
  String lessonScreenDuplicatesSkipped(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count já estavam na lição e serão ignoradas.',
      one: '1 já estava na lição e será ignorada.',
    );
    return '$_temp0';
  }

  @override
  String lessonScreenImportButton(int count) {
    return 'Adicionar $count';
  }

  @override
  String get lessonSetupTitleNew => 'Nova lição';

  @override
  String get lessonSetupTitleEdit => 'Configurar lição';

  @override
  String get lessonSetupNameLabel => 'Nome da lição';

  @override
  String get lessonSetupNameHint => 'ex.: Unit 3 ou Lição 5';

  @override
  String get lessonSetupLanguageLabel => 'Idioma das palavras';

  @override
  String get lessonSetupTranslationLabel => 'Tradução para';

  @override
  String get lessonSetupFieldsTitle => 'O que vai ser preenchido?';

  @override
  String get lessonSetupFieldsHelp =>
      'Isso define a digitação, o escaneamento com IA e o teste.';

  @override
  String get lessonSetupWord => 'Palavra';

  @override
  String get lessonSetupTranslation => 'Tradução';

  @override
  String get lessonSetupAlwaysIncluded => 'sempre incluído';

  @override
  String get lessonSetupForms => 'Formas';

  @override
  String get lessonSetupFormsSubtitle =>
      'ex.: formas verbais, genitivo, gênero';

  @override
  String get lessonSetupWhichForms => 'Quais formas?';

  @override
  String get lessonSetupAllForms => 'Tudo';

  @override
  String get lessonSetupAllFormsHelp =>
      'Tudo o que o livro traz sobre a palavra: formas verbais, plural, gênero, comparação, caso e mais.';

  @override
  String get lessonSetupPickOneKind => 'Escolha pelo menos um tipo.';

  @override
  String get lessonSetupExtrasTitle => 'Outros (até 3)';

  @override
  String get lessonSetupExtrasHelp =>
      'Campos próprios, ex.: frase de exemplo ou dica de memorização.';

  @override
  String lessonSetupExtraFieldLabel(int number) {
    return 'Outro $number – nome';
  }

  @override
  String lessonSetupExtraDefaultName(int number) {
    return 'Outro $number';
  }

  @override
  String get lessonSetupRemove => 'Remover';

  @override
  String get lessonSetupExtraChip => 'Outro';

  @override
  String get lessonSetupSuggestionExample => 'Frase de exemplo';

  @override
  String get lessonSetupSuggestionMnemonic => 'Dica de memorização';

  @override
  String get lessonSetupSuggestionPronunciation => 'Pronúncia';

  @override
  String get lessonSetupSuggestionOpposite => 'Antônimo';

  @override
  String get lessonsTabNewLessonHintTitle => 'Nova lição';

  @override
  String get lessonsTabNewLessonHintText =>
      'Dê um nome à lição e escolha o idioma. Depois, defina o que você quer aprender: palavra e tradução estão sempre incluídas e, se quiser, também formas e até três campos próprios, como frase de exemplo ou dica de memorização.';

  @override
  String get lessonsTabEmptyTitle => 'Ainda não há lições';

  @override
  String get lessonsTabEmptyText =>
      'Crie sua primeira lição. Você mesmo digita as palavras – ou tira uma foto da página do seu livro e deixa um app de IA como ChatGPT ou Gemini ler para você.';

  @override
  String get lessonsTabNewLesson => 'Nova lição';

  @override
  String lessonsTabCardStats(int count, int known) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count palavras',
      one: '1 palavra',
    );
    return '$_temp0 · $known sabidas';
  }

  @override
  String get vocabFormDialogTitleNew => 'Nova palavra';

  @override
  String get vocabFormDialogTitleEdit => 'Editar palavra';

  @override
  String get vocabFormDialogWord => 'Palavra';

  @override
  String vocabFormDialogWordWithLanguage(String language) {
    return 'Palavra ($language)';
  }

  @override
  String vocabFormDialogTranslation(String language) {
    return 'Tradução ($language)';
  }

  @override
  String get vocabFormDialogForms => 'Formas';

  @override
  String get vocabFormDialogAllForms => 'todas as formas';

  @override
  String get introWelcomeTitle => 'Boas-vindas ao Vokabeltrainer';

  @override
  String get introWelcomeText =>
      'Aprenda vocabulário em qualquer idioma – com flashcards, testes e revisão inteligente. Cada palavra volta bem na hora em que você estaria prestes a esquecê-la.';

  @override
  String get introScanTitle => 'Digitar ou escanear';

  @override
  String get introScanText =>
      'Crie lições e digite as palavras. Ou tire uma foto da lista do seu livro: um app de IA como ChatGPT ou Gemini lê tudo para você.';

  @override
  String get introTestTitle => 'Pronto para a prova';

  @override
  String get introTestText =>
      'Informe a data da sua prova de vocabulário. O app distribui as palavras pelos dias anteriores e lembra você de estudar – nunca depois das 21h.';

  @override
  String get introPrivacyTitle => 'Tudo fica no seu celular';

  @override
  String get introPrivacyText =>
      'Sem conta, sem nuvem: suas lições e seu progresso não são salvos em nenhum lugar da internet. Só quando você escaneia, a foto vai para o app de IA que você mesmo escolhe.';

  @override
  String get introFreeTitle => 'Totalmente grátis';

  @override
  String get introFreeText =>
      'Eu não ganho nada com este app: sem anúncios, sem compras no app, sem assinatura. Ele existe só para você aprender.';

  @override
  String get privacyScreenTitle => 'Privacidade';

  @override
  String get nameDialogWelcome => 'Boas-vindas!';

  @override
  String get nameDialogTitle => 'Seu nome';

  @override
  String get nameDialogIntro =>
      'Qual é o seu nome? Assim o app cumprimenta você pelo nome – também nos lembretes. É opcional.';

  @override
  String get nameDialogLabel => 'Seu nome (opcional)';

  @override
  String get nameDialogLocalOnly => 'Seu nome fica salvo só neste celular.';

  @override
  String get hintDialogDontShowAgain => 'Não mostrar de novo';

  @override
  String get formKindVerbLabel => 'Formas verbais';

  @override
  String get formKindNounLabel => 'Formas do substantivo';

  @override
  String get formKindPluralLabel => 'Plural';

  @override
  String get formKindAdjectiveLabel => 'Formas do adjetivo';

  @override
  String get formKindComparisonLabel => 'Comparação';

  @override
  String get formKindGenderLabel => 'Gênero';

  @override
  String get formKindInflectionClassLabel => 'Declinação/Conjugação';

  @override
  String get formKindGovernmentLabel => 'Caso/Preposição';

  @override
  String get formKindWordClassLabel => 'Classe gramatical';

  @override
  String get formKindVerbExample =>
      'formas principais ou formas irregulares, ex.: vocō, vocāvī, vocātum ou go, went, gone';

  @override
  String get formKindNounExample => 'ex.: genitivo: lūnae';

  @override
  String get formKindPluralExample => 'ex.: mice, les chevaux';

  @override
  String get formKindAdjectiveExample =>
      'formas dos outros gêneros, ex.: bonus, -a, -um';

  @override
  String get formKindComparisonExample => 'ex.: good, better, best';

  @override
  String get formKindGenderExample =>
      'em substantivos, ex.: m, f, n ou der/die/das';

  @override
  String get formKindInflectionClassExample =>
      'ex.: 1ª declinação, conjugação em -e';

  @override
  String get formKindGovernmentExample =>
      'qual caso ou preposição vem depois, ex.: + dat., sich freuen über';

  @override
  String get formKindWordClassExample =>
      'ex.: verbo, substantivo, adjetivo, advérbio';

  @override
  String get vocabModelDefaultBoxName => 'Vocabulário';

  @override
  String get aiScanColumnWord => 'Palavra';

  @override
  String get aiScanColumnTranslation => 'Tradução';

  @override
  String get aiScanColumnForms => 'Formas';

  @override
  String get aiScanForeignLanguage => 'língua estrangeira';

  @override
  String aiScanPromptIntro(String language, String translationLanguage) {
    return 'Leia todas as palavras de vocabulário da foto (palavras em $language, tradução em $translationLanguage).';
  }

  @override
  String get aiScanPromptAnswerOnly =>
      'Responda SOMENTE com um único bloco de código exatamente neste formato, sem nenhum outro texto:';

  @override
  String get aiScanPromptRules => 'Regras:';

  @override
  String aiScanPromptRuleColumns(int count, String columns) {
    return 'Uma linha por palavra, colunas separadas por \" | \", sempre exatamente $count colunas nesta ordem: $columns.';
  }

  @override
  String aiScanPromptRuleNoHeader(String marker) {
    return 'Não inclua a linha com os nomes das colunas; a primeira linha é sempre $marker.';
  }

  @override
  String aiScanPromptRuleWord(String column) {
    return '$column: escrita como na foto, com todos os caracteres especiais e acentos.';
  }

  @override
  String aiScanPromptRuleTranslation(String column) {
    return '$column: como na foto; separe vários significados com vírgula.';
  }

  @override
  String aiScanPromptRuleAllForms(String column) {
    return '$column: TODAS as informações gramaticais que aparecem na foto junto à palavra – não omita nada. Por exemplo (mas não só):';
  }

  @override
  String get aiScanPromptRuleAllFormsMore =>
      'Tudo o mais que pertence à palavra (abreviações, observações entre parênteses) também vai aqui. Separe várias informações com vírgula.';

  @override
  String get aiScanPromptRuleAllFormsNone =>
      'Se não houver nenhuma informação na foto sobre a palavra, escreva \"-\".';

  @override
  String aiScanPromptRuleSomeForms(String column) {
    return '$column: só estas informações, várias separadas por vírgula:';
  }

  @override
  String aiScanPromptRuleOmit(String kinds) {
    return 'Omitir: $kinds.';
  }

  @override
  String get aiScanPromptRuleSomeFormsNone =>
      'Se uma palavra não tiver essas informações (ex.: um advérbio), escreva \"-\".';

  @override
  String aiScanPromptRuleExtra(String label) {
    return '$label: da foto; se não houver nada, escreva \"-\".';
  }

  @override
  String get aiScanPromptRuleMissing =>
      'Se faltar alguma informação, escreva \"-\". Não invente nada que não esteja na foto.';

  @override
  String get aiScanPromptRuleNoPipe => 'Não use \"|\" dentro de uma coluna.';

  @override
  String get settingsThemeDark => 'Modo escuro';

  @override
  String get settingsThemeLight => 'Modo claro';

  @override
  String get settingsThemeSystem => 'Sistema (automático)';

  @override
  String get settingsThemeDarkDesc => 'Fundo escuro com cores neon brilhantes.';

  @override
  String get settingsThemeLightDesc =>
      'Design claro e minimalista com tons de branco e cinza-claro.';

  @override
  String get settingsThemeSystemDesc => 'Segue a configuração do seu aparelho.';

  @override
  String get settingsAccentViolet => 'Violeta neon';

  @override
  String get settingsAccentCyan => 'Ciano neon';

  @override
  String get settingsAccentEmerald => 'Esmeralda neon';

  @override
  String get settingsAccentOrange => 'Laranja neon';

  @override
  String get settingsAccentPink => 'Rosa neon';

  @override
  String get settingsDirectionForward => 'Palavra → Tradução';

  @override
  String get settingsDirectionBackward => 'Tradução → Palavra';

  @override
  String get settingsDirectionForwardDesc =>
      'O app mostra a palavra, você responde o significado.';

  @override
  String get settingsDirectionBackwardDesc =>
      'O app mostra a tradução, você responde a palavra.';

  @override
  String get settingsAnswerTranslationOnly => 'Só tradução';

  @override
  String get settingsAnswerWordOnly => 'Só palavra';

  @override
  String get settingsAnswerFormsOnly => 'Só formas';

  @override
  String get settingsAnswerBoth => 'Ambos';

  @override
  String get settingsAnswerTranslationOnlyDesc =>
      'Você responde só a tradução.';

  @override
  String get settingsAnswerWordOnlyDesc => 'Você responde só a palavra.';

  @override
  String get settingsAnswerFormsOnlyDesc => 'Você responde só as formas.';

  @override
  String get settingsAnswerBothTranslationDesc =>
      'Você responde a tradução e as formas.';

  @override
  String get settingsAnswerBothWordDesc =>
      'Você responde a palavra e as formas.';

  @override
  String get settingsNameTitle => 'Seu nome';

  @override
  String get settingsNameEmpty => 'Não informado – salvo só neste celular';

  @override
  String settingsNameSaved(String name) {
    return '$name · salvo só neste celular';
  }

  @override
  String get settingsDesignTitle => 'Visual';

  @override
  String get settingsAccentTitle => 'Cor de destaque (neon)';

  @override
  String get settingsAccentHint =>
      'A cor de destaque vale para botões, chaves e destaques. No modo escuro as cores brilham; no modo claro elas ficam automaticamente um pouco mais escuras para que tudo continue bem legível.';

  @override
  String get settingsDirectionTitle => 'Direção do idioma';

  @override
  String get settingsAnswerModeTitle => 'O que é perguntado no teste';

  @override
  String get settingsAskExtrasTitle => 'Perguntar também os outros campos';

  @override
  String get settingsAskExtrasSubtitle =>
      'ex.: frase de exemplo ou dica de memorização – se a palavra tiver.';

  @override
  String get settingsFormsHint =>
      'Formas são, por exemplo, formas verbais, genitivo ou gênero. Se uma palavra não tiver formas, só a tradução é perguntada automaticamente. Esta opção vale para o modo teste.';

  @override
  String get settingsAboutTitle => 'Sobre o app';

  @override
  String get settingsShowIntro => 'Ver introdução';

  @override
  String get settingsPrivacyTitle => 'Privacidade';

  @override
  String get settingsPrivacySubtitle => 'Tudo fica no seu celular';

  @override
  String get settingsLicensesTitle => 'Licenças';

  @override
  String get settingsLicensesSubtitle => 'Software utilizado';

  @override
  String get settingsLicensesLegalese =>
      'Grátis, sem anúncios e sem compras no app.';

  @override
  String get backupExported => 'O backup está sendo baixado.';

  @override
  String get backupCopied =>
      'Backup copiado para a área de transferência – cole, por exemplo, em uma nota.';

  @override
  String get backupRestoreTitle => 'Restaurar backup?';

  @override
  String get backupRestoreMessage =>
      'Seu progresso atual e suas listas de prática serão substituídos pelo backup.';

  @override
  String get backupRestoreAction => 'Restaurar';

  @override
  String get backupRestored => 'Backup restaurado. ✅';

  @override
  String get backupResetTitle => 'Zerar o progresso?';

  @override
  String get backupResetMessage =>
      'Todos os níveis de aprendizado e datas de revisão serão apagados. As lições e listas de prática continuam.';

  @override
  String get backupResetAction => 'Zerar';

  @override
  String get backupResetDone => 'Progresso zerado.';

  @override
  String get backupPasteTitle => 'Colar backup';

  @override
  String get backupTitle => 'Dados e backup';

  @override
  String get backupHint =>
      'Seu progresso fica salvo só neste aparelho. Faça um backup de vez em quando – assim você também pode passar tudo para outro aparelho.';

  @override
  String get backupExportTitle => 'Exportar backup';

  @override
  String get backupExportFile => 'Baixar como arquivo';

  @override
  String get backupExportClipboard => 'Copiar para a área de transferência';

  @override
  String get backupImportTitle => 'Importar backup';

  @override
  String get backupImportFile => 'Escolher arquivo de backup';

  @override
  String get backupImportPaste => 'Colar texto do backup';

  @override
  String get backupResetTile => 'Zerar o progresso';

  @override
  String get storeBackupInvalid => 'Este não é um arquivo de backup válido.';

  @override
  String get storeBackupCorrupt => 'O arquivo de backup está corrompido.';

  @override
  String get notifSectionBlocked =>
      'As notificações estão bloqueadas. Permita-as nas configurações do Android para o Vokabeltrainer.';

  @override
  String get notifSectionTitle => 'Lembretes';

  @override
  String get notifSectionAndroidOnly =>
      '📱 Lembretes de verdade só no app para Android: várias vezes ao dia, com números atualizados e nunca depois das 21h.';

  @override
  String get notifSectionSwitchTitle => 'Lembretes de estudo';

  @override
  String get notifSectionSwitchSubtitle =>
      'Com números atualizados – nunca depois das 21h. Se você já estudou tudo hoje, fica tudo em silêncio.';

  @override
  String get notifSectionHowOften => 'Quantas vezes por dia?';

  @override
  String notifSectionTimes(String times) {
    return 'às $times';
  }

  @override
  String get notifSectionSendTest => 'Enviar notificação de teste';

  @override
  String get notifChannelName => 'Lembretes de estudo';

  @override
  String get notifChannelDescription =>
      'Lembra você de estudar vocabulário (nunca depois das 21h).';

  @override
  String get notifTestTitle => '👋 Oi! Seus lembretes vão ficar assim';

  @override
  String get notifTestBody =>
      'Eu aviso quando tiver palavras esperando por você – nunca depois das 21h.';

  @override
  String notifFirst1Title(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '🧠 $n palavras estão esperando por você',
      one: '🧠 1 palavra está esperando por você',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst1Body => 'Alguns minutinhos bastam – vamos lá!';

  @override
  String get notifFirst2Title => '⚔️ As palavras estão atacando!';

  @override
  String notifFirst2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n delas querem ser derrotadas hoje.',
      one: '1 delas quer ser derrotada hoje.',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst3Title => '🕵️ Missão secreta de hoje';

  @override
  String notifFirst3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Decifrar $n palavras. Topa?',
      one: 'Decifrar 1 palavra. Topa?',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst4Title => '📚 Suas palavras estão chamando!';

  @override
  String notifFirst4Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Hoje tem $n palavras no plano.',
      one: 'Hoje tem 1 palavra no plano.',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst5Title => '🎯 Missão do dia';

  @override
  String notifFirst5Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Desvendar $n palavras – você consegue todas?',
      one: 'Desvendar 1 palavra – você consegue?',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst6Title => '🦉 A coruja do estudo está com fome';

  @override
  String notifFirst6Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Alimente ela com $n palavras!',
      one: 'Alimente ela com 1 palavra!',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst7Title => '🎲 Uma apostinha?';

  @override
  String notifFirst7Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Aposto que você aprende as $n palavras em 5 minutos.',
      one: 'Aposto que você aprende essa palavra em 5 minutos.',
    );
    return '$_temp0';
  }

  @override
  String notifNamed1Title(String name) {
    return '👋 Oi, $name!';
  }

  @override
  String notifNamed1Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n palavras estão esperando por você hoje.',
      one: '1 palavra está esperando por você hoje.',
    );
    return '$_temp0';
  }

  @override
  String notifNamed2Title(String name) {
    return '🎯 $name, sua missão de hoje';
  }

  @override
  String notifNamed2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Desvendar $n palavras – vamos lá!',
      one: 'Desvendar 1 palavra – vamos lá!',
    );
    return '$_temp0';
  }

  @override
  String notifNamed3Title(String name) {
    return '🧠 $name, uma estudadinha?';
  }

  @override
  String notifNamed3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Hoje tem $n palavras no plano.',
      one: 'Hoje tem 1 palavra no plano.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle1Title => '⏰ Psiu… suas palavras ainda estão esperando';

  @override
  String notifMiddle1Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Ainda faltam $n hoje.',
      one: 'Ainda falta 1 hoje.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle2Title => '🐢 As palavras estão ficando impacientes';

  @override
  String notifMiddle2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Ainda faltam $n – só uns minutinhos!',
      one: 'Ainda falta 1 – só uns minutinhos!',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle3Title =>
      '💬 Seus cartões perguntam por onde você anda';

  @override
  String notifMiddle3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Ainda sobraram $n palavras.',
      one: 'Ainda sobrou 1 palavra.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle4Title => '🧩 Quase esqueceu?';

  @override
  String notifMiddle4Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n palavras ainda querem ser revisadas hoje.',
      one: '1 palavra ainda quer ser revisada hoje.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle5Title => '🚀 Que tal um gás rapidinho?';

  @override
  String notifMiddle5Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n cartões e pronto, você fica livre.',
      one: '1 cartão e pronto, você fica livre.',
    );
    return '$_temp0';
  }

  @override
  String get notifLast1Title => '🌙 Última chance de hoje!';

  @override
  String notifLast1Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Só mais $n palavras – depois é descanso.',
      one: 'Só mais 1 palavra – depois é descanso.',
    );
    return '$_temp0';
  }

  @override
  String get notifLast2Title => '⌛ O dia está quase acabando';

  @override
  String notifLast2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n palavras e você termina por hoje.',
      one: '1 palavra e você termina por hoje.',
    );
    return '$_temp0';
  }

  @override
  String get notifLast3Title => '🛡️ Reta final de hoje';

  @override
  String notifLast3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Só mais $n palavras até o descanso.',
      one: 'Só mais 1 palavra até o descanso.',
    );
    return '$_temp0';
  }

  @override
  String notifStreakTitle(int streak) {
    return '🔥 Sua sequência de $streak dias está em perigo!';
  }

  @override
  String notifStreakTitleNamed(String name, int streak) {
    return '🔥 $name, sua sequência de $streak dias está em perigo!';
  }

  @override
  String notifStreakBody(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Só mais $n palavras – estude hoje para não perder a sequência.',
      one: 'Só mais 1 palavra – estude hoje para não perder a sequência.',
    );
    return '$_temp0';
  }

  @override
  String notifExamTomorrowTitle(String list) {
    return '🚨 Amanhã é “$list”!';
  }

  @override
  String notifExamTomorrowBodyLast(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Última chance: revise mais $n palavras!',
      one: 'Última chance: revise mais 1 palavra!',
    );
    return '$_temp0';
  }

  @override
  String notifExamTomorrowBody(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Hoje é o último dia de estudo – $n palavras estão esperando.',
      one: 'Hoje é o último dia de estudo – 1 palavra está esperando.',
    );
    return '$_temp0';
  }

  @override
  String notifExamSoonTitle(int days, String list) {
    return '⚡ Faltam $days dias para “$list”';
  }

  @override
  String notifExamSoonBody(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Reta final! Hoje é a vez de $n palavras.',
      one: 'Reta final! Hoje é a vez de 1 palavra.',
    );
    return '$_temp0';
  }

  @override
  String notifExamDayTitle(String list) {
    return '🍀 Hoje é “$list”!';
  }

  @override
  String get notifExamDayBody =>
      'Você praticou – agora mostre o que sabe. Boa sorte! 💪';

  @override
  String get analyseEmptyTitle => 'Ainda não há listas de prática';

  @override
  String get analyseEmptyText =>
      'Crie uma lista de prática para ver seu progresso aqui.';

  @override
  String analyseSummary(int total, int good, int neutral, int weak) {
    String _temp0 = intl.Intl.pluralLogic(
      total,
      locale: localeName,
      other: '$total palavras',
      one: '1 palavra',
    );
    return '$_temp0 · $good boas · $neutral neutras · $weak fracas';
  }

  @override
  String analyseGoalUntil(String date) {
    return 'Meta até $date';
  }

  @override
  String get analyseOverallGoal => 'Meta geral';

  @override
  String analyseKnown(int known, int total) {
    return '$known/$total palavras sabidas';
  }

  @override
  String get analyseDailyGoal => 'Meta diária';

  @override
  String get analyseAllDone => 'tudo feito';

  @override
  String analyseLearnedToday(int learned, int target) {
    return '$learned/$target estudadas hoje';
  }

  @override
  String get analyseAllKnown => 'Você sabe todas as palavras! 🎉';

  @override
  String analyseRemaining(int days, int remaining) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Faltam $days dias',
      one: 'Falta 1 dia',
    );
    String _temp1 = intl.Intl.pluralLogic(
      remaining,
      locale: localeName,
      other: '$remaining palavras pendentes',
      one: '1 palavra pendente',
    );
    return '$_temp0 · $_temp1.';
  }

  @override
  String get vocabDetailNeverPracticed => 'Nunca praticada';

  @override
  String vocabDetailMemoryDue(int percent, int reps) {
    return 'Memória: $percent % · revisar agora · praticada $reps×';
  }

  @override
  String vocabDetailMemoryNext(int percent, String interval, int reps) {
    return 'Memória: $percent % · de novo em $interval · praticada $reps×';
  }

  @override
  String get vocabDetailNoHistory => 'Ainda não há histórico.';

  @override
  String get vocabDetailWorse => 'Pior';

  @override
  String get vocabDetailBetter => 'Melhor';

  @override
  String get levelVeryGood => 'Muito bom';

  @override
  String get levelGood => 'Bom';

  @override
  String get levelQuiteGood => 'Bem bom';

  @override
  String get levelOkay => 'Razoável';

  @override
  String get levelSlightlyGood => 'Um pouco bom';

  @override
  String get levelNeutral => 'Neutro';

  @override
  String get levelSlightlyWeak => 'Um pouco fraco';

  @override
  String get levelWeak => 'Fraco';

  @override
  String get levelQuiteWeak => 'Bem fraco';

  @override
  String get levelBad => 'Ruim';

  @override
  String get levelVeryBad => 'Muito ruim';

  @override
  String get tutorialTitle => 'Como o app funciona';

  @override
  String get tutorialPage1Title => 'Como o Vokabeltrainer funciona';

  @override
  String get tutorialPage1Text =>
      'Este app ajuda você a aprender vocabulário em qualquer idioma – com flashcards, testes e revisão inteligente. Deslize para a esquerda ou toque em “Avançar” para conhecer tudo.';

  @override
  String get tutorialPage2Title => 'Criar uma lição';

  @override
  String get tutorialPage2Text =>
      'Na aba “Lições” você cria uma lição: nome, idioma e o que você quer aprender – palavra e tradução e, se quiser, formas e até três campos próprios, como frase de exemplo ou dica de memorização.';

  @override
  String get tutorialPage3Title => 'Escanear palavras';

  @override
  String get tutorialPage3Text =>
      'Digite as palavras você mesmo – ou toque em “Escanear” e tire uma foto da lista do seu livro. Um app de IA como ChatGPT ou Gemini lê tudo. Copie a resposta, volte aqui e pronto.';

  @override
  String get tutorialPage4Title => 'Criar listas de prática';

  @override
  String get tutorialPage4Text =>
      'Na tela inicial, toque em “Listas de prática” e depois em “Nova lista”. Dê um nome à lista, se quiser a data da sua prova de vocabulário, e escolha as palavras das suas lições.';

  @override
  String get tutorialPage5Title => 'Estudar todo dia';

  @override
  String get tutorialPage5Text =>
      'Na tela inicial, em “Hoje”, aparece o que está na vez nas suas listas: primeiro as revisões pendentes, e mais até 15 palavras novas. Toque em “Vamos lá” para começar.';

  @override
  String get tutorialPage6Title => 'Flashcards';

  @override
  String get tutorialPage6Text =>
      'Toque no cartão para virá-lo e avalie-se com sinceridade: “De novo”, “Difícil”, “Bom” ou “Fácil”. Embaixo de cada botão aparece quando o cartão volta. No PC: barra de espaço para virar, 1–4 para avaliar.';

  @override
  String get tutorialPage7Title => 'Revisar com inteligência';

  @override
  String get tutorialPage7Text =>
      'O app pergunta cada palavra bem na hora em que você estaria prestes a esquecê-la (repetição espaçada com FSRS, como no Anki). Palavras que você sabe bem voltam menos, as difíceis voltam mais. Estude um pouquinho todo dia – isso mantém viva a sua 🔥 sequência de estudos.';

  @override
  String get tutorialPage8Title => 'De olho na prova';

  @override
  String get tutorialPage8Text =>
      'Ao criar uma lista, informe a data da sua prova. O app distribui as palavras novas pelos dias para que você termine na VÉSPERA da prova – nesse dia tudo é revisado mais uma vez. Quanto mais perto da prova, mais vezes as palavras aparecem.';

  @override
  String get tutorialPage9Title => 'Lembretes';

  @override
  String get tutorialPage9Text =>
      'O app lembra você até 3 vezes por dia – com os números atualizados e nunca depois das 21h. Se você já estudou tudo hoje, fica tudo em silêncio. Você pode ajustar isso em Configurações → Lembretes.';

  @override
  String get tutorialPage10Title => 'Modo teste';

  @override
  String get tutorialPage10Text =>
      'Aqui você mesmo digita a tradução e/ou as formas – e, se quiser, também os campos próprios (Configurações). Na correção, maiúsculas/minúsculas e artigos (o/a/os/as) não importam.';

  @override
  String get tutorialPage11Title => 'Ver seu progresso';

  @override
  String get tutorialPage11Text =>
      'Na aba “Análise” você vê cada palavra com seu nível: 5 tons de verde (bom), cinza (neutro) e 5 tons de vermelho (fraco). Toque em uma palavra para ver o gráfico do histórico e para melhorar ou piorar o nível manualmente com +/−.';

  @override
  String get tutorialPage12Title => 'Seus dados';

  @override
  String get tutorialPage12Text =>
      'Tudo fica salvo só neste aparelho – sem conta, sem internet. Faça um backup nas configurações de vez em quando. Assim você também pode passar tudo para outro aparelho.';

  @override
  String get dashboardGreetingNight => 'Ainda acordado? 🌙';

  @override
  String dashboardGreetingNightName(String name) {
    return 'Ainda acordado, $name? 🌙';
  }

  @override
  String get dashboardGreetingMorning => 'Bom dia! ☀️';

  @override
  String dashboardGreetingMorningName(String name) {
    return 'Bom dia, $name! ☀️';
  }

  @override
  String get dashboardGreetingDay => 'Oi! 👋';

  @override
  String dashboardGreetingDayName(String name) {
    return 'Oi, $name! 👋';
  }

  @override
  String get dashboardGreetingEvening => 'Boa noite! 🌆';

  @override
  String dashboardGreetingEveningName(String name) {
    return 'Boa noite, $name! 🌆';
  }

  @override
  String dashboardStreakLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'dias seguidos',
      one: 'dia seguido',
    );
    return '$_temp0';
  }

  @override
  String get dashboardPracticedToday => 'praticadas hoje';

  @override
  String dashboardKnownOf(int total) {
    return 'de $total sabidas';
  }

  @override
  String get dashboardPracticeLists => 'Listas de prática';

  @override
  String get dashboardPracticeListsEmpty => 'Junte palavras para uma prova';

  @override
  String dashboardListCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count listas',
      one: '1 lista',
    );
    return '$_temp0';
  }

  @override
  String get dashboardHelpTitle => 'Ajuda e tutorial';

  @override
  String get dashboardHelpSubtitle => 'Como o Vokabeltrainer funciona';

  @override
  String get dashboardStreakNone => 'Comece hoje sua sequência de estudos!';

  @override
  String get dashboardStreakFirstDay =>
      'Dia 1 da sua sequência – continue assim!';

  @override
  String dashboardStreakRun(int count) {
    return '🔥 $count dias seguidos de estudo!';
  }

  @override
  String get dashboardGetStarted => 'Comece já!';

  @override
  String get dashboardNoListsHint =>
      'Crie agora uma lista de prática: dê um nome a ela e escolha as palavras que você quer aprender.';

  @override
  String get dashboardNoLessonsHint =>
      'Primeiro crie uma lição. Você mesmo digita as palavras ou escaneia do seu livro com um app de IA.';

  @override
  String get dashboardCreateList => 'Criar lista de prática';

  @override
  String get dashboardCreateLesson => 'Criar lição';

  @override
  String get dashboardAllDone => 'Tudo feito por hoje!';

  @override
  String get dashboardToday => 'Hoje';

  @override
  String dashboardDoneReviewed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Você respondeu $count perguntas hoje. Amanhã tem mais!',
      one: 'Você respondeu 1 pergunta hoje. Amanhã tem mais!',
    );
    return '$_temp0';
  }

  @override
  String get dashboardNothingDue => 'Nada para revisar agora. Volte amanhã!';

  @override
  String get dashboardDueLabel => 'revisar';

  @override
  String get dashboardNewLabel => 'novas';

  @override
  String get dashboardFromLists => 'Das suas listas de prática';

  @override
  String dashboardExamToday(String name) {
    return 'Hoje é “$name”!';
  }

  @override
  String get dashboardExamTodayText =>
      'Você praticou – agora mostre o que sabe. Boa sorte!';

  @override
  String dashboardExamTomorrow(String name) {
    return 'Amanhã é “$name”!';
  }

  @override
  String get dashboardExamTomorrowText =>
      'Hoje é o último dia de estudo – tudo é revisado mais uma vez.';

  @override
  String dashboardExamInDays(String name, int days) {
    return '“$name” em $days dias';
  }

  @override
  String dashboardExamFinalSpurt(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Reta final! Faltam $count dias de estudo – cada um conta.',
      one: 'Reta final! Falta 1 dia de estudo – cada um conta.',
    );
    return '$_temp0';
  }

  @override
  String dashboardExamDaysLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Faltam $count dias de estudo. O app distribui as palavras para você terminar a tempo.',
      one:
          'Falta 1 dia de estudo. O app distribui as palavras para você terminar a tempo.',
    );
    return '$_temp0';
  }

  @override
  String get practiceListsNeedLesson =>
      'Primeiro crie em “Lições” uma lição com palavras.';

  @override
  String practiceListsLimit(int max) {
    return 'Limite atingido: você pode ter no máximo $max listas ao mesmo tempo.';
  }

  @override
  String get practiceListsCountdownPast => ' · passou ✅';

  @override
  String get practiceListsCountdownToday => ' · hoje! 🍀';

  @override
  String get practiceListsCountdownTomorrow => ' · amanhã!';

  @override
  String practiceListsCountdownDays(int days) {
    return ' · faltam $days dias';
  }

  @override
  String get practiceListsDueDateTitle => 'Quando é a prova de vocabulário?';

  @override
  String get practiceListsChangeDueDate => 'Mudar data da prova';

  @override
  String get practiceListsDueDateHint =>
      'Opcional. O app distribui as palavras para que você saiba tudo até a véspera da prova – no dia da prova você não precisa mais praticar.';

  @override
  String get practiceListsPickDate => 'Escolher data';

  @override
  String get practiceListsRemoveDate => 'Remover';

  @override
  String practiceListsNotifyOnSnack(String name) {
    return 'Lembretes para “$name” ativados.';
  }

  @override
  String practiceListsNotifyOffSnack(String name) {
    return 'Sem lembretes para “$name”.';
  }

  @override
  String practiceListsDeleteTitle(String name) {
    return 'Excluir “$name”?';
  }

  @override
  String get practiceListsDeleteText => 'A lista de prática será removida.';

  @override
  String get practiceListsNoVocabs => 'Esta lista não tem palavras.';

  @override
  String get practiceListsTitle => 'Suas listas de prática';

  @override
  String get practiceListsNew => 'Nova lista';

  @override
  String get practiceListsEmptyTitle => 'Ainda não há listas de prática';

  @override
  String get practiceListsEmptyText =>
      'Crie sua primeira lista com o botão abaixo.';

  @override
  String practiceListsSubtitleTest(String vocabs, String date) {
    return '$vocabs · Prova: $date';
  }

  @override
  String get practiceListsNotifyDisable => 'Desativar lembretes';

  @override
  String get practiceListsNotifyEnable => 'Ativar lembretes';

  @override
  String get practiceListsNameDialogTitle => 'Nova lista de prática';

  @override
  String get practiceListsNameLabel => 'Nome da lista';

  @override
  String get practiceListsNameHint => 'ex.: Prova de vocabulário 1';

  @override
  String get practiceNothingDue =>
      'Nada mais para revisar hoje – show! 😎 Escolha “Todas” se quiser praticar mesmo assim.';

  @override
  String get practiceNoWeak => 'Nenhuma palavra fraca. 😎';

  @override
  String get practiceTitle => 'Escolher modo';

  @override
  String practiceSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count palavras selecionadas',
      one: '1 palavra selecionada',
    );
    return '$_temp0';
  }

  @override
  String get practiceModeFlashcards => 'Flashcards';

  @override
  String get practiceModeTest => 'Teste';

  @override
  String get practiceWhichVocabs => 'Quais palavras?';

  @override
  String get practiceFilterSmart => 'Pendentes e novas';

  @override
  String get practiceFilterAll => 'Todas';

  @override
  String get practiceFilterWeak => 'Fracas';

  @override
  String practicePlanSummary(int due, int fresh) {
    return '$due pendentes · $fresh novas';
  }

  @override
  String practicePlanSummaryLater(int due, int fresh, int later) {
    return '$due pendentes · $fresh novas ($later mais depois)';
  }

  @override
  String get practiceFlashcardsHint =>
      'Uma palavra aparece. Você revela o significado e se avalia: De novo, Difícil, Bom ou Fácil.';

  @override
  String get practiceTestHint =>
      'Uma palavra aparece. Você mesmo digita a tradução e as formas.';

  @override
  String get practiceSmartHint =>
      '“Pendentes e novas” usa repetição espaçada (FSRS): cada palavra volta bem na hora em que você estaria prestes a esquecê-la. Se a lista tiver data de prova, as palavras novas são distribuídas pelos dias até a véspera, e antes tudo é revisado mais uma vez.';

  @override
  String get practiceStart => 'Começar';

  @override
  String get flashcardWord => 'Palavra';

  @override
  String get flashcardTranslation => 'Tradução';

  @override
  String flashcardTitle(int current, int total) {
    return 'Cartão $current / $total';
  }

  @override
  String get flashcardTapToFlip => 'Toque para virar';

  @override
  String get flashcardFlip => 'Virar';

  @override
  String get flashcardRateAgain => 'De novo';

  @override
  String get flashcardRateHard => 'Difícil';

  @override
  String get flashcardRateGood => 'Bom';

  @override
  String get flashcardRateEasy => 'Fácil';

  @override
  String testTranslationLabel(String language) {
    return 'Tradução ($language)';
  }

  @override
  String get testWordLabel => 'Palavra';

  @override
  String testWordLabelWithLanguage(String language) {
    return 'Palavra ($language)';
  }

  @override
  String get testFormsLabel => 'Formas';

  @override
  String testTitle(int current, int total) {
    return 'Teste $current / $total';
  }

  @override
  String get testTranslate => 'Traduza:';

  @override
  String testCorrectAnswer(String answer) {
    return 'Certo: $answer';
  }

  @override
  String get testWrong => 'Errado';

  @override
  String get testResultCorrect => 'Certo! 🎉';

  @override
  String get testResultWrong => 'Que pena, errado.';

  @override
  String get testCheck => 'Verificar';

  @override
  String get selectionColumnWord => 'Palavra';

  @override
  String get selectionColumnForms => 'Formas';

  @override
  String get selectionColumnTranslation => 'Tradução';

  @override
  String get selectionTitle => 'Escolher palavras';

  @override
  String get selectionMenuTooltip => 'Seleção';

  @override
  String get selectionSelectAll => 'Selecionar todas';

  @override
  String get selectionClear => 'Limpar seleção';

  @override
  String selectionConfirm(String label, String vocabs) {
    return '$label ($vocabs)';
  }

  @override
  String get homeTabStart => 'Início';

  @override
  String get homeTabLessons => 'Lições';

  @override
  String get homeTabAnalysis => 'Análise';

  @override
  String get sessionSummaryExcellent => 'Excelente!';

  @override
  String get sessionSummaryGreat => 'Mandou muito bem!';

  @override
  String get sessionSummaryGood => 'Boa prática!';

  @override
  String get sessionSummaryKeepGoing => 'Não desista!';

  @override
  String sessionSummaryScore(int correct, int total) {
    return '$correct de $total certas na primeira tentativa.';
  }

  @override
  String get sessionSummaryScheduled =>
      'O app planeja automaticamente quando cada palavra volta.';

  @override
  String get sessionSummaryRestart => 'De novo';

  @override
  String get changelogTitle => 'O que há de novo?';

  @override
  String get changelogGotIt => 'Entendi!';

  @override
  String get changelog6Title => '🔒 Privacidade num piscar de olhos';

  @override
  String get changelog6Text =>
      'Em Configurações → “Sobre o app” você encontra a política de privacidade e a introdução para reler: tudo fica no seu celular, e o app não tem anúncios nem compras.';

  @override
  String get changelog5Title => '🤖 Escanear só com apps de IA';

  @override
  String get changelog5Text =>
      'Ao escanear, agora só aparecem apps de IA como ChatGPT ou Gemini para escolher. As instruções para a IA já vão junto.';

  @override
  String get changelog4Title => '🧩 Mais formas';

  @override
  String get changelog4Text =>
      'Novas formas: plural, comparação, caso/preposição, declinação/conjugação e classe gramatical. Com “Tudo”, a IA pega realmente tudo o que o livro traz sobre a palavra.';

  @override
  String get changelog3Title => '👋 Com o seu nome';

  @override
  String get changelog3Text =>
      'Se quiser, o app cumprimenta você pelo nome – também nos lembretes. Você pode mudá-lo nas configurações.';

  @override
  String get changelog2Title => '💡 Dicas rápidas';

  @override
  String get changelog2Text =>
      'Na primeira vez, uma janelinha explica como criar uma lição, digitar e escanear. Com “Não mostrar de novo” ela some.';

  @override
  String get changelog1Title => '📚 Lições em qualquer idioma';

  @override
  String get changelog1Text =>
      'Crie suas próprias lições – inglês, francês, latim ou o que você estiver aprendendo – e digite as palavras ou escaneie do livro.';

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
    return '$n m';
  }

  @override
  String intervalYears(String n) {
    return '$n a';
  }

  @override
  String get changelog7Title => '🌍 Agora em 10 idiomas';

  @override
  String get changelog7Text =>
      'O app agora está em alemão, inglês, espanhol, francês, italiano, português, polonês, turco, russo e chinês. Você pode mudar o idioma nas configurações.';
}
