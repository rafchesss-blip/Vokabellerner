import '../l10n/l10n.dart';
import '../models/vocab.dart';

/// Vokabeln per KI-App (ChatGPT, Gemini, …) aus einem Foto ablesen.
///
/// Die App schickt das Foto zusammen mit [buildScanPrompt] an eine KI-App.
/// Die KI antwortet mit einer Zeile pro Vokabel; der Text kommt über die
/// Zwischenablage zurück und wird mit [parseScanAnswer] gelesen.

/// Erste Zeile jeder KI-Antwort – daran erkennt die App sie wieder.
const scanMarker = '#VOKABELN';

/// Spalten in der Reihenfolge, in der die KI sie liefern soll.
List<String> scanColumns(Lesson lesson) => [
      L.aiScanColumnWord,
      L.aiScanColumnTranslation,
      if (lesson.hasForms) L.aiScanColumnForms,
      ...lesson.extraLabels,
    ];

String _forms(Lesson lesson) {
  if (lesson.allForms) {
    return [
      '- ${L.aiScanPromptRuleAllForms(L.aiScanColumnForms)}',
      for (final k in FormKind.values) '  - ${k.label} (${k.example})',
      '  ${L.aiScanPromptRuleAllFormsMore}',
      '  ${L.aiScanPromptRuleAllFormsNone}',
    ].join('\n');
  }
  final kinds = lesson.formKinds;
  final lines = [
    for (final k in FormKind.values)
      if (kinds.contains(k)) '  - ${k.label} (${k.example})',
  ];
  final missing = FormKind.values
      .where((k) => !kinds.contains(k))
      .map((k) => k.label);
  return [
    '- ${L.aiScanPromptRuleSomeForms(L.aiScanColumnForms)}',
    ...lines,
    if (missing.isNotEmpty) '  ${L.aiScanPromptRuleOmit(missing.join(', '))}',
    '  ${L.aiScanPromptRuleSomeFormsNone}',
  ].join('\n');
}

/// Anleitung an die KI – passend zu den Feldern der Lektion.
String buildScanPrompt(Lesson lesson) {
  final cols = scanColumns(lesson);
  final language = lesson.language.trim().isEmpty
      ? L.aiScanForeignLanguage
      : lesson.language.trim();
  final example = cols.join(' | ');

  return '''
${L.aiScanPromptIntro(language, lesson.translationLanguage)}

${L.aiScanPromptAnswerOnly}

$scanMarker
$example

${L.aiScanPromptRules}
- ${L.aiScanPromptRuleColumns(cols.length, cols.join(', '))}
- ${L.aiScanPromptRuleNoHeader(scanMarker)}
- ${L.aiScanPromptRuleWord(L.aiScanColumnWord)}
- ${L.aiScanPromptRuleTranslation(L.aiScanColumnTranslation)}
${lesson.hasForms ? '${_forms(lesson)}\n' : ''}${[
    for (final l in lesson.extraLabels) '- ${L.aiScanPromptRuleExtra(l)}',
  ].join('\n')}
- ${L.aiScanPromptRuleMissing}
- ${L.aiScanPromptRuleNoPipe}
'''
      .replaceAll(RegExp(r'\n{3,}'), '\n\n')
      .trim();
}

/// Ob [text] die Anleitung selbst enthält – in irgendeiner App-Sprache,
/// falls die Sprache inzwischen gewechselt wurde. Dann ist es keine
/// Antwort der KI.
bool isScanPrompt(String text) => AppLocalizations.supportedLocales.any(
    (l) => text.contains(lookupAppLocalizations(l).aiScanPromptAnswerOnly));

/// Ob [text] wie eine KI-Antwort aussieht (und nicht z. B. die Anleitung).
bool looksLikeScanAnswer(String text) =>
    RegExp('^\\s*(```\\w*\\s*)?$scanMarker\\s*\$', multiLine: true)
        .hasMatch(text) &&
    !isScanPrompt(text);

/// Liest die Antwort der KI. Spalten wie in [scanColumns]; "-" heißt leer.
/// Zeilen ohne Wort oder Übersetzung werden übersprungen.
List<Vocab> parseScanAnswer(String text, Lesson lesson) {
  final lines = text.split(RegExp(r'\r?\n'));
  final start = lines.indexWhere((l) => l.trim() == scanMarker);
  final body = start < 0 ? lines : lines.sublist(start + 1);
  final result = <Vocab>[];

  String? clean(String s) {
    final t = s.trim();
    return t.isEmpty || t == '-' || t == '–' ? null : t;
  }

  for (final raw in body) {
    var line = raw.trim();
    if (line.startsWith('```')) continue;
    if (!line.contains('|')) continue;
    // Markdown-Tabellen: führendes/abschließendes „|" und Trennzeilen.
    if (line.startsWith('|')) line = line.substring(1);
    if (line.endsWith('|')) line = line.substring(0, line.length - 1);
    if (RegExp(r'^[\s|:-]+$').hasMatch(line)) continue;

    final parts = line.split('|').map((p) => p.trim()).toList();
    // Kopfzeile, falls die KI sie doch mitschickt.
    final head = parts.first.toLowerCase();
    if (head == 'wort' || head == L.aiScanColumnWord.toLowerCase()) continue;

    String? at(int i) => i < parts.length ? clean(parts[i]) : null;
    final word = at(0);
    final translation = at(1);
    if (word == null || translation == null) continue;

    var i = 2;
    final forms = lesson.hasForms ? at(i++) : null;
    final extras = <VocabExtra>[];
    for (final label in lesson.extraLabels) {
      final value = at(i++);
      if (value != null) extras.add(VocabExtra(label, value));
    }
    result.add(Vocab(
      id: newId(),
      latin: word,
      german: translation,
      middleColumn: forms,
      extras: extras,
    ));
  }
  return result;
}
