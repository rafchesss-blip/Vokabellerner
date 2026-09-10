import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:vokabellerner/data/store.dart';
import 'package:vokabellerner/models/vocab.dart';

void main() {
  test('Erster Start legt Lektion 1 und Lektion 18 an', () async {
    SharedPreferences.setMockInitialValues({});
    await Store.instance.load();

    expect(Store.instance.lessons.length, 2);
    expect(Store.instance.lessons.first.name, 'Lektion 1');
    expect(Store.instance.lessons.last.name, 'Lektion 18');
    expect(Store.instance.practiceLists, isEmpty);

    int totalOf(Lesson lesson) => lesson.boxes.fold<int>(
          0,
          (s, b) => s + b.vocabs.length,
        );

    expect(Store.instance.lessons.first.boxes.length, 5);
    expect(totalOf(Store.instance.lessons.first), 42);
    expect(Store.instance.lessons.last.boxes.length, 5);
    expect(totalOf(Store.instance.lessons.last), 43);
  });
}
