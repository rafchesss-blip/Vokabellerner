import 'package:flutter_test/flutter_test.dart';

import 'package:vokabellerner/models/vocab.dart';
import 'package:vokabellerner/utils/ai_scan.dart';

void main() {
  Lesson lesson({
    bool forms = false,
    Set<FormKind> kinds = const {},
    List<String> extras = const [],
  }) =>
      Lesson(
        id: 'l',
        name: 'Lektion',
        boxes: [],
        language: 'Latein',
        hasForms: forms,
        formKinds: {...kinds},
        extraLabels: [...extras],
      );

  test('Anleitung nennt genau die gewählten Spalten', () {
    final l = lesson(
      forms: true,
      kinds: {FormKind.noun, FormKind.gender},
      extras: ['Beispielsatz'],
    );
    final prompt = buildScanPrompt(l);
    expect(prompt, contains('Wort | Übersetzung | Formen | Beispielsatz'));
    expect(prompt, contains('genau 4 Spalten'));
    expect(prompt, contains('Nomenformen'));
    expect(prompt, contains('Geschlecht'));
    expect(prompt, isNot(contains('- Verbformen')));
    expect(prompt, contains('Latein'));
    // Die Anleitung selbst wird nicht als Antwort erkannt.
    expect(looksLikeScanAnswer(prompt), isFalse);
  });

  test('Ohne Formen und Sonstiges nur zwei Spalten', () {
    final prompt = buildScanPrompt(lesson());
    expect(prompt, contains('genau 2 Spalten'));
    expect(prompt, isNot(contains('Formen')));
  });

  test('Antwort der KI wird gelesen – auch als Codeblock oder Tabelle', () {
    final l = lesson(forms: true, extras: ['Merkhilfe', 'Beispiel']);
    const answer = '''
Hier sind deine Vokabeln:
```
#VOKABELN
lūna | der Mond | lūnae, f | - | Lūna lucet.
| vocāre | rufen, nennen | vocō, vocāvī, vocātum | Vokal | - |
|---|---|---|---|---|
et | und | - | - | -
Wort | Übersetzung | Formen | Merkhilfe | Beispiel
kaputt
- | ohne Wort | - | - | -
```
''';
    expect(looksLikeScanAnswer(answer), isTrue);
    final vocabs = parseScanAnswer(answer, l);
    expect(vocabs.map((v) => v.latin), ['lūna', 'vocāre', 'et']);
    expect(vocabs[0].middleColumn, 'lūnae, f');
    expect(vocabs[0].extras.map((e) => '${e.label}=${e.value}'),
        ['Beispiel=Lūna lucet.']);
    expect(vocabs[1].german, 'rufen, nennen');
    expect(vocabs[1].extras.single.label, 'Merkhilfe');
    expect(vocabs[2].middleColumn, isNull);
    expect(vocabs[2].extras, isEmpty);
  });
}
