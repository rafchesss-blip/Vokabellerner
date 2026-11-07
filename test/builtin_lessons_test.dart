import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:vokabellerner/data/builtin_lessons.dart';
import 'package:vokabellerner/data/store.dart';
import 'package:vokabellerner/models/vocab.dart';
import 'package:vokabellerner/utils/fsrs.dart';
import 'package:vokabellerner/utils/lesson_parser.dart';

const _lesson1 = '''
# Kommentar wird ignoriert
Lektion 1

Kasten 1
servus | m | der Sklave
ibi | dort
in | in, an (wo?)
in | in ... hinein (wohin?)
''';

List<Lesson> _builtIn() => [builtInLessonFromText(_lesson1, 'lektion-01')];

void main() {
  test('Dateiformat mit „|": mittlere Spalte optional, Kommentare ignoriert', () {
    final lesson = parseLessonText(_lesson1);
    expect(lesson.name, 'Lektion 1');
    final vocabs = lesson.boxes.single.vocabs;
    expect(vocabs.length, 4);
    expect(vocabs[0].middle, 'm');
    expect(vocabs[1].middle, isNull);
    expect(vocabs[1].german, 'dort');
  });

  test('Eingebaute Lektionen haben stabile, eindeutige IDs', () {
    final a = builtInLessonFromText(_lesson1, 'lektion-01');
    final b = builtInLessonFromText(_lesson1, 'lektion-01');
    expect(a.allVocabs.map((v) => v.id), b.allVocabs.map((v) => v.id));
    final ids = a.allVocabs.map((v) => v.id).toSet();
    expect(ids.length, 4, reason: 'doppeltes „in" braucht eigene IDs');
    expect(a.isBuiltIn, isTrue);
  });

  test('Alter Fortschritt (Zufalls-IDs) wird übernommen, Listen umgestellt',
      () async {
    final old = Lesson(id: 'alt-123', name: 'Lektion 1', boxes: [
      Box(id: 'b', name: 'Kasten 1', vocabs: [
        Vocab(id: 'zufall-1', latin: 'servus', german: 'der Sklave', level: 3)
          ..review(Rating.good),
      ]),
    ]);
    final own = Lesson(id: 'own:x', name: 'Meine Wörter', boxes: [
      Box(id: 'c', name: 'Kasten 1', vocabs: [
        Vocab(id: 'eigen-1', latin: 'luna', german: 'der Mond'),
      ]),
    ]);
    SharedPreferences.setMockInitialValues({
      'vocab_lessons_v3': jsonEncode([old.toJson(), own.toJson()]),
      'vocab_practice_lists_v1': jsonEncode([
        {
          'id': 'l',
          'name': 'Test',
          'vocabIds': ['zufall-1', 'eigen-1'],
        },
      ]),
    });

    await Store.instance.load(builtIn: _builtIn());
    final store = Store.instance;

    expect(store.lessons.map((l) => l.name), ['Lektion 1', 'Meine Wörter']);
    final servus = store.lessons.first.allVocabs.first;
    expect(servus.id, startsWith('builtin:lektion-01:'));
    expect(servus.level, 4);
    expect(servus.srs, isNotNull);
    expect(store.practiceLists.single.vocabIds, [servus.id, 'eigen-1']);
  });

  test('Sicherung: exportieren und wiederherstellen', () async {
    SharedPreferences.setMockInitialValues({});
    await Store.instance.load(builtIn: _builtIn());
    final store = Store.instance;
    store.lessons.first.allVocabs.first.review(Rating.easy);
    store.logReview();
    final backup = store.toBackupJson();

    await store.resetProgress();
    expect(store.lessons.first.allVocabs.first.isNew, isTrue);
    expect(store.reviewsToday, 0);

    await store.restoreBackup(backup);
    expect(store.lessons.first.allVocabs.first.isNew, isFalse);
    expect(store.reviewsToday, 1);

    expect(() => store.restoreBackup('kein json'), throwsFormatException);
    expect(() => store.restoreBackup('{"x": 1}'), throwsFormatException);
  });

  test('Lernserie zählt Tage in Folge (heute oder bis gestern)', () async {
    SharedPreferences.setMockInitialValues({});
    await Store.instance.load(builtIn: []);
    final store = Store.instance;
    final today = DateTime(2026, 3, 10, 12);
    for (final d in [7, 8, 9]) {
      store.logReview(DateTime(2026, 3, d, 9));
    }
    // Heute noch nicht gelernt → Serie bis gestern zählt noch.
    expect(store.streak(today), 3);
    store.logReview(today);
    expect(store.streak(today), 4);
    // Ein Tag Pause → Serie gerissen.
    expect(store.streak(DateTime(2026, 3, 12)), 0);
  });
}
