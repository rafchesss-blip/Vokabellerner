// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonSave => 'Guardar';

  @override
  String get commonDelete => 'Borrar';

  @override
  String get commonEdit => 'Editar';

  @override
  String get commonNext => 'Siguiente';

  @override
  String get commonBack => 'Atrás';

  @override
  String get commonDone => 'Listo';

  @override
  String get commonOk => 'OK';

  @override
  String get commonClose => 'Cerrar';

  @override
  String get commonLetsGo => '¡Vamos!';

  @override
  String get commonSkip => 'Saltar';

  @override
  String get commonUndo => 'Deshacer';

  @override
  String get commonOptions => 'Opciones';

  @override
  String get commonSettings => 'Ajustes';

  @override
  String get commonHome => 'Ir al inicio';

  @override
  String get languagePickerTitle => 'Idioma de la app';

  @override
  String get languagePickerHint => 'Puedes cambiarlo más tarde en los ajustes.';

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get languageGerman => 'Alemán';

  @override
  String get languageEnglish => 'Inglés';

  @override
  String get languageSpanish => 'Español';

  @override
  String get languageFrench => 'Francés';

  @override
  String get languageItalian => 'Italiano';

  @override
  String get languagePortuguese => 'Portugués';

  @override
  String get languagePolish => 'Polaco';

  @override
  String get languageTurkish => 'Turco';

  @override
  String get languageRussian => 'Ruso';

  @override
  String get languageChinese => 'Chino';

  @override
  String get languageLatin => 'Latín';

  @override
  String vocabCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count palabras',
      one: '1 palabra',
    );
    return '$_temp0';
  }

  @override
  String get lessonScreenManualHintTitle => 'Escribir vocabulario';

  @override
  String get lessonScreenManualHintText =>
      'Tendrás un campo para cada dato de esta lección. Solo hace falta rellenar la palabra y la traducción. Luego puedes tocar cualquier palabra para cambiarla.';

  @override
  String lessonScreenVocabAdded(String word) {
    return '«$word» añadida.';
  }

  @override
  String lessonScreenVocabDeleted(String word) {
    return '«$word» borrada.';
  }

  @override
  String get lessonScreenScanHintTitle => 'Así funciona el escaneo';

  @override
  String lessonScreenScanHintText(String columns) {
    return '1. Haz una foto de la lista de vocabulario: recta y bien legible.\n2. Elige una app de IA. Se abrirá con la foto y las instrucciones.\n3. Envía el mensaje.\n4. Copia la respuesta y vuelve aquí: el vocabulario se reconoce automáticamente.\n\nSe leerá: $columns';
  }

  @override
  String get lessonScreenFreeAiHintTitle => 'Mejor una IA gratuita';

  @override
  String get lessonScreenFreeAiHintText =>
      'ChatGPT, Gemini y compañía leen el vocabulario sin problemas también en la versión gratuita: no necesitas suscripción. Las instrucciones para la IA se añaden automáticamente.';

  @override
  String lessonScreenAiOpenFailed(String app) {
    return 'No se pudo abrir $app.';
  }

  @override
  String get lessonScreenNothingInClipboard =>
      'No hay vocabulario en el portapapeles. Copia la respuesta completa en la app de IA y vuelve a intentarlo.';

  @override
  String lessonScreenImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count palabras añadidas. Toca una para corregirla.',
      one: '1 palabra añadida. Tócala para corregirla.',
    );
    return '$_temp0';
  }

  @override
  String lessonScreenDeleteLessonTitle(String name) {
    return '¿Borrar «$name»?';
  }

  @override
  String get lessonScreenDeleteLessonText =>
      'Se borrarán la lección y todo su vocabulario, también de tus listas de práctica.';

  @override
  String get lessonScreenMenuSettings => 'Ajustes de la lección';

  @override
  String get lessonScreenMenuDelete => 'Borrar lección';

  @override
  String get lessonScreenEmpty => 'Aún no hay vocabulario en esta lección.';

  @override
  String get lessonScreenWaitingForAi => 'Esperando la respuesta de la IA…';

  @override
  String get lessonScreenWaitingHelp =>
      'Copia la respuesta en la app de IA (botón de copiar del bloque de texto) y vuelve aquí: el vocabulario se reconocerá automáticamente.';

  @override
  String get lessonScreenPasteAnswer => 'Pegar respuesta';

  @override
  String get lessonScreenAddTitle => 'Añadir vocabulario';

  @override
  String get lessonScreenAddManually => 'Escribir tú';

  @override
  String get lessonScreenScan => 'Escanear';

  @override
  String get lessonScreenScanTip =>
      'Consejo: con «Escanear» haces una foto de la lista de vocabulario de tu libro. Una app de IA como ChatGPT o Gemini la lee por ti, sin tener que copiarla a mano.';

  @override
  String get lessonScreenTakePhoto => 'Hacer foto';

  @override
  String get lessonScreenPhotoFromGallery => 'Foto de la galería';

  @override
  String get lessonScreenWhichAi => '¿Con qué IA?';

  @override
  String get lessonScreenNoAiInstalled =>
      'Aún no tienes ninguna app de IA en el móvil. Instala una (es gratis) y luego vuelve a tocar «Escanear».';

  @override
  String lessonScreenInstallApp(String app) {
    return 'Instalar $app';
  }

  @override
  String get lessonScreenFreeInPlayStore => 'gratis en Play Store';

  @override
  String get lessonScreenAiDisclaimer =>
      'Vokabeltrainer no está vinculado con estas apps ni con sus proveedores. Para ellas rige su propia política de privacidad.';

  @override
  String lessonScreenRecognized(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count palabras reconocidas',
      one: '1 palabra reconocida',
    );
    return '$_temp0';
  }

  @override
  String lessonScreenDuplicatesSkipped(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ya estaban en la lección y se saltarán.',
      one: '1 ya estaba en la lección y se saltará.',
    );
    return '$_temp0';
  }

  @override
  String lessonScreenImportButton(int count) {
    return 'Añadir $count';
  }

  @override
  String get lessonSetupTitleNew => 'Nueva lección';

  @override
  String get lessonSetupTitleEdit => 'Ajustes de la lección';

  @override
  String get lessonSetupNameLabel => 'Nombre de la lección';

  @override
  String get lessonSetupNameHint => 'p. ej. Unit 3 o Lección 5';

  @override
  String get lessonSetupLanguageLabel => 'Idioma de las palabras';

  @override
  String get lessonSetupTranslationLabel => 'Idioma de la traducción';

  @override
  String get lessonSetupFieldsTitle => '¿Qué vas a introducir?';

  @override
  String get lessonSetupFieldsHelp =>
      'Esto define cómo se escribe, se escanea con IA y se hace el test.';

  @override
  String get lessonSetupWord => 'Palabra';

  @override
  String get lessonSetupTranslation => 'Traducción';

  @override
  String get lessonSetupAlwaysIncluded => 'siempre incluido';

  @override
  String get lessonSetupForms => 'Formas';

  @override
  String get lessonSetupFormsSubtitle =>
      'p. ej. formas principales, genitivo, género';

  @override
  String get lessonSetupWhichForms => '¿Qué formas?';

  @override
  String get lessonSetupAllForms => 'Todo';

  @override
  String get lessonSetupAllFormsHelp =>
      'Todo lo que pone el libro sobre la palabra: formas principales, género, comparativo, caso, plural y más.';

  @override
  String get lessonSetupPickOneKind => 'Elige al menos un tipo.';

  @override
  String get lessonSetupExtrasTitle => 'Otros (hasta 3)';

  @override
  String get lessonSetupExtrasHelp =>
      'Campos propios, p. ej. frase de ejemplo o truco para recordar.';

  @override
  String lessonSetupExtraFieldLabel(int number) {
    return 'Otro $number: nombre';
  }

  @override
  String lessonSetupExtraDefaultName(int number) {
    return 'Otro $number';
  }

  @override
  String get lessonSetupRemove => 'Quitar';

  @override
  String get lessonSetupExtraChip => 'Otro';

  @override
  String get lessonSetupSuggestionExample => 'Frase de ejemplo';

  @override
  String get lessonSetupSuggestionMnemonic => 'Truco para recordar';

  @override
  String get lessonSetupSuggestionPronunciation => 'Pronunciación';

  @override
  String get lessonSetupSuggestionOpposite => 'Contrario';

  @override
  String get lessonsTabNewLessonHintTitle => 'Nueva lección';

  @override
  String get lessonsTabNewLessonHintText =>
      'Ponle un nombre a la lección y elige el idioma. Luego decides qué quieres aprender: la palabra y la traducción siempre están, y si quieres, también formas y hasta tres campos propios como frase de ejemplo o truco para recordar.';

  @override
  String get lessonsTabEmptyTitle => 'Aún no hay lecciones';

  @override
  String get lessonsTabEmptyText =>
      'Crea tu primera lección. El vocabulario lo escribes tú, o haces una foto de la página de tu libro y dejas que una app de IA como ChatGPT o Gemini lo lea.';

  @override
  String get lessonsTabNewLesson => 'Nueva lección';

  @override
  String lessonsTabCardStats(int count, int known) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count palabras',
      one: '1 palabra',
    );
    return '$_temp0 · $known sabidas';
  }

  @override
  String get vocabFormDialogTitleNew => 'Nueva palabra';

  @override
  String get vocabFormDialogTitleEdit => 'Editar palabra';

  @override
  String get vocabFormDialogWord => 'Palabra';

  @override
  String vocabFormDialogWordWithLanguage(String language) {
    return 'Palabra ($language)';
  }

  @override
  String vocabFormDialogTranslation(String language) {
    return 'Traducción ($language)';
  }

  @override
  String get vocabFormDialogForms => 'Formas';

  @override
  String get vocabFormDialogAllForms => 'todas las formas';

  @override
  String get introWelcomeTitle => 'Te damos la bienvenida a Vokabeltrainer';

  @override
  String get introWelcomeText =>
      'Aprende vocabulario en cualquier idioma, con tarjetas, tests y repaso inteligente. Cada palabra vuelve justo antes de que la olvides.';

  @override
  String get introScanTitle => 'Escribir o escanear';

  @override
  String get introScanText =>
      'Crea lecciones y escribe el vocabulario. O haz una foto de la lista de tu libro: una app de IA como ChatGPT o Gemini la lee por ti.';

  @override
  String get introTestTitle => 'Listo para el examen';

  @override
  String get introTestText =>
      'Indica la fecha de tu examen de vocabulario. La app reparte las palabras en los días anteriores y te recuerda estudiar, nunca después de las 21:00.';

  @override
  String get introPrivacyTitle => 'Todo se queda en tu móvil';

  @override
  String get introPrivacyText =>
      'Sin cuenta, sin nube: tus lecciones y tu progreso no se guardan en ningún sitio de internet. Solo cuando escaneas, la foto va a la app de IA que tú eliges.';

  @override
  String get introFreeTitle => 'Totalmente gratis';

  @override
  String get introFreeText =>
      'No gano nada con esta app: sin anuncios, sin compras dentro de la app, sin suscripción. Está aquí simplemente para aprender.';

  @override
  String get privacyScreenTitle => 'Privacidad';

  @override
  String get nameDialogWelcome => '¡Bienvenido/a!';

  @override
  String get nameDialogTitle => 'Tu nombre';

  @override
  String get nameDialogIntro =>
      '¿Cómo te llamas? Así la app te saluda por tu nombre, también en los recordatorios. Es opcional.';

  @override
  String get nameDialogLabel => 'Tu nombre (opcional)';

  @override
  String get nameDialogLocalOnly => 'Tu nombre solo se guarda en este móvil.';

  @override
  String get hintDialogDontShowAgain => 'No volver a mostrar';

  @override
  String get formKindVerbLabel => 'Formas verbales';

  @override
  String get formKindNounLabel => 'Formas del sustantivo';

  @override
  String get formKindPluralLabel => 'Plural';

  @override
  String get formKindAdjectiveLabel => 'Formas del adjetivo';

  @override
  String get formKindComparisonLabel => 'Comparativo';

  @override
  String get formKindGenderLabel => 'Género';

  @override
  String get formKindInflectionClassLabel => 'Declinación/Conjugación';

  @override
  String get formKindGovernmentLabel => 'Caso/Preposición';

  @override
  String get formKindWordClassLabel => 'Categoría gramatical';

  @override
  String get formKindVerbExample =>
      'formas principales o formas irregulares, p. ej. vocō, vocāvī, vocātum o go, went, gone';

  @override
  String get formKindNounExample => 'p. ej. genitivo: lūnae';

  @override
  String get formKindPluralExample => 'p. ej. mice, les chevaux';

  @override
  String get formKindAdjectiveExample =>
      'formas de los otros géneros, p. ej. bonus, -a, -um';

  @override
  String get formKindComparisonExample => 'p. ej. good, better, best';

  @override
  String get formKindGenderExample => 'en sustantivos, p. ej. m, f, n o el/la';

  @override
  String get formKindInflectionClassExample =>
      'p. ej. declinación en -a, conjugación en -e';

  @override
  String get formKindGovernmentExample =>
      'qué caso o qué preposición sigue, p. ej. + dat., pensar en';

  @override
  String get formKindWordClassExample =>
      'p. ej. verbo, sustantivo, adjetivo, adverbio';

  @override
  String get vocabModelDefaultBoxName => 'Vocabulario';

  @override
  String get aiScanColumnWord => 'Palabra';

  @override
  String get aiScanColumnTranslation => 'Traducción';

  @override
  String get aiScanColumnForms => 'Formas';

  @override
  String get aiScanForeignLanguage => 'el idioma extranjero';

  @override
  String aiScanPromptIntro(String language, String translationLanguage) {
    return 'Lee todo el vocabulario de la foto (palabras en $language, traducción en $translationLanguage).';
  }

  @override
  String get aiScanPromptAnswerOnly =>
      'Responde SOLO con un único bloque de código exactamente en este formato, sin más texto:';

  @override
  String get aiScanPromptRules => 'Reglas:';

  @override
  String aiScanPromptRuleColumns(int count, String columns) {
    return 'Una línea por palabra, columnas separadas con \" | \", siempre exactamente $count columnas en este orden: $columns.';
  }

  @override
  String aiScanPromptRuleNoHeader(String marker) {
    return 'Omite la línea con los nombres de las columnas; la primera línea es siempre $marker.';
  }

  @override
  String aiScanPromptRuleWord(String column) {
    return '$column: escrita como en la foto, con todos los caracteres especiales y acentos.';
  }

  @override
  String aiScanPromptRuleTranslation(String column) {
    return '$column: como en la foto; separa varios significados con coma.';
  }

  @override
  String aiScanPromptRuleAllForms(String column) {
    return '$column: TODOS los datos gramaticales que aparecen en la foto junto a la palabra, sin omitir nada. Por ejemplo (pero no solo):';
  }

  @override
  String get aiScanPromptRuleAllFormsMore =>
      'También va aquí todo lo demás que pertenezca a la palabra (abreviaturas, notas entre paréntesis). Separa varios datos con coma.';

  @override
  String get aiScanPromptRuleAllFormsNone =>
      'Si en la foto no hay ningún dato sobre la palabra, pon \"-\".';

  @override
  String aiScanPromptRuleSomeForms(String column) {
    return '$column: solo estos datos, varios separados con coma:';
  }

  @override
  String aiScanPromptRuleOmit(String kinds) {
    return 'Omitir: $kinds.';
  }

  @override
  String get aiScanPromptRuleSomeFormsNone =>
      'Si una palabra no tiene esos datos (p. ej. un adverbio), pon \"-\".';

  @override
  String aiScanPromptRuleExtra(String label) {
    return '$label: de la foto; si no aparece nada, pon \"-\".';
  }

  @override
  String get aiScanPromptRuleMissing =>
      'Si falta un dato, escribe \"-\". No inventes nada que no esté en la foto.';

  @override
  String get aiScanPromptRuleNoPipe => 'No uses \"|\" dentro de una columna.';

  @override
  String get settingsThemeDark => 'Modo oscuro';

  @override
  String get settingsThemeLight => 'Modo claro';

  @override
  String get settingsThemeSystem => 'Sistema (automático)';

  @override
  String get settingsThemeDarkDesc =>
      'Fondo oscuro con colores neón brillantes.';

  @override
  String get settingsThemeLightDesc =>
      'Diseño claro y minimalista en blancos y grises claros.';

  @override
  String get settingsThemeSystemDesc => 'Sigue el ajuste de tu dispositivo.';

  @override
  String get settingsAccentViolet => 'Violeta neón';

  @override
  String get settingsAccentCyan => 'Cian neón';

  @override
  String get settingsAccentEmerald => 'Esmeralda neón';

  @override
  String get settingsAccentOrange => 'Naranja neón';

  @override
  String get settingsAccentPink => 'Rosa neón';

  @override
  String get settingsDirectionForward => 'Palabra → Traducción';

  @override
  String get settingsDirectionBackward => 'Traducción → Palabra';

  @override
  String get settingsDirectionForwardDesc =>
      'La app muestra la palabra y tú respondes el significado.';

  @override
  String get settingsDirectionBackwardDesc =>
      'La app muestra la traducción y tú respondes la palabra.';

  @override
  String get settingsAnswerTranslationOnly => 'Solo traducción';

  @override
  String get settingsAnswerWordOnly => 'Solo palabra';

  @override
  String get settingsAnswerFormsOnly => 'Solo formas';

  @override
  String get settingsAnswerBoth => 'Ambas';

  @override
  String get settingsAnswerTranslationOnlyDesc =>
      'Respondes solo la traducción.';

  @override
  String get settingsAnswerWordOnlyDesc => 'Respondes solo la palabra.';

  @override
  String get settingsAnswerFormsOnlyDesc => 'Respondes solo las formas.';

  @override
  String get settingsAnswerBothTranslationDesc =>
      'Respondes la traducción y las formas.';

  @override
  String get settingsAnswerBothWordDesc => 'Respondes la palabra y las formas.';

  @override
  String get settingsNameTitle => 'Tu nombre';

  @override
  String get settingsNameEmpty => 'Sin indicar · solo se guarda en este móvil';

  @override
  String settingsNameSaved(String name) {
    return '$name · solo se guarda en este móvil';
  }

  @override
  String get settingsDesignTitle => 'Diseño';

  @override
  String get settingsAccentTitle => 'Color de acento (neón)';

  @override
  String get settingsAccentHint =>
      'El color de acento se usa en botones, interruptores y resaltados. En modo oscuro los colores brillan; en modo claro se oscurecen un poco automáticamente para que todo se lea bien.';

  @override
  String get settingsDirectionTitle => 'Dirección del idioma';

  @override
  String get settingsAnswerModeTitle => 'Qué se pregunta en el test';

  @override
  String get settingsAskExtrasTitle => 'Preguntar también los otros campos';

  @override
  String get settingsAskExtrasSubtitle =>
      'p. ej. frase de ejemplo o truco para recordar, si la palabra los tiene.';

  @override
  String get settingsFormsHint =>
      'Las formas son, p. ej., formas principales, genitivo o género. Si una palabra no tiene formas, solo se pregunta la traducción automáticamente. Este ajuste se aplica al modo test.';

  @override
  String get settingsAboutTitle => 'Sobre la app';

  @override
  String get settingsShowIntro => 'Ver la introducción';

  @override
  String get settingsPrivacyTitle => 'Privacidad';

  @override
  String get settingsPrivacySubtitle => 'Todo se queda en tu móvil';

  @override
  String get settingsLicensesTitle => 'Licencias';

  @override
  String get settingsLicensesSubtitle => 'Software utilizado';

  @override
  String get settingsLicensesLegalese =>
      'Gratis, sin anuncios y sin compras dentro de la app.';

  @override
  String get backupExported => 'Descargando la copia de seguridad.';

  @override
  String get backupCopied =>
      'Copia de seguridad copiada al portapapeles: pégala, p. ej., en una nota.';

  @override
  String get backupRestoreTitle => '¿Restaurar la copia de seguridad?';

  @override
  String get backupRestoreMessage =>
      'Tu progreso actual y tus listas de práctica se sustituirán por la copia de seguridad.';

  @override
  String get backupRestoreAction => 'Restaurar';

  @override
  String get backupRestored => 'Copia de seguridad restaurada. ✅';

  @override
  String get backupResetTitle => '¿Reiniciar el progreso?';

  @override
  String get backupResetMessage =>
      'Se borrarán todos los niveles y fechas de repaso. Las lecciones y las listas de práctica se mantienen.';

  @override
  String get backupResetAction => 'Reiniciar';

  @override
  String get backupResetDone => 'Progreso reiniciado.';

  @override
  String get backupPasteTitle => 'Pegar copia de seguridad';

  @override
  String get backupTitle => 'Datos y copia de seguridad';

  @override
  String get backupHint =>
      'Tu progreso solo se guarda en este dispositivo. Haz una copia de seguridad de vez en cuando: así también puedes pasarte a otro dispositivo.';

  @override
  String get backupExportTitle => 'Exportar copia de seguridad';

  @override
  String get backupExportFile => 'Descargar como archivo';

  @override
  String get backupExportClipboard => 'Copiar al portapapeles';

  @override
  String get backupImportTitle => 'Importar copia de seguridad';

  @override
  String get backupImportFile => 'Elegir archivo de copia';

  @override
  String get backupImportPaste => 'Pegar el texto guardado';

  @override
  String get backupResetTile => 'Reiniciar el progreso';

  @override
  String get storeBackupInvalid =>
      'No es un archivo de copia de seguridad válido.';

  @override
  String get storeBackupCorrupt =>
      'El archivo de copia de seguridad está dañado.';

  @override
  String get notifSectionBlocked =>
      'Las notificaciones están bloqueadas. Permítelas para Vokabeltrainer en los ajustes de Android.';

  @override
  String get notifSectionTitle => 'Recordatorios';

  @override
  String get notifSectionAndroidOnly =>
      '📱 Los recordatorios de verdad están en la app de Android: varias veces al día, con números actualizados y nunca después de las 21:00.';

  @override
  String get notifSectionSwitchTitle => 'Recordatorios de estudio';

  @override
  String get notifSectionSwitchSubtitle =>
      'Con números actualizados, nunca después de las 21:00. Si ya lo has estudiado todo hoy, no te molestamos.';

  @override
  String get notifSectionHowOften => '¿Cuántas veces al día?';

  @override
  String notifSectionTimes(String times) {
    return 'a las $times';
  }

  @override
  String get notifSectionSendTest => 'Enviar notificación de prueba';

  @override
  String get notifChannelName => 'Recordatorios de estudio';

  @override
  String get notifChannelDescription =>
      'Te recuerda estudiar vocabulario (nunca después de las 21:00).';

  @override
  String get notifTestTitle => '👋 ¡Hola! Así son tus recordatorios';

  @override
  String get notifTestBody =>
      'Te aviso cuando haya palabras esperándote, nunca después de las 21:00.';

  @override
  String notifFirst1Title(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '🧠 $n palabras te esperan',
      one: '🧠 1 palabra te espera',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst1Body => 'Bastan unos minutos. ¡Vamos!';

  @override
  String get notifFirst2Title => '⚔️ ¡Las palabras atacan!';

  @override
  String notifFirst2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Hoy tienes que vencer a $n.',
      one: 'Hoy tienes que vencer a 1.',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst3Title => '🕵️ Misión secreta para hoy';

  @override
  String notifFirst3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Descifrar $n palabras. ¿Preparado?',
      one: 'Descifrar 1 palabra. ¿Preparado?',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst4Title => '📚 ¡Tus palabras te llaman!';

  @override
  String notifFirst4Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Hoy tocan $n palabras.',
      one: 'Hoy toca 1 palabra.',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst5Title => '🎯 Misión del día';

  @override
  String notifFirst5Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Descifra $n palabras. ¿Puedes con todas?',
      one: 'Descifra 1 palabra. ¿Lo consigues?',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst6Title => '🦉 El búho del estudio tiene hambre';

  @override
  String notifFirst6Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '¡Dale de comer $n palabras!',
      one: '¡Dale de comer 1 palabra!',
    );
    return '$_temp0';
  }

  @override
  String get notifFirst7Title => '🎲 ¿Una apuesta?';

  @override
  String notifFirst7Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Apuesto a que te sabes las $n palabras en 5 minutos.',
      one: 'Apuesto a que te sabes esa palabra en 5 minutos.',
    );
    return '$_temp0';
  }

  @override
  String notifNamed1Title(String name) {
    return '👋 ¡Hola, $name!';
  }

  @override
  String notifNamed1Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Hoy te esperan $n palabras.',
      one: 'Hoy te espera 1 palabra.',
    );
    return '$_temp0';
  }

  @override
  String notifNamed2Title(String name) {
    return '🎯 $name, tu misión de hoy';
  }

  @override
  String notifNamed2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Descifra $n palabras. ¡Vamos!',
      one: 'Descifra 1 palabra. ¡Vamos!',
    );
    return '$_temp0';
  }

  @override
  String notifNamed3Title(String name) {
    return '🧠 $name, ¿estudiamos un rato?';
  }

  @override
  String notifNamed3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Hoy tocan $n palabras.',
      one: 'Hoy toca 1 palabra.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle1Title => '⏰ Psst… tus palabras siguen esperando';

  @override
  String notifMiddle1Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Hoy aún te quedan $n.',
      one: 'Hoy aún te queda 1.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle2Title => '🐢 Las palabras se impacientan';

  @override
  String notifMiddle2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Aún esperan $n: ¡solo unos minutos!',
      one: 'Aún espera 1: ¡solo unos minutos!',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle3Title => '💬 Tus tarjetas preguntan dónde estás';

  @override
  String notifMiddle3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Aún quedan $n palabras.',
      one: 'Aún queda 1 palabra.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle4Title => '🧩 ¿Casi se te olvida?';

  @override
  String notifMiddle4Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Hoy aún hay que repasar $n palabras.',
      one: 'Hoy aún hay que repasar 1 palabra.',
    );
    return '$_temp0';
  }

  @override
  String get notifMiddle5Title => '🚀 ¿Un empujoncito rápido?';

  @override
  String notifMiddle5Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n tarjetas y listo.',
      one: '1 tarjeta y listo.',
    );
    return '$_temp0';
  }

  @override
  String get notifLast1Title => '🌙 ¡Última oportunidad de hoy!';

  @override
  String notifLast1Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Quedan $n palabras y terminas por hoy.',
      one: 'Queda 1 palabra y terminas por hoy.',
    );
    return '$_temp0';
  }

  @override
  String get notifLast2Title => '⌛ El día casi se acaba';

  @override
  String notifLast2Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n palabras y terminas por hoy.',
      one: '1 palabra y terminas por hoy.',
    );
    return '$_temp0';
  }

  @override
  String get notifLast3Title => '🛡️ Recta final de hoy';

  @override
  String notifLast3Body(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Quedan $n palabras para terminar.',
      one: 'Queda 1 palabra para terminar.',
    );
    return '$_temp0';
  }

  @override
  String notifStreakTitle(int streak) {
    return '🔥 ¡Tu racha de $streak días está en peligro!';
  }

  @override
  String notifStreakTitleNamed(String name, int streak) {
    return '🔥 $name, ¡tu racha de $streak días está en peligro!';
  }

  @override
  String notifStreakBody(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Quedan $n palabras: estudia hoy para no perderla.',
      one: 'Queda 1 palabra: estudia hoy para no perderla.',
    );
    return '$_temp0';
  }

  @override
  String notifExamTomorrowTitle(String list) {
    return '🚨 ¡Mañana es «$list»!';
  }

  @override
  String notifExamTomorrowBodyLast(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Última oportunidad: ¡repasa $n palabras más!',
      one: 'Última oportunidad: ¡repasa 1 palabra más!',
    );
    return '$_temp0';
  }

  @override
  String notifExamTomorrowBody(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Hoy es el último día de estudio: te esperan $n palabras.',
      one: 'Hoy es el último día de estudio: te espera 1 palabra.',
    );
    return '$_temp0';
  }

  @override
  String notifExamSoonTitle(int days, String list) {
    return '⚡ Quedan $days días para «$list»';
  }

  @override
  String notifExamSoonBody(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '¡Recta final! Hoy tocan $n palabras.',
      one: '¡Recta final! Hoy toca 1 palabra.',
    );
    return '$_temp0';
  }

  @override
  String notifExamDayTitle(String list) {
    return '🍀 ¡Hoy es «$list»!';
  }

  @override
  String get notifExamDayBody =>
      'Has practicado: ahora demuestra lo que sabes. ¡Mucha suerte! 💪';

  @override
  String get analyseEmptyTitle => 'Aún no hay listas de práctica';

  @override
  String get analyseEmptyText =>
      'Crea una lista de práctica para ver aquí tu progreso.';

  @override
  String analyseSummary(int total, int good, int neutral, int weak) {
    String _temp0 = intl.Intl.pluralLogic(
      total,
      locale: localeName,
      other: '$total palabras',
      one: '1 palabra',
    );
    return '$_temp0 · $good bien · $neutral neutras · $weak flojas';
  }

  @override
  String analyseGoalUntil(String date) {
    return 'Objetivo hasta el $date';
  }

  @override
  String get analyseOverallGoal => 'Objetivo total';

  @override
  String analyseKnown(int known, int total) {
    return '$known/$total palabras sabidas';
  }

  @override
  String get analyseDailyGoal => 'Objetivo diario';

  @override
  String get analyseAllDone => 'todo hecho';

  @override
  String analyseLearnedToday(int learned, int target) {
    return '$learned/$target estudiadas hoy';
  }

  @override
  String get analyseAllKnown => '¡Te sabes todas las palabras! 🎉';

  @override
  String analyseRemaining(int days, int remaining) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Quedan $days días',
      one: 'Queda 1 día',
    );
    String _temp1 = intl.Intl.pluralLogic(
      remaining,
      locale: localeName,
      other: '$remaining palabras pendientes',
      one: '1 palabra pendiente',
    );
    return '$_temp0 · $_temp1.';
  }

  @override
  String get vocabDetailNeverPracticed => 'Nunca practicada';

  @override
  String vocabDetailMemoryDue(int percent, int reps) {
    return 'Memoria: $percent % · toca ahora · practicada $reps×';
  }

  @override
  String vocabDetailMemoryNext(int percent, String interval, int reps) {
    return 'Memoria: $percent % · vuelve en $interval · practicada $reps×';
  }

  @override
  String get vocabDetailNoHistory => 'Aún no hay historial.';

  @override
  String get vocabDetailWorse => 'Peor';

  @override
  String get vocabDetailBetter => 'Mejor';

  @override
  String get levelVeryGood => 'Muy bien';

  @override
  String get levelGood => 'Bien';

  @override
  String get levelQuiteGood => 'Bastante bien';

  @override
  String get levelOkay => 'Más o menos bien';

  @override
  String get levelSlightlyGood => 'Algo bien';

  @override
  String get levelNeutral => 'Neutral';

  @override
  String get levelSlightlyWeak => 'Algo flojo';

  @override
  String get levelWeak => 'Flojo';

  @override
  String get levelQuiteWeak => 'Bastante flojo';

  @override
  String get levelBad => 'Mal';

  @override
  String get levelVeryBad => 'Muy mal';

  @override
  String get tutorialTitle => 'Así funciona la app';

  @override
  String get tutorialPage1Title => 'Así funciona Vokabeltrainer';

  @override
  String get tutorialPage1Text =>
      'Esta app te ayuda a aprender vocabulario en cualquier idioma, con tarjetas, tests y repaso inteligente. Desliza a la izquierda o toca «Siguiente» para verlo todo.';

  @override
  String get tutorialPage2Title => 'Crear una lección';

  @override
  String get tutorialPage2Text =>
      'En la pestaña «Lecciones» creas una lección: nombre, idioma y qué quieres aprender. Palabra y traducción, y si quieres, formas y hasta tres campos propios como frase de ejemplo o truco para recordar.';

  @override
  String get tutorialPage3Title => 'Escanear vocabulario';

  @override
  String get tutorialPage3Text =>
      'Escribe tú el vocabulario, o toca «Escanear» y haz una foto de la lista de tu libro. Una app de IA como ChatGPT o Gemini la lee. Copia su respuesta, vuelve aquí y listo.';

  @override
  String get tutorialPage4Title => 'Crear listas de práctica';

  @override
  String get tutorialPage4Text =>
      'En el inicio, toca «Listas de práctica» y luego «Nueva lista». Ponle un nombre, si quieres la fecha de tu examen de vocabulario, y elige las palabras de tus lecciones.';

  @override
  String get tutorialPage5Title => 'Estudiar cada día';

  @override
  String get tutorialPage5Text =>
      'En el inicio, bajo «Hoy», ves lo que toca de tus listas: primero los repasos pendientes y además hasta 15 palabras nuevas. Toca «¡Vamos!» para empezar.';

  @override
  String get tutorialPage6Title => 'Tarjetas';

  @override
  String get tutorialPage6Text =>
      'Toca la tarjeta para darle la vuelta y evalúate con sinceridad: «Otra vez», «Difícil», «Bien» o «Fácil». Debajo de cada botón pone cuándo vuelve la tarjeta. En el PC: barra espaciadora para girar, 1–4 para evaluar.';

  @override
  String get tutorialPage7Title => 'Repaso inteligente';

  @override
  String get tutorialPage7Text =>
      'La app te pregunta cada palabra justo antes de que la olvides (repetición espaciada con FSRS, como en Anki). Las palabras que dominas salen menos y las difíciles, más. Estudia un poco cada día: así mantienes viva tu 🔥 racha.';

  @override
  String get tutorialPage8Title => 'El examen a la vista';

  @override
  String get tutorialPage8Text =>
      'Al crear una lista, indica la fecha de tu examen. La app reparte las palabras nuevas en los días de modo que termines el día ANTES del examen; ese día se repasa todo una vez más. Cuanto más cerca está el examen, más a menudo salen las palabras.';

  @override
  String get tutorialPage9Title => 'Recordatorios';

  @override
  String get tutorialPage9Text =>
      'La app te avisa hasta 3 veces al día, con los números actualizados y nunca después de las 21:00. Si ya lo has estudiado todo hoy, no te molesta. Puedes ajustarlo en Ajustes → Recordatorios.';

  @override
  String get tutorialPage10Title => 'Modo test';

  @override
  String get tutorialPage10Text =>
      'Aquí escribes tú la traducción y/o las formas, y si quieres, también los campos propios (Ajustes). Al comprobar, no importan las mayúsculas/minúsculas ni los artículos (el/la/los/las).';

  @override
  String get tutorialPage11Title => 'Ver tu progreso';

  @override
  String get tutorialPage11Text =>
      'En la pestaña «Análisis» ves cada palabra con su nivel: 5 tonos de verde (bien), gris (neutral) y 5 tonos de rojo (flojo). Toca una palabra para ver la gráfica de su historial y subirla o bajarla a mano con +/−.';

  @override
  String get tutorialPage12Title => 'Tus datos';

  @override
  String get tutorialPage12Text =>
      'Todo se guarda solo en este dispositivo, sin cuenta y sin internet. Haz de vez en cuando una copia de seguridad en los ajustes. Así también puedes pasarte a otro dispositivo.';

  @override
  String get dashboardGreetingNight => '¿Aún despierto? 🌙';

  @override
  String dashboardGreetingNightName(String name) {
    return '¿Aún despierto, $name? 🌙';
  }

  @override
  String get dashboardGreetingMorning => '¡Buenos días! ☀️';

  @override
  String dashboardGreetingMorningName(String name) {
    return '¡Buenos días, $name! ☀️';
  }

  @override
  String get dashboardGreetingDay => '¡Hola! 👋';

  @override
  String dashboardGreetingDayName(String name) {
    return '¡Hola, $name! 👋';
  }

  @override
  String get dashboardGreetingEvening => '¡Buenas tardes! 🌆';

  @override
  String dashboardGreetingEveningName(String name) {
    return '¡Buenas tardes, $name! 🌆';
  }

  @override
  String dashboardStreakLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'días de racha',
      one: 'día de racha',
    );
    return '$_temp0';
  }

  @override
  String get dashboardPracticedToday => 'practicadas hoy';

  @override
  String dashboardKnownOf(int total) {
    return 'de $total sabidas';
  }

  @override
  String get dashboardPracticeLists => 'Listas de práctica';

  @override
  String get dashboardPracticeListsEmpty =>
      'Prepara vocabulario para un examen';

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
  String get dashboardHelpTitle => 'Ayuda y guía';

  @override
  String get dashboardHelpSubtitle => 'Así funciona Vokabeltrainer';

  @override
  String get dashboardStreakNone => '¡Empieza hoy tu racha!';

  @override
  String get dashboardStreakFirstDay => 'Día 1 de tu racha. ¡Sigue así!';

  @override
  String dashboardStreakRun(int count) {
    return '🔥 ¡$count días seguidos estudiando!';
  }

  @override
  String get dashboardGetStarted => '¡Empieza!';

  @override
  String get dashboardNoListsHint =>
      'Crea ahora una lista de práctica: ponle un nombre y elige las palabras que quieres aprender.';

  @override
  String get dashboardNoLessonsHint =>
      'Primero crea una lección. El vocabulario lo escribes tú o lo escaneas de tu libro con una app de IA.';

  @override
  String get dashboardCreateList => 'Crear lista de práctica';

  @override
  String get dashboardCreateLesson => 'Crear lección';

  @override
  String get dashboardAllDone => '¡Todo hecho por hoy!';

  @override
  String get dashboardToday => 'Hoy';

  @override
  String dashboardDoneReviewed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hoy has completado $count preguntas. ¡Mañana más!',
      one: 'Hoy has completado 1 pregunta. ¡Mañana más!',
    );
    return '$_temp0';
  }

  @override
  String get dashboardNothingDue => 'Ahora mismo no toca nada. ¡Vuelve mañana!';

  @override
  String get dashboardDueLabel => 'repasar';

  @override
  String get dashboardNewLabel => 'nuevas';

  @override
  String get dashboardFromLists => 'De tus listas de práctica';

  @override
  String dashboardExamToday(String name) {
    return '¡Hoy es «$name»!';
  }

  @override
  String get dashboardExamTodayText =>
      'Has practicado: ahora demuestra lo que sabes. ¡Mucha suerte!';

  @override
  String dashboardExamTomorrow(String name) {
    return '¡Mañana es «$name»!';
  }

  @override
  String get dashboardExamTomorrowText =>
      'Hoy es el último día de estudio: se repasa todo una vez más.';

  @override
  String dashboardExamInDays(String name, int days) {
    return '«$name» en $days días';
  }

  @override
  String dashboardExamFinalSpurt(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '¡Recta final! Quedan $count días de estudio y cada uno cuenta.',
      one: '¡Recta final! Queda 1 día de estudio y cada uno cuenta.',
    );
    return '$_temp0';
  }

  @override
  String dashboardExamDaysLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Quedan $count días de estudio. La app reparte las palabras para que termines a tiempo.',
      one:
          'Queda 1 día de estudio. La app reparte las palabras para que termines a tiempo.',
    );
    return '$_temp0';
  }

  @override
  String get practiceListsNeedLesson =>
      'Primero crea en «Lecciones» una lección con vocabulario.';

  @override
  String practiceListsLimit(int max) {
    return 'Límite alcanzado: puedes tener como máximo $max listas a la vez.';
  }

  @override
  String get practiceListsCountdownPast => ' · terminado ✅';

  @override
  String get practiceListsCountdownToday => ' · ¡hoy! 🍀';

  @override
  String get practiceListsCountdownTomorrow => ' · ¡mañana!';

  @override
  String practiceListsCountdownDays(int days) {
    return ' · quedan $days días';
  }

  @override
  String get practiceListsDueDateTitle =>
      '¿Cuándo es el examen de vocabulario?';

  @override
  String get practiceListsChangeDueDate => 'Cambiar fecha del examen';

  @override
  String get practiceListsDueDateHint =>
      'Opcional. La app reparte las palabras para que te lo sepas todo el día antes del examen; el mismo día del examen ya no tienes que practicar.';

  @override
  String get practiceListsPickDate => 'Elegir fecha';

  @override
  String get practiceListsRemoveDate => 'Quitar';

  @override
  String practiceListsNotifyOnSnack(String name) {
    return 'Recordatorios para «$name» activados.';
  }

  @override
  String practiceListsNotifyOffSnack(String name) {
    return 'Ya no hay recordatorios para «$name».';
  }

  @override
  String practiceListsDeleteTitle(String name) {
    return '¿Borrar «$name»?';
  }

  @override
  String get practiceListsDeleteText => 'Se quitará la lista de práctica.';

  @override
  String get practiceListsNoVocabs => 'Esta lista no tiene palabras.';

  @override
  String get practiceListsTitle => 'Tus listas de práctica';

  @override
  String get practiceListsNew => 'Nueva lista';

  @override
  String get practiceListsEmptyTitle => 'Aún no hay listas de práctica';

  @override
  String get practiceListsEmptyText =>
      'Crea tu primera lista con el botón de abajo.';

  @override
  String practiceListsSubtitleTest(String vocabs, String date) {
    return '$vocabs · Examen: $date';
  }

  @override
  String get practiceListsNotifyDisable => 'Desactivar recordatorios';

  @override
  String get practiceListsNotifyEnable => 'Activar recordatorios';

  @override
  String get practiceListsNameDialogTitle => 'Nueva lista de práctica';

  @override
  String get practiceListsNameLabel => 'Nombre de la lista';

  @override
  String get practiceListsNameHint => 'p. ej. Examen de vocabulario 1';

  @override
  String get practiceNothingDue =>
      'Por hoy no toca nada más. ¡Genial! 😎 Elige «Todas» si quieres practicar igualmente.';

  @override
  String get practiceNoWeak => 'No hay palabras flojas. 😎';

  @override
  String get practiceTitle => 'Elegir modo';

  @override
  String practiceSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count palabras seleccionadas',
      one: '1 palabra seleccionada',
    );
    return '$_temp0';
  }

  @override
  String get practiceModeFlashcards => 'Tarjetas';

  @override
  String get practiceModeTest => 'Test';

  @override
  String get practiceWhichVocabs => '¿Qué palabras?';

  @override
  String get practiceFilterSmart => 'Pendientes y nuevas';

  @override
  String get practiceFilterAll => 'Todas';

  @override
  String get practiceFilterWeak => 'Flojas';

  @override
  String practicePlanSummary(int due, int fresh) {
    return '$due pendientes · $fresh nuevas';
  }

  @override
  String practicePlanSummaryLater(int due, int fresh, int later) {
    return '$due pendientes · $fresh nuevas ($later más adelante)';
  }

  @override
  String get practiceFlashcardsHint =>
      'Se muestra una palabra. Destapas el significado y te evalúas tú: Otra vez, Difícil, Bien o Fácil.';

  @override
  String get practiceTestHint =>
      'Se muestra una palabra. Escribes tú la traducción y las formas.';

  @override
  String get practiceSmartHint =>
      '«Pendientes y nuevas» usa repetición espaciada (FSRS): cada palabra vuelve justo antes de que la olvides. Si la lista tiene fecha de examen, las palabras nuevas se reparten en los días hasta la víspera y antes se repasa todo una vez más.';

  @override
  String get practiceStart => 'Empezar';

  @override
  String get flashcardWord => 'Palabra';

  @override
  String get flashcardTranslation => 'Traducción';

  @override
  String flashcardTitle(int current, int total) {
    return 'Tarjeta $current / $total';
  }

  @override
  String get flashcardTapToFlip => 'Toca para girar';

  @override
  String get flashcardFlip => 'Girar';

  @override
  String get flashcardRateAgain => 'Otra vez';

  @override
  String get flashcardRateHard => 'Difícil';

  @override
  String get flashcardRateGood => 'Bien';

  @override
  String get flashcardRateEasy => 'Fácil';

  @override
  String testTranslationLabel(String language) {
    return 'Traducción ($language)';
  }

  @override
  String get testWordLabel => 'Palabra';

  @override
  String testWordLabelWithLanguage(String language) {
    return 'Palabra ($language)';
  }

  @override
  String get testFormsLabel => 'Formas';

  @override
  String testTitle(int current, int total) {
    return 'Test $current / $total';
  }

  @override
  String get testTranslate => 'Traduce:';

  @override
  String testCorrectAnswer(String answer) {
    return 'Correcto: $answer';
  }

  @override
  String get testWrong => 'Incorrecto';

  @override
  String get testResultCorrect => '¡Correcto! 🎉';

  @override
  String get testResultWrong => 'Vaya, incorrecto.';

  @override
  String get testCheck => 'Comprobar';

  @override
  String get selectionColumnWord => 'Palabra';

  @override
  String get selectionColumnForms => 'Formas';

  @override
  String get selectionColumnTranslation => 'Traducción';

  @override
  String get selectionTitle => 'Elegir palabras';

  @override
  String get selectionMenuTooltip => 'Selección';

  @override
  String get selectionSelectAll => 'Seleccionar todas';

  @override
  String get selectionClear => 'Quitar selección';

  @override
  String selectionConfirm(String label, String vocabs) {
    return '$label ($vocabs)';
  }

  @override
  String get homeTabStart => 'Inicio';

  @override
  String get homeTabLessons => 'Lecciones';

  @override
  String get homeTabAnalysis => 'Análisis';

  @override
  String get sessionSummaryExcellent => '¡Excelente!';

  @override
  String get sessionSummaryGreat => '¡Muy bien hecho!';

  @override
  String get sessionSummaryGood => '¡Buena práctica!';

  @override
  String get sessionSummaryKeepGoing => '¡No te rindas!';

  @override
  String sessionSummaryScore(int correct, int total) {
    return '$correct de $total sabidas al primer intento.';
  }

  @override
  String get sessionSummaryScheduled =>
      'La app planifica automáticamente cuándo vuelve a salir cada palabra.';

  @override
  String get sessionSummaryRestart => 'Otra vez';

  @override
  String get changelogTitle => '¿Qué hay de nuevo?';

  @override
  String get changelogGotIt => '¡Entendido!';

  @override
  String get changelog6Title => '🔒 La privacidad de un vistazo';

  @override
  String get changelog6Text =>
      'En Ajustes → «Sobre la app» encuentras la política de privacidad y la introducción para volver a leerlas: todo se queda en tu móvil, y la app no tiene anuncios ni compras.';

  @override
  String get changelog5Title => '🤖 Escanear solo con apps de IA';

  @override
  String get changelog5Text =>
      'Al escanear, ahora solo ves apps de IA como ChatGPT o Gemini para elegir. Las instrucciones para la IA se envían directamente.';

  @override
  String get changelog4Title => '🧩 Más formas';

  @override
  String get changelog4Text =>
      'Nuevo en las formas: comparativo, caso/preposición, declinación/conjugación, categoría gramatical y plural. Con «Todo», la IA copia de verdad todo lo que pone el libro sobre la palabra.';

  @override
  String get changelog3Title => '👋 Con tu nombre';

  @override
  String get changelog3Text =>
      'Si quieres, la app te saluda por tu nombre, también en los recordatorios. Puedes cambiarlo en los ajustes.';

  @override
  String get changelog2Title => '💡 Consejos breves';

  @override
  String get changelog2Text =>
      'La primera vez, una ventanita te explica cómo crear una lección, escribir y escanear. Con «No volver a mostrar» desaparece.';

  @override
  String get changelog1Title => '📚 Lecciones en cualquier idioma';

  @override
  String get changelog1Text =>
      'Crea tus propias lecciones (inglés, francés, latín o lo que estés aprendiendo) y escribe el vocabulario o escanéalo del libro.';

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
    return '$n mes.';
  }

  @override
  String intervalYears(String n) {
    return '$n a.';
  }

  @override
  String get changelog7Title => '🌍 Ahora en 10 idiomas';

  @override
  String get changelog7Text =>
      'La app ya está en alemán, inglés, español, francés, italiano, portugués, polaco, turco, ruso y chino. Puedes cambiar el idioma en los ajustes.';

  @override
  String get appTitle => 'Vocabulario';
}
