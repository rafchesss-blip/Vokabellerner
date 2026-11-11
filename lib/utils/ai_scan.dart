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
      'Wort',
      'Übersetzung',
      if (lesson.hasForms) 'Formen',
      ...lesson.extraLabels,
    ];

String _forms(Lesson lesson) {
  final kinds = lesson.formKinds.isEmpty
      ? FormKind.values.toSet()
      : lesson.formKinds;
  final lines = [
    for (final k in FormKind.values)
      if (kinds.contains(k)) '  - ${k.label} (${k.example})',
  ];
  final missing = FormKind.values
      .where((k) => k != FormKind.gender && !kinds.contains(k))
      .map((k) => k.label);
  return [
    '- Formen: nur diese Angaben, mehrere mit Komma getrennt:',
    ...lines,
    if (missing.isNotEmpty)
      '  Keine ${missing.join(' und keine ')} – dann steht dort "-".',
    '  Hat ein Wort keine solchen Formen (z. B. ein Adverb), steht dort "-".',
  ].join('\n');
}

/// Anleitung an die KI – passend zu den Feldern der Lektion.
String buildScanPrompt(Lesson lesson) {
  final cols = scanColumns(lesson);
  final language = lesson.language.trim().isEmpty
      ? 'der Fremdsprache'
      : lesson.language.trim();
  final example = [
    'Wort',
    'Übersetzung',
    if (lesson.hasForms) 'Formen',
    for (final l in lesson.extraLabels) l,
  ].join(' | ');

  return '''
Lies alle Vokabeln auf dem Foto ab (Wörter auf $language, Übersetzung auf ${lesson.translationLanguage}).

Antworte NUR mit einem einzigen Codeblock in genau diesem Format, ohne weiteren Text:

$scanMarker
$example

Regeln:
- Eine Zeile pro Vokabel, die Spalten mit " | " getrennt, immer genau ${cols.length} Spalten in dieser Reihenfolge: ${cols.join(', ')}.
- Die Zeile mit den Spaltennamen weglassen, die erste Zeile ist immer $scanMarker.
- Wort: so geschrieben wie im Foto, mit allen Sonderzeichen und Akzenten.
- Übersetzung: wie im Foto; mehrere Bedeutungen mit Komma trennen.
${lesson.hasForms ? '${_forms(lesson)}\n' : ''}${[
    for (final l in lesson.extraLabels)
      '- $l: aus dem Foto; steht dort nichts, dann "-".',
  ].join('\n')}
- Fehlt eine Angabe, schreib "-". Erfinde nichts, was nicht im Foto steht.
- Kein "|" innerhalb einer Spalte verwenden.
'''
      .replaceAll(RegExp(r'\n{3,}'), '\n\n')
      .trim();
}

/// Ob [text] wie eine KI-Antwort aussieht (und nicht z. B. die Anleitung).
bool looksLikeScanAnswer(String text) =>
    RegExp('^\\s*(```\\w*\\s*)?$scanMarker\\s*\$', multiLine: true)
        .hasMatch(text) &&
    !text.contains('Antworte NUR');

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
    if (parts.first.toLowerCase() == 'wort') continue;

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
