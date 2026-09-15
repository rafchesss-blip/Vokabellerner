import 'package:flutter_test/flutter_test.dart';

import 'package:vokabellerner/utils/lesson_parser.dart';

void main() {
  test('erkennt Lektion mit Kästen und Vokabeln (Leerzeichen-Trennung)', () {
    const text = '''
Lektion 5

Kasten 1
Lateinisches Wort    Mittlere Spalte    Übersetzung
luna    f    der Mond
stella        der Stern
sol    m    die Sonne

Kasten 2
amāre    amō    lieben
et        und
''';

    final lesson = parseLessonText(text);

    expect(lesson.name, 'Lektion 5');
    expect(lesson.boxes.length, 2);

    expect(lesson.boxes[0].name, 'Kasten 1');
    expect(lesson.boxes[0].vocabs.length, 3);
    expect(lesson.boxes[0].vocabs[0].latin, 'luna');
    expect(lesson.boxes[0].vocabs[0].middle, 'f');
    expect(lesson.boxes[0].vocabs[0].german, 'der Mond');
    expect(lesson.boxes[0].vocabs[1].middle, isNull);
    expect(lesson.boxes[0].vocabs[1].german, 'der Stern');

    expect(lesson.boxes[1].name, 'Kasten 2');
    expect(lesson.boxes[1].vocabs[1].latin, 'et');
    expect(lesson.boxes[1].vocabs[1].german, 'und');
  });

  test('erkennt Tab-getrennte Spalten', () {
    const text = 'Lektion 3\n\nKasten 1\n'
        'Lateinisches Wort\tMittlere Spalte\tÜbersetzung\n'
        'puella\tf\tdas Mädchen\n'
        'statim\t\tsofort\n';

    final lesson = parseLessonText(text);

    expect(lesson.name, 'Lektion 3');
    expect(lesson.boxes.single.vocabs.length, 2);
    expect(lesson.boxes.single.vocabs[0].middle, 'f');
    expect(lesson.boxes.single.vocabs[1].middle, isNull);
    expect(lesson.boxes.single.vocabs[1].german, 'sofort');
  });

  test('wirft Fehler, wenn keine Vokabeln erkannt werden', () {
    expect(
      () => parseLessonText('nur ein paar\nWörter ohne Kasten'),
      throwsA(isA<FormatException>()),
    );
  });
}
