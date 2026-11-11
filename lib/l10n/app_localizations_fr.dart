// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get commonCancel => 'Annuler';

  @override
  String get commonSave => 'Enregistrer';

  @override
  String get commonDelete => 'Supprimer';

  @override
  String get commonEdit => 'Modifier';

  @override
  String get commonNext => 'Suivant';

  @override
  String get commonBack => 'Retour';

  @override
  String get commonDone => 'Terminé';

  @override
  String get commonOk => 'OK';

  @override
  String get commonClose => 'Fermer';

  @override
  String get commonLetsGo => 'C\'est parti';

  @override
  String get commonSkip => 'Passer';

  @override
  String get commonUndo => 'Annuler';

  @override
  String get commonOptions => 'Options';

  @override
  String get commonSettings => 'Paramètres';

  @override
  String get commonHome => 'Vers l\'accueil';

  @override
  String get languagePickerTitle => 'Langue de l\'appli';

  @override
  String get languagePickerHint =>
      'Tu pourras la changer plus tard dans les paramètres.';

  @override
  String get settingsLanguage => 'Langue';

  @override
  String get languageGerman => 'Allemand';

  @override
  String get languageEnglish => 'Anglais';

  @override
  String get languageSpanish => 'Espagnol';

  @override
  String get languageFrench => 'Français';

  @override
  String get languageItalian => 'Italien';

  @override
  String get languagePortuguese => 'Portugais';

  @override
  String get languagePolish => 'Polonais';

  @override
  String get languageTurkish => 'Turc';

  @override
  String get languageRussian => 'Russe';

  @override
  String get languageChinese => 'Chinois';

  @override
  String get languageLatin => 'Latin';

  @override
  String vocabCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mots',
      one: '$count mot',
    );
    return '$_temp0';
  }

  @override
  String get lessonScreenManualHintTitle => 'Saisir les mots';

  @override
  String get lessonScreenManualHintText =>
      'Tu as un champ pour chaque info de cette leçon. Seuls le mot et la traduction sont obligatoires. Plus tard, tu peux toucher un mot pour le modifier.';

  @override
  String lessonScreenVocabAdded(String word) {
    return '« $word » ajouté.';
  }

  @override
  String lessonScreenVocabDeleted(String word) {
    return '« $word » supprimé.';
  }

  @override
  String get lessonScreenScanHintTitle => 'Comment scanner';

  @override
  String lessonScreenScanHintText(String columns) {
    return '1. Prends la liste de vocabulaire en photo – bien droite et lisible.\n2. Choisis une appli d\'IA. Elle s\'ouvre avec la photo et les instructions.\n3. Envoie le message.\n4. Copie la réponse et reviens ici – les mots sont reconnus automatiquement.\n\nCe qui est lu : $columns';
  }

  @override
  String get lessonScreenFreeAiHintTitle => 'Le mieux : une IA gratuite';

  @override
  String get lessonScreenFreeAiHintText =>
      'ChatGPT, Gemini et compagnie lisent le vocabulaire de façon fiable, même en version gratuite – pas besoin d\'abonnement. Les instructions pour l\'IA sont ajoutées automatiquement.';

  @override
  String lessonScreenAiOpenFailed(String app) {
    return 'Impossible d\'ouvrir $app.';
  }

  @override
  String get lessonScreenNothingInClipboard =>
      'Aucun mot dans le presse-papiers. Copie toute la réponse dans l\'appli d\'IA et réessaie.';

  @override
  String lessonScreenImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mots ajoutés. Touches-en un pour le corriger.',
      one: '1 mot ajouté. Touche-le pour le corriger.',
    );
    return '$_temp0';
  }

  @override
  String lessonScreenDeleteLessonTitle(String name) {
    return 'Supprimer « $name » ?';
  }

  @override
  String get lessonScreenDeleteLessonText =>
      'La leçon et tous ses mots seront supprimés – aussi de tes listes d\'entraînement.';

  @override
  String get lessonScreenMenuSettings => 'Régler la leçon';

  @override
  String get lessonScreenMenuDelete => 'Supprimer la leçon';

  @override
  String get lessonScreenEmpty => 'Pas encore de mots dans cette leçon.';

  @override
  String get lessonScreenWaitingForAi => 'En attente de la réponse de l\'IA …';

  @override
  String get lessonScreenWaitingHelp =>
      'Dans l\'appli d\'IA, copie la réponse (bouton Copier sur le bloc de texte) et reviens ici – les mots seront reconnus automatiquement.';

  @override
  String get lessonScreenPasteAnswer => 'Coller la réponse';

  @override
  String get lessonScreenAddTitle => 'Ajouter des mots';

  @override
  String get lessonScreenAddManually => 'Saisir moi-même';

  @override
  String get lessonScreenScan => 'Scanner';

  @override
  String get lessonScreenScanTip =>
      'Astuce : avec « Scanner », tu prends en photo la liste de vocabulaire de ton livre. Une appli d\'IA comme ChatGPT ou Gemini la lit pour toi – pas besoin de tout taper.';

  @override
  String get lessonScreenTakePhoto => 'Prendre une photo';

  @override
  String get lessonScreenPhotoFromGallery => 'Photo de la galerie';

  @override
  String get lessonScreenWhichAi => 'Avec quelle IA ?';

  @override
  String get lessonScreenNoAiInstalled =>
      'Il n\'y a pas encore d\'appli d\'IA sur ton téléphone. Installes-en une – c\'est gratuit – puis touche à nouveau « Scanner ».';

  @override
  String lessonScreenInstallApp(String app) {
    return 'Installer $app';
  }

  @override
  String get lessonScreenFreeInPlayStore => 'gratuit sur le Play Store';

  @override
  String get lessonScreenAiDisclaimer =>
      'Vokabeltrainer n\'est pas lié à ces applis ni à leurs éditeurs. Leur propre politique de confidentialité s\'applique.';

  @override
  String lessonScreenRecognized(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mots reconnus',
      one: '$count mot reconnu',
    );
    return '$_temp0';
  }

  @override
  String lessonScreenDuplicatesSkipped(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count étaient déjà dans la leçon et seront ignorés.',
      one: '$count était déjà dans la leçon et sera ignoré.',
    );
    return '$_temp0';
  }

  @override
  String lessonScreenImportButton(int count) {
    return 'Ajouter $count';
  }

  @override
  String get lessonSetupTitleNew => 'Nouvelle leçon';

  @override
  String get lessonSetupTitleEdit => 'Régler la leçon';

  @override
  String get lessonSetupNameLabel => 'Nom de la leçon';

  @override
  String get lessonSetupNameHint => 'p. ex. Unit 3 ou Leçon 5';

  @override
  String get lessonSetupLanguageLabel => 'Langue des mots';

  @override
  String get lessonSetupTranslationLabel => 'Traduction en';

  @override
  String get lessonSetupFieldsTitle => 'Qu\'est-ce qu\'on saisit ?';

  @override
  String get lessonSetupFieldsHelp =>
      'Ça détermine la saisie, le scan avec l\'IA et le test.';

  @override
  String get lessonSetupWord => 'Mot';

  @override
  String get lessonSetupTranslation => 'Traduction';

  @override
  String get lessonSetupAlwaysIncluded => 'toujours inclus';

  @override
  String get lessonSetupForms => 'Formes';

  @override
  String get lessonSetupFormsSubtitle =>
      'p. ex. temps primitifs, génitif, genre';

  @override
  String get lessonSetupWhichForms => 'Quelles formes ?';

  @override
  String get lessonSetupAllForms => 'Tout';

  @override
  String get lessonSetupAllFormsHelp =>
      'Tout ce que le livre indique pour le mot : temps primitifs, pluriel, genre, comparatif, cas et plus encore.';

  @override
  String get lessonSetupPickOneKind => 'Choisis au moins un type.';

  @override
  String get lessonSetupExtrasTitle => 'Autres (jusqu\'à 3)';

  @override
  String get lessonSetupExtrasHelp =>
      'Tes propres champs, p. ex. phrase d\'exemple ou moyen mnémotechnique.';

  @override
  String lessonSetupExtraFieldLabel(int number) {
    return 'Autre $number – nom';
  }

  @override
  String lessonSetupExtraDefaultName(int number) {
    return 'Autre $number';
  }

  @override
  String get lessonSetupRemove => 'Retirer';

  @override
  String get lessonSetupExtraChip => 'Autre';

  @override
  String get lessonSetupSuggestionExample => 'Phrase d\'exemple';

  @override
  String get lessonSetupSuggestionMnemonic => 'Astuce mémo';

  @override
  String get lessonSetupSuggestionPronunciation => 'Prononciation';

  @override
  String get lessonSetupSuggestionOpposite => 'Contraire';

  @override
  String get lessonsTabNewLessonHintTitle => 'Nouvelle leçon';

  @override
  String get lessonsTabNewLessonHintText =>
      'Donne un nom à la leçon et choisis la langue. Ensuite, tu décides ce que tu veux apprendre : le mot et la traduction sont toujours inclus, plus, si tu veux, les formes et jusqu\'à trois champs à toi comme une phrase d\'exemple ou une astuce mémo.';

  @override
  String get lessonsTabEmptyTitle => 'Pas encore de leçons';

  @override
  String get lessonsTabEmptyText =>
      'Crée ta première leçon. Tu tapes les mots toi-même – ou tu prends en photo la page de ton livre et une appli d\'IA comme ChatGPT ou Gemini la lit pour toi.';

  @override
  String get lessonsTabNewLesson => 'Nouvelle leçon';

  @override
  String lessonsTabCardStats(int count, int known) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mots',
      one: '$count mot',
    );
    return '$_temp0 · $known sus';
  }

  @override
  String get vocabFormDialogTitleNew => 'Nouveau mot';

  @override
  String get vocabFormDialogTitleEdit => 'Modifier le mot';

  @override
  String get vocabFormDialogWord => 'Mot';

  @override
  String vocabFormDialogWordWithLanguage(String language) {
    return 'Mot ($language)';
  }

  @override
  String vocabFormDialogTranslation(String language) {
    return 'Traduction ($language)';
  }

  @override
  String get vocabFormDialogForms => 'Formes';

  @override
  String get vocabFormDialogAllForms => 'toutes les formes';

  @override
  String get introWelcomeTitle => 'Bienvenue dans Vokabeltrainer';

  @override
  String get introWelcomeText =>
      'Apprends du vocabulaire dans n\'importe quelle langue – avec des cartes, des tests et des révisions malignes. Chaque mot revient pile au moment où tu allais l\'oublier.';

  @override
  String get introScanTitle => 'Taper ou scanner';

  @override
  String get introScanText =>
      'Crée des leçons et tape les mots. Ou prends en photo la liste de ton livre : une appli d\'IA comme ChatGPT ou Gemini la lit pour toi.';

  @override
  String get introTestTitle => 'Prêt pour l\'interro';

  @override
  String get introTestText =>
      'Indique la date de ton interro de vocabulaire. L\'appli répartit les mots sur les jours d\'avant et te rappelle d\'apprendre – jamais après 21 h.';

  @override
  String get introPrivacyTitle => 'Tout reste sur ton téléphone';

  @override
  String get introPrivacyText =>
      'Pas de compte, pas de cloud : tes leçons et ta progression ne sont enregistrées nulle part sur Internet. Seulement quand tu scannes, la photo est envoyée à l\'appli d\'IA que tu choisis toi-même.';

  @override
  String get introFreeTitle => 'Entièrement gratuit';

  @override
  String get introFreeText =>
      'Je ne gagne rien avec cette appli : pas de pub, pas d\'achats intégrés, pas d\'abonnement. Elle est juste là pour t\'aider à apprendre.';

  @override
  String get privacyScreenTitle => 'Confidentialité';

  @override
  String get nameDialogWelcome => 'Bienvenue !';

  @override
  String get nameDialogTitle => 'Ton prénom';

  @override
  String get nameDialogIntro =>
      'Comment tu t\'appelles ? L\'appli te saluera par ton prénom – aussi dans les rappels. C\'est facultatif.';

  @override
  String get nameDialogLabel => 'Ton prénom (facultatif)';

  @override
  String get nameDialogLocalOnly =>
      'Ton prénom est enregistré uniquement sur ce téléphone.';

  @override
  String get hintDialogDontShowAgain => 'Ne plus afficher';

  @override
  String get formKindVerbLabel => 'Formes verbales';

  @override
  String get formKindNounLabel => 'Formes du nom';

  @override
  String get formKindPluralLabel => 'Pluriel';

  @override
  String get formKindAdjectiveLabel => 'Formes de l\'adjectif';

  @override
  String get formKindComparisonLabel => 'Comparatif';

  @override
  String get formKindGenderLabel => 'Genre';

  @override
  String get formKindInflectionClassLabel => 'Déclinaison/conjugaison';

  @override
  String get formKindGovernmentLabel => 'Cas/préposition';

  @override
  String get formKindWordClassLabel => 'Nature du mot';

  @override
  String get formKindVerbExample =>
      'temps primitifs ou formes irrégulières, p. ex. vocō, vocāvī, vocātum ou go, went, gone';

  @override
  String get formKindNounExample => 'p. ex. génitif : lūnae';

  @override
  String get formKindPluralExample => 'p. ex. mice, les chevaux';

  @override
  String get formKindAdjectiveExample =>
      'formes des autres genres, p. ex. bonus, -a, -um';

  @override
  String get formKindComparisonExample => 'p. ex. good, better, best';

  @override
  String get formKindGenderExample => 'pour les noms, p. ex. m, f, n ou le/la';

  @override
  String get formKindInflectionClassExample =>
      'p. ex. 1re déclinaison, 2e conjugaison';

  @override
  String get formKindGovernmentExample =>
      'quel cas ou quelle préposition suit, p. ex. + datif, penser à';

  @override
  String get formKindWordClassExample => 'p. ex. verbe, nom, adjectif, adverbe';

  @override
  String get vocabModelDefaultBoxName => 'Vocabulaire';

  @override
  String get aiScanColumnWord => 'Mot';

  @override
  String get aiScanColumnTranslation => 'Traduction';

  @override
  String get aiScanColumnForms => 'Formes';

  @override
  String get aiScanForeignLanguage => 'la langue étrangère';

  @override
  String aiScanPromptIntro(String language, String translationLanguage) {
    return 'Lis tout le vocabulaire sur la photo (mots en $language, traduction en $translationLanguage).';
  }

  @override
  String get aiScanPromptAnswerOnly =>
      'Réponds UNIQUEMENT avec un seul bloc de code exactement dans ce format, sans aucun autre texte :';

  @override
  String get aiScanPromptRules => 'Règles :';

  @override
  String aiScanPromptRuleColumns(int count, String columns) {
    return 'Une ligne par mot, colonnes séparées par \" | \", toujours exactement $count colonnes dans cet ordre : $columns.';
  }

  @override
  String aiScanPromptRuleNoHeader(String marker) {
    return 'Ne mets pas la ligne avec les noms des colonnes, la première ligne est toujours $marker.';
  }

  @override
  String aiScanPromptRuleWord(String column) {
    return '$column : écrit comme sur la photo, avec tous les caractères spéciaux et accents.';
  }

  @override
  String aiScanPromptRuleTranslation(String column) {
    return '$column : comme sur la photo ; sépare plusieurs sens par une virgule.';
  }

  @override
  String aiScanPromptRuleAllForms(String column) {
    return '$column : TOUTES les indications grammaticales que la photo donne pour le mot – n\'omets rien. Par exemple (mais pas seulement) :';
  }

  @override
  String get aiScanPromptRuleAllFormsMore =>
      'Tout le reste qui se rapporte au mot (abréviations, remarques entre parenthèses) va aussi ici. Sépare plusieurs indications par une virgule.';

  @override
  String get aiScanPromptRuleAllFormsNone =>
      'Si la photo ne donne aucune indication pour le mot, alors \"-\".';

  @override
  String aiScanPromptRuleSomeForms(String column) {
    return '$column : seulement ces indications, plusieurs séparées par une virgule :';
  }

  @override
  String aiScanPromptRuleOmit(String kinds) {
    return 'À omettre : $kinds.';
  }

  @override
  String get aiScanPromptRuleSomeFormsNone =>
      'Si un mot n\'a pas ces indications (p. ex. un adverbe), mets \"-\".';

  @override
  String aiScanPromptRuleExtra(String label) {
    return '$label : d\'après la photo ; s\'il n\'y a rien, alors \"-\".';
  }

  @override
  String get aiScanPromptRuleMissing =>
      'S\'il manque une indication, écris \"-\". N\'invente rien qui ne soit pas sur la photo.';

  @override
  String get aiScanPromptRuleNoPipe =>
      'N\'utilise pas de \"|\" à l\'intérieur d\'une colonne.';

  @override
  String get settingsThemeDark => 'Mode sombre';

  @override
  String get settingsThemeLight => 'Mode clair';

  @override
  String get settingsThemeSystem => 'Système (auto)';

  @override
  String get settingsThemeDarkDesc =>
      'Fond sombre avec des couleurs néon lumineuses.';

  @override
  String get settingsThemeLightDesc =>
      'Design clair et minimaliste avec des tons blancs et gris clair.';

  @override
  String get settingsThemeSystemDesc => 'Suit le réglage de ton appareil.';

  @override
  String get settingsAccentViolet => 'Violet néon';

  @override
  String get settingsAccentCyan => 'Cyan néon';

  @override
  String get settingsAccentEmerald => 'Émeraude néon';

  @override
  String get settingsAccentOrange => 'Orange néon';

  @override
  String get settingsAccentPink => 'Rose néon';

  @override
  String get settingsDirectionForward => 'Mot → Traduction';

  @override
  String get settingsDirectionBackward => 'Traduction → Mot';

  @override
  String get settingsDirectionForwardDesc =>
      'L\'appli montre le mot, tu donnes le sens.';

  @override
  String get settingsDirectionBackwardDesc =>
      'L\'appli montre la traduction, tu donnes le mot.';

  @override
  String get settingsAnswerTranslationOnly => 'Traduction seule';

  @override
  String get settingsAnswerWordOnly => 'Mot seul';

  @override
  String get settingsAnswerFormsOnly => 'Formes seules';

  @override
  String get settingsAnswerBoth => 'Les deux';

  @override
  String get settingsAnswerTranslationOnlyDesc =>
      'Tu donnes seulement la traduction.';

  @override
  String get settingsAnswerWordOnlyDesc => 'Tu donnes seulement le mot.';

  @override
  String get settingsAnswerFormsOnlyDesc => 'Tu donnes seulement les formes.';

  @override
  String get settingsAnswerBothTranslationDesc =>
      'Tu donnes la traduction et les formes.';

  @override
  String get settingsAnswerBothWordDesc => 'Tu donnes le mot et les formes.';

  @override
  String get settingsNameTitle => 'Ton prénom';

  @override
  String get settingsNameEmpty =>
      'Non indiqué – enregistré uniquement sur ce téléphone';

  @override
  String settingsNameSaved(String name) {
    return '$name · enregistré uniquement sur ce téléphone';
  }

  @override
  String get settingsDesignTitle => 'Apparence';

  @override
  String get settingsAccentTitle => 'Couleur d\'accent (néon)';

  @override
  String get settingsAccentHint =>
      'La couleur d\'accent s\'applique aux boutons, interrupteurs et éléments mis en valeur. En mode sombre, les couleurs brillent ; en mode clair, elles sont automatiquement un peu assombries pour que tout reste bien lisible.';

  @override
  String get settingsDirectionTitle => 'Sens de traduction';

  @override
  String get settingsAnswerModeTitle => 'Mode de réponse au test';

  @override
  String get settingsAskExtrasTitle => 'Demander aussi les autres champs';

  @override
  String get settingsAskExtrasSubtitle =>
      'p. ex. phrase d\'exemple ou astuce mémo – si le mot en a.';

  @override
  String get settingsFormsHint =>
      'Les formes sont p. ex. les temps primitifs, le génitif ou le genre. Si un mot n\'a pas de formes, seule la traduction est demandée. Le mode de réponse s\'applique au mode Test.';

  @override
  String get settingsAboutTitle => 'À propos de l\'appli';

  @override
  String get settingsShowIntro => 'Revoir l\'introduction';

  @override
  String get settingsPrivacyTitle => 'Confidentialité';

  @override
  String get settingsPrivacySubtitle => 'Tout reste sur ton téléphone';

  @override
  String get settingsLicensesTitle => 'Licences';

  @override
  String get settingsLicensesSubtitle => 'Logiciels utilisés';

  @override
  String get settingsLicensesLegalese =>
      'Gratuit, sans pub et sans achats intégrés.';

  @override
  String get backupExported => 'La sauvegarde est en cours de téléchargement.';

  @override
  String get backupCopied =>
      'Sauvegarde copiée dans le presse-papiers – colle-la p. ex. dans une note.';

  @override
  String get backupRestoreTitle => 'Restaurer la sauvegarde ?';

  @override
  String get backupRestoreMessage =>
      'Ta progression actuelle et tes listes d\'entraînement seront remplacées par la sauvegarde.';

  @override
  String get backupRestoreAction => 'Restaurer';

  @override
  String get backupRestored => 'Sauvegarde restaurée. ✅';

  @override
  String get backupResetTitle => 'Réinitialiser la progression ?';

  @override
  String get backupResetMessage =>
      'Tous les niveaux et dates de révision seront supprimés. Les leçons et listes d\'entraînement sont conservées.';

  @override
  String get backupResetAction => 'Réinitialiser';

  @override
  String get backupResetDone => 'Progression réinitialisée.';

  @override
  String get backupPasteTitle => 'Coller une sauvegarde';

  @override
  String get backupTitle => 'Données & sauvegarde';

  @override
  String get backupHint =>
      'Ta progression est enregistrée uniquement sur cet appareil. Fais une sauvegarde de temps en temps – elle te permet aussi de passer à un autre appareil.';

  @override
  String get backupExportTitle => 'Exporter une sauvegarde';

  @override
  String get backupExportFile => 'Télécharger en fichier';

  @override
  String get backupExportClipboard => 'Copier dans le presse-papiers';

  @override
  String get backupImportTitle => 'Importer une sauvegarde';

  @override
  String get backupImportFile => 'Choisir un fichier de sauvegarde';

  @override
  String get backupImportPaste => 'Coller le texte sauvegardé';

  @override
  String get backupResetTile => 'Réinitialiser la progression';

  @override
  String get storeBackupInvalid =>
      'Ce n\'est pas un fichier de sauvegarde valide.';

  @override
  String get storeBackupCorrupt => 'Le fichier de sauvegarde est endommagé.';

  @override
  String get notifSectionBlocked =>
      'Les notifications sont bloquées. Autorise-les pour Vokabeltrainer dans les paramètres Android.';

  @override
  String get notifSectionTitle => 'Rappels';

  @override
  String get notifSectionAndroidOnly =>
      '📱 Les vrais rappels sont dans l\'appli Android : plusieurs fois par jour, avec les chiffres à jour et jamais après 21 h.';

  @override
  String get notifSectionSwitchTitle => 'Rappels d\'apprentissage';

  @override
  String get notifSectionSwitchSubtitle =>
      'Avec les chiffres à jour – jamais après 21 h. Si tout est appris pour aujourd\'hui, c\'est le calme.';

  @override
  String get notifSectionHowOften => 'Combien de fois par jour ?';

  @override
  String notifSectionTimes(String times) {
    return 'à $times';
  }

  @override
  String get notifSectionSendTest => 'Envoyer une notification de test';

  @override
  String get notifChannelName => 'Rappels d\'apprentissage';

  @override
  String get notifChannelDescription =>
      'Te rappelle d\'apprendre ton vocabulaire (jamais après 21 h).';

  @override
  String get notifTestTitle =>
      '👋 Salut ! Voilà à quoi ressemblent tes rappels';

  @override
  String get notifTestBody =>
      'Je te fais signe quand des mots t\'attendent – jamais après 21 h.';

  @override
  String notifFirst1Title(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '🧠 $n mots t\'attendent',
      one: '🧠 1 mot t\'attend',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst1Body => 'Quelques minutes suffisent – c\'est parti !';

  @override
  String get notifFirst2Title => '⚔️ Le vocabulaire attaque !';

  @override
  String notifFirst2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n mots veulent être vaincus aujourd\'hui.',
      one: '1 mot veut être vaincu aujourd\'hui.',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst3Title => '🕵️ Mission secrète du jour';

  @override
  String notifFirst3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n mots à décoder. Prêt ?',
      one: '1 mot à décoder. Prêt ?',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst4Title => '📚 Ton vocabulaire t\'appelle !';

  @override
  String notifFirst4Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Aujourd\'hui, $n mots sont au programme.',
      one: 'Aujourd\'hui, 1 mot est au programme.',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst5Title => '🎯 Mission du jour';

  @override
  String notifFirst5Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n mots à craquer – tu les auras tous ?',
      one: '1 mot à craquer – tu y arrives ?',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst6Title => '🦉 La chouette a faim';

  @override
  String notifFirst6Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Nourris-la avec $n mots !',
      one: 'Nourris-la avec 1 mot !',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst7Title => '🎲 On parie ?';

  @override
  String notifFirst7Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Je parie que tu apprends ces $n mots en 5 minutes.',
      one: 'Je parie que tu apprends ce mot en 5 minutes.',
    );
    return '$_temp0';
  }

  @override
  String notifNamed1Title(String name) {
    return '👋 Salut $name !';
  }

  @override
  String notifNamed1Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n mots t\'attendent aujourd\'hui.',
      one: '1 mot t\'attend aujourd\'hui.',
    );
    return '$_temp0';
  }

  @override
  String notifNamed2Title(String name) {
    return '🎯 $name, ta mission du jour';
  }

  @override
  String notifNamed2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n mots à craquer – c\'est parti !',
      one: '1 mot à craquer – c\'est parti !',
    );
    return '$_temp0';
  }

  @override
  String notifNamed3Title(String name) {
    return '🧠 $name, on révise un peu ?';
  }

  @override
  String notifNamed3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Aujourd\'hui, $n mots sont au programme.',
      one: 'Aujourd\'hui, 1 mot est au programme.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle1Title => '⏰ Psst… ton vocabulaire t\'attend encore';

  @override
  String notifMiddle1Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Il reste encore $n mots aujourd\'hui.',
      one: 'Il reste encore 1 mot aujourd\'hui.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle2Title => '🐢 Le vocabulaire s\'impatiente';

  @override
  String notifMiddle2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Encore $n qui attendent – juste quelques minutes !',
      one: 'Encore 1 qui attend – juste quelques minutes !',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle3Title => '💬 Tes cartes se demandent où tu es';

  @override
  String notifMiddle3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Il reste encore $n mots.',
      one: 'Il reste encore 1 mot.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle4Title => '🧩 Presque oublié ?';

  @override
  String notifMiddle4Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n mots veulent encore être révisés aujourd\'hui.',
      one: '1 mot veut encore être révisé aujourd\'hui.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle5Title => '🚀 Un petit boost ?';

  @override
  String notifMiddle5Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n cartes, et tu es tranquille.',
      one: '1 carte, et tu es tranquille.',
    );
    return '$_temp0';
  }

  @override
  String get notifLast1Title => '🌙 Dernière chance pour aujourd\'hui !';

  @override
  String notifLast1Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Encore $n mots – et après, c\'est fini pour aujourd\'hui.',
      one: 'Encore 1 mot – et après, c\'est fini pour aujourd\'hui.',
    );
    return '$_temp0';
  }

  @override
  String get notifLast2Title => '⌛ La journée est presque finie';

  @override
  String notifLast2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n mots, et tu as fini pour aujourd\'hui.',
      one: '1 mot, et tu as fini pour aujourd\'hui.',
    );
    return '$_temp0';
  }

  @override
  String get notifLast3Title => '🛡️ Dernière ligne droite';

  @override
  String notifLast3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Encore $n mots avant la pause.',
      one: 'Encore 1 mot avant la pause.',
    );
    return '$_temp0';
  }

  @override
  String notifStreakTitle(int streak) {
    return '🔥 Ta série de $streak jours est en danger !';
  }

  @override
  String notifStreakTitleNamed(String name, int streak) {
    return '🔥 $name, ta série de $streak jours est en danger !';
  }

  @override
  String notifStreakBody(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Encore $n mots – apprends aujourd\'hui pour ne pas la casser.',
      one: 'Encore 1 mot – apprends aujourd\'hui pour ne pas la casser.',
    );
    return '$_temp0';
  }

  @override
  String notifExamTomorrowTitle(String list) {
    return '🚨 Demain, c\'est « $list » !';
  }

  @override
  String notifExamTomorrowBodyLast(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Dernière chance : encore $n mots à réviser !',
      one: 'Dernière chance : encore 1 mot à réviser !',
    );
    return '$_temp0';
  }

  @override
  String notifExamTomorrowBody(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other:
          'Aujourd\'hui, c\'est le dernier jour de révision – $n mots t\'attendent.',
      one:
          'Aujourd\'hui, c\'est le dernier jour de révision – 1 mot t\'attend.',
    );
    return '$_temp0';
  }

  @override
  String notifExamSoonTitle(int days, String list) {
    return '⚡ Plus que $days jours avant « $list »';
  }

  @override
  String notifExamSoonBody(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Dernière ligne droite ! Aujourd\'hui, $n mots au programme.',
      one: 'Dernière ligne droite ! Aujourd\'hui, 1 mot au programme.',
    );
    return '$_temp0';
  }

  @override
  String notifExamDayTitle(String list) {
    return '🍀 Aujourd\'hui, c\'est « $list » !';
  }

  @override
  String get notifExamDayBody =>
      'Tu t\'es entraîné – maintenant, montre ce que tu sais faire. Bonne chance ! 💪';

  @override
  String get analyseEmptyTitle => 'Pas encore de listes d\'entraînement';

  @override
  String get analyseEmptyText =>
      'Crée une liste d\'entraînement pour voir tes progrès ici.';

  @override
  String analyseSummary(int total, int good, int neutral, int weak) {
    String _temp0 = intl.Intl.pluralLogic(
      total,
      locale: localeName,
      other: '$total mots',
      one: '$total mot',
    );
    return '$_temp0 · $good bien · $neutral neutre · $weak faible';
  }

  @override
  String analyseGoalUntil(String date) {
    return 'Objectif d\'ici le $date';
  }

  @override
  String get analyseOverallGoal => 'Objectif global';

  @override
  String analyseKnown(int known, int total) {
    return '$known/$total mots sus';
  }

  @override
  String get analyseDailyGoal => 'Objectif du jour';

  @override
  String get analyseAllDone => 'tout est fait';

  @override
  String analyseLearnedToday(int learned, int target) {
    return '$learned/$target appris aujourd\'hui';
  }

  @override
  String get analyseAllKnown => 'Tous les mots sont sus ! 🎉';

  @override
  String analyseRemaining(int days, int remaining) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days jours',
    );
    String _temp1 = intl.Intl.pluralLogic(
      remaining,
      locale: localeName,
      other: '$remaining mots',
      one: '$remaining mot',
    );
    return 'Encore $_temp0 · $_temp1 à apprendre.';
  }

  @override
  String get vocabDetailNeverPracticed => 'Jamais révisé';

  @override
  String vocabDetailMemoryDue(int percent, int reps) {
    return 'Mémoire : $percent % · à réviser maintenant · révisé $reps×';
  }

  @override
  String vocabDetailMemoryNext(int percent, String interval, int reps) {
    return 'Mémoire : $percent % · revient dans $interval · révisé $reps×';
  }

  @override
  String get vocabDetailNoHistory => 'Pas encore d\'historique.';

  @override
  String get vocabDetailWorse => 'Moins bien';

  @override
  String get vocabDetailBetter => 'Mieux';

  @override
  String get levelVeryGood => 'Très bien';

  @override
  String get levelGood => 'Bien';

  @override
  String get levelQuiteGood => 'Assez bien';

  @override
  String get levelOkay => 'Plutôt OK';

  @override
  String get levelSlightlyGood => 'Un peu bien';

  @override
  String get levelNeutral => 'Neutre';

  @override
  String get levelSlightlyWeak => 'Un peu faible';

  @override
  String get levelWeak => 'Faible';

  @override
  String get levelQuiteWeak => 'Assez faible';

  @override
  String get levelBad => 'Mauvais';

  @override
  String get levelVeryBad => 'Très mauvais';

  @override
  String get tutorialTitle => 'Comment marche l\'appli';

  @override
  String get tutorialPage1Title => 'Comment marche Vokabeltrainer';

  @override
  String get tutorialPage1Text =>
      'Cette appli t\'aide à apprendre du vocabulaire dans n\'importe quelle langue – avec des cartes, des tests et des révisions malignes. Balaie vers la gauche ou touche « Suivant » pour tout découvrir.';

  @override
  String get tutorialPage2Title => 'Créer une leçon';

  @override
  String get tutorialPage2Text =>
      'Dans l\'onglet « Leçons », tu crées une leçon : nom, langue et ce que tu veux apprendre – le mot et la traduction, si tu veux les formes et jusqu\'à trois champs à toi comme une phrase d\'exemple ou une astuce mémo.';

  @override
  String get tutorialPage3Title => 'Scanner le vocabulaire';

  @override
  String get tutorialPage3Text =>
      'Tape les mots toi-même – ou touche « Scanner » et prends en photo la liste de ton livre. Une appli d\'IA comme ChatGPT ou Gemini la lit. Copie sa réponse, reviens ici, c\'est fini.';

  @override
  String get tutorialPage4Title => 'Créer des listes d\'entraînement';

  @override
  String get tutorialPage4Text =>
      'Sur l\'accueil, touche « Listes d\'entraînement » puis « Nouvelle liste ». Donne un nom à la liste, éventuellement la date de ton interro, et choisis les mots dans tes leçons.';

  @override
  String get tutorialPage5Title => 'Apprendre chaque jour';

  @override
  String get tutorialPage5Text =>
      'Sur l\'accueil, sous « Aujourd\'hui », tu vois ce qui est au programme dans tes listes : d\'abord les révisions à faire, plus jusqu\'à 15 nouveaux mots. Touche « C\'est parti » pour commencer.';

  @override
  String get tutorialPage6Title => 'Cartes';

  @override
  String get tutorialPage6Text =>
      'Touche la carte pour la retourner et note-toi honnêtement : « Encore », « Difficile », « Bien » ou « Facile ». Sous chaque bouton, tu vois quand la carte reviendra. Sur PC : espace pour retourner, 1–4 pour noter.';

  @override
  String get tutorialPage7Title => 'Réviser malin';

  @override
  String get tutorialPage7Text =>
      'L\'appli te demande chaque mot pile au moment où tu allais l\'oublier (répétition espacée avec FSRS, comme Anki). Les mots bien sus reviennent moins souvent, les difficiles plus souvent. Apprends un peu chaque jour – ça garde ta 🔥 série en vie.';

  @override
  String get tutorialPage8Title => 'L\'interro en ligne de mire';

  @override
  String get tutorialPage8Text =>
      'Quand tu crées une liste, indique la date de ton interro. L\'appli répartit les nouveaux mots sur les jours pour que tu aies fini la VEILLE de l\'interro – ce jour-là, tout est révisé une dernière fois. Plus l\'interro approche, plus les mots reviennent souvent.';

  @override
  String get tutorialPage9Title => 'Rappels';

  @override
  String get tutorialPage9Text =>
      'L\'appli te le rappelle jusqu\'à 3 fois par jour – avec les chiffres à jour et jamais après 21 h. Si tu as tout appris pour aujourd\'hui, c\'est le calme. Tu peux régler ça dans Paramètres → Rappels.';

  @override
  String get tutorialPage10Title => 'Mode Test';

  @override
  String get tutorialPage10Text =>
      'Ici, tu tapes toi-même la traduction et/ou les formes – et si tu veux, tes propres champs (Paramètres). À la correction, les majuscules/minuscules et les articles (le/la/les) ne comptent pas.';

  @override
  String get tutorialPage11Title => 'Voir ta progression';

  @override
  String get tutorialPage11Text =>
      'Dans l\'onglet « Analyse », tu vois chaque mot avec son niveau : 5 tons de vert (bien), gris (neutre) et 5 tons de rouge (faible). Touche un mot pour voir son graphique et l\'améliorer ou le baisser à la main avec +/−.';

  @override
  String get tutorialPage12Title => 'Tes données';

  @override
  String get tutorialPage12Text =>
      'Tout est enregistré uniquement sur cet appareil – sans compte, sans Internet. Fais de temps en temps une sauvegarde dans les paramètres. Elle te permet aussi de passer à un autre appareil.';

  @override
  String get dashboardGreetingNight => 'Encore debout ? 🌙';

  @override
  String dashboardGreetingNightName(String name) {
    return 'Encore debout, $name ? 🌙';
  }

  @override
  String get dashboardGreetingMorning => 'Bonjour ! ☀️';

  @override
  String dashboardGreetingMorningName(String name) {
    return 'Bonjour, $name ! ☀️';
  }

  @override
  String get dashboardGreetingDay => 'Salut ! 👋';

  @override
  String dashboardGreetingDayName(String name) {
    return 'Salut, $name ! 👋';
  }

  @override
  String get dashboardGreetingEvening => 'Bonsoir ! 🌆';

  @override
  String dashboardGreetingEveningName(String name) {
    return 'Bonsoir, $name ! 🌆';
  }

  @override
  String dashboardStreakLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'jours de série',
      one: 'jour de série',
    );
    return '$_temp0';
  }

  @override
  String get dashboardPracticedToday => 'révisés aujourd\'hui';

  @override
  String dashboardKnownOf(int total) {
    return 'sus sur $total';
  }

  @override
  String get dashboardPracticeLists => 'Listes d\'entraînement';

  @override
  String get dashboardPracticeListsEmpty => 'Prépare tes mots pour une interro';

  @override
  String dashboardListCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count listes',
      one: '$count liste',
    );
    return '$_temp0';
  }

  @override
  String get dashboardHelpTitle => 'Aide & guide';

  @override
  String get dashboardHelpSubtitle => 'Comment marche Vokabeltrainer';

  @override
  String get dashboardStreakNone => 'Lance ta série aujourd\'hui !';

  @override
  String get dashboardStreakFirstDay =>
      'Jour 1 de ta série – continue comme ça !';

  @override
  String dashboardStreakRun(int count) {
    return '🔥 $count jours d\'affilée !';
  }

  @override
  String get dashboardGetStarted => 'C\'est parti !';

  @override
  String get dashboardNoListsHint =>
      'Crée maintenant une liste d\'entraînement : donne-lui un nom et choisis les mots que tu veux apprendre.';

  @override
  String get dashboardNoLessonsHint =>
      'Crée d\'abord une leçon. Tu tapes les mots toi-même ou tu les scannes depuis ton livre avec une appli d\'IA.';

  @override
  String get dashboardCreateList => 'Créer une liste';

  @override
  String get dashboardCreateLesson => 'Créer une leçon';

  @override
  String get dashboardAllDone => 'Tout est fait pour aujourd\'hui !';

  @override
  String get dashboardToday => 'Aujourd\'hui';

  @override
  String dashboardDoneReviewed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tu as réussi $count questions aujourd\'hui. On continue demain !',
      one: 'Tu as réussi 1 question aujourd\'hui. On continue demain !',
    );
    return '$_temp0';
  }

  @override
  String get dashboardNothingDue =>
      'Rien à réviser pour l\'instant. Repasse demain !';

  @override
  String get dashboardDueLabel => 'à réviser';

  @override
  String get dashboardNewLabel => 'nouveaux';

  @override
  String get dashboardFromLists => 'De tes listes d\'entraînement';

  @override
  String dashboardExamToday(String name) {
    return 'Aujourd\'hui, c\'est « $name » !';
  }

  @override
  String get dashboardExamTodayText =>
      'Tu t\'es entraîné – maintenant, montre ce que tu sais faire. Bonne chance !';

  @override
  String dashboardExamTomorrow(String name) {
    return 'Demain, c\'est « $name » !';
  }

  @override
  String get dashboardExamTomorrowText =>
      'Aujourd\'hui, c\'est le dernier jour de révision – tout est révisé une dernière fois.';

  @override
  String dashboardExamInDays(String name, int days) {
    return '« $name » dans $days jours';
  }

  @override
  String dashboardExamFinalSpurt(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Dernière ligne droite ! Plus que $count jours de révision – chacun compte.',
      one:
          'Dernière ligne droite ! Plus qu\'1 jour de révision – chacun compte.',
    );
    return '$_temp0';
  }

  @override
  String dashboardExamDaysLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Encore $count jours de révision. L\'appli répartit les mots pour que tu aies fini à temps.',
      one:
          'Plus qu\'1 jour de révision. L\'appli répartit les mots pour que tu aies fini à temps.',
    );
    return '$_temp0';
  }

  @override
  String get practiceListsNeedLesson =>
      'Crée d\'abord une leçon avec des mots dans « Leçons ».';

  @override
  String practiceListsLimit(int max) {
    return 'Limite atteinte : tu peux avoir au maximum $max listes en même temps.';
  }

  @override
  String get practiceListsCountdownPast => ' · terminé ✅';

  @override
  String get practiceListsCountdownToday => ' · aujourd\'hui ! 🍀';

  @override
  String get practiceListsCountdownTomorrow => ' · demain !';

  @override
  String practiceListsCountdownDays(int days) {
    return ' · dans $days jours';
  }

  @override
  String get practiceListsDueDateTitle => 'C\'est quand, l\'interro ?';

  @override
  String get practiceListsChangeDueDate => 'Changer la date';

  @override
  String get practiceListsDueDateHint =>
      'Facultatif. L\'appli répartit les mots pour que tu saches tout la veille de l\'interro – le jour même, tu n\'as plus besoin de réviser.';

  @override
  String get practiceListsPickDate => 'Choisir la date';

  @override
  String get practiceListsRemoveDate => 'Retirer';

  @override
  String practiceListsNotifyOnSnack(String name) {
    return 'Rappels activés pour « $name ».';
  }

  @override
  String practiceListsNotifyOffSnack(String name) {
    return 'Plus de rappels pour « $name ».';
  }

  @override
  String practiceListsDeleteTitle(String name) {
    return 'Supprimer « $name » ?';
  }

  @override
  String get practiceListsDeleteText =>
      'La liste d\'entraînement sera supprimée.';

  @override
  String get practiceListsNoVocabs => 'Cette liste ne contient aucun mot.';

  @override
  String get practiceListsTitle => 'Tes listes d\'entraînement';

  @override
  String get practiceListsNew => 'Nouvelle liste';

  @override
  String get practiceListsEmptyTitle => 'Pas encore de listes d\'entraînement';

  @override
  String get practiceListsEmptyText =>
      'Crée ta première liste avec le bouton en bas.';

  @override
  String practiceListsSubtitleTest(String vocabs, String date) {
    return '$vocabs · Interro : $date';
  }

  @override
  String get practiceListsNotifyDisable => 'Désactiver les rappels';

  @override
  String get practiceListsNotifyEnable => 'Activer les rappels';

  @override
  String get practiceListsNameDialogTitle => 'Nouvelle liste d\'entraînement';

  @override
  String get practiceListsNameLabel => 'Nom de la liste';

  @override
  String get practiceListsNameHint => 'p. ex. Interro de vocabulaire 1';

  @override
  String get practiceNothingDue =>
      'Plus rien à réviser pour aujourd\'hui – super ! 😎 Choisis « Tous » si tu veux quand même t\'entraîner.';

  @override
  String get practiceNoWeak => 'Aucun mot faible. 😎';

  @override
  String get practiceTitle => 'Choisir le mode';

  @override
  String practiceSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mots sélectionnés',
      one: '$count mot sélectionné',
    );
    return '$_temp0';
  }

  @override
  String get practiceModeFlashcards => 'Cartes';

  @override
  String get practiceModeTest => 'Test';

  @override
  String get practiceWhichVocabs => 'Quels mots ?';

  @override
  String get practiceFilterSmart => 'À réviser & nouveaux';

  @override
  String get practiceFilterAll => 'Tous';

  @override
  String get practiceFilterWeak => 'Faibles';

  @override
  String practicePlanSummary(int due, int fresh) {
    return '$due à réviser · $fresh nouveaux';
  }

  @override
  String practicePlanSummaryLater(int due, int fresh, int later) {
    return '$due à réviser · $fresh nouveaux ($later autres plus tard)';
  }

  @override
  String get practiceFlashcardsHint =>
      'Un mot s\'affiche. Tu découvres le sens et tu te notes toi-même : Encore, Difficile, Bien ou Facile.';

  @override
  String get practiceTestHint =>
      'Un mot s\'affiche. Tu tapes toi-même la traduction et les formes.';

  @override
  String get practiceSmartHint =>
      '« À réviser & nouveaux » utilise la répétition espacée (FSRS) : chaque mot revient pile au moment où tu allais l\'oublier. Si la liste a une date d\'interro, les nouveaux mots sont répartis sur les jours jusqu\'à la veille, et tout est révisé une dernière fois avant.';

  @override
  String get practiceStart => 'Commencer';

  @override
  String get flashcardWord => 'Mot';

  @override
  String get flashcardTranslation => 'Traduction';

  @override
  String flashcardTitle(int current, int total) {
    return 'Carte $current / $total';
  }

  @override
  String get flashcardTapToFlip => 'Touche pour retourner';

  @override
  String get flashcardFlip => 'Retourner';

  @override
  String get flashcardRateAgain => 'Encore';

  @override
  String get flashcardRateHard => 'Difficile';

  @override
  String get flashcardRateGood => 'Bien';

  @override
  String get flashcardRateEasy => 'Facile';

  @override
  String testTranslationLabel(String language) {
    return 'Traduction ($language)';
  }

  @override
  String get testWordLabel => 'Mot';

  @override
  String testWordLabelWithLanguage(String language) {
    return 'Mot ($language)';
  }

  @override
  String get testFormsLabel => 'Formes';

  @override
  String testTitle(int current, int total) {
    return 'Test $current / $total';
  }

  @override
  String get testTranslate => 'Traduis :';

  @override
  String testCorrectAnswer(String answer) {
    return 'Correct : $answer';
  }

  @override
  String get testWrong => 'Faux';

  @override
  String get testResultCorrect => 'Correct ! 🎉';

  @override
  String get testResultWrong => 'Dommage, c\'est faux.';

  @override
  String get testCheck => 'Vérifier';

  @override
  String get selectionColumnWord => 'Mot';

  @override
  String get selectionColumnForms => 'Formes';

  @override
  String get selectionColumnTranslation => 'Traduction';

  @override
  String get selectionTitle => 'Choisir les mots';

  @override
  String get selectionMenuTooltip => 'Sélection';

  @override
  String get selectionSelectAll => 'Tout sélectionner';

  @override
  String get selectionClear => 'Tout désélectionner';

  @override
  String selectionConfirm(String label, String vocabs) {
    return '$label ($vocabs)';
  }

  @override
  String get homeTabStart => 'Accueil';

  @override
  String get homeTabLessons => 'Leçons';

  @override
  String get homeTabAnalysis => 'Analyse';

  @override
  String get sessionSummaryExcellent => 'Excellent !';

  @override
  String get sessionSummaryGreat => 'Super boulot !';

  @override
  String get sessionSummaryGood => 'Bien révisé !';

  @override
  String get sessionSummaryKeepGoing => 'Accroche-toi !';

  @override
  String sessionSummaryScore(int correct, int total) {
    return '$correct sur $total sus du premier coup.';
  }

  @override
  String get sessionSummaryScheduled =>
      'L\'appli prévoit automatiquement quand chaque mot reviendra.';

  @override
  String get sessionSummaryRestart => 'Encore';

  @override
  String get changelogTitle => 'Quoi de neuf ?';

  @override
  String get changelogGotIt => 'C\'est compris !';

  @override
  String get changelog6Title => '🔒 La confidentialité en un coup d\'œil';

  @override
  String get changelog6Text =>
      'Dans Paramètres → « À propos de l\'appli », tu trouves la politique de confidentialité et l\'introduction à relire : tout reste sur ton téléphone, et l\'appli est sans pub et sans achats.';

  @override
  String get changelog5Title => '🤖 Scanner seulement avec des applis d\'IA';

  @override
  String get changelog5Text =>
      'Pour scanner, tu ne vois plus que des applis d\'IA comme ChatGPT ou Gemini. Les instructions pour l\'IA sont envoyées en même temps.';

  @override
  String get changelog4Title => '🧩 Plus de formes';

  @override
  String get changelog4Text =>
      'Nouveau dans les formes : pluriel, comparatif, cas/préposition, déclinaison/conjugaison et nature du mot. Avec « Tout », l\'IA reprend vraiment tout ce que le livre indique pour le mot.';

  @override
  String get changelog3Title => '👋 Avec ton prénom';

  @override
  String get changelog3Text =>
      'Si tu veux, l\'appli te salue par ton prénom – aussi dans les rappels. Tu peux le changer dans les paramètres.';

  @override
  String get changelog2Title => '💡 Petites astuces';

  @override
  String get changelog2Text =>
      'La première fois, une petite fenêtre explique comment créer une leçon, taper et scanner. Avec « Ne plus afficher », elle disparaît.';

  @override
  String get changelog1Title => '📚 Des leçons dans toutes les langues';

  @override
  String get changelog1Text =>
      'Crée tes propres leçons – anglais, allemand, latin ou ce que tu apprends – et tape les mots ou scanne-les depuis ton livre.';

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
    return '$n j';
  }

  @override
  String intervalMonths(int n) {
    return '$n mois';
  }

  @override
  String intervalYears(String n) {
    return '$n an';
  }

  @override
  String get changelog7Title => '🌍 Maintenant en 10 langues';

  @override
  String get changelog7Text =>
      'L’appli est disponible en allemand, anglais, espagnol, français, italien, portugais, polonais, turc, russe et chinois. Tu peux changer de langue dans les paramètres.';
}
