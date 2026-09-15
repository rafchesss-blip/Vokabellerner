import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:vokabellerner/data/store.dart';
import 'package:vokabellerner/models/vocab.dart';

void main() {
  test('Erster Start legt Lektion 1–4 und Lektion 18 an', () async {
    SharedPreferences.setMockInitialValues({});
    await Store.instance.load();

    expect(Store.instance.lessons.length, 5);
    expect(Store.instance.lessons[0].name, 'Lektion 1');
    expect(Store.instance.lessons[1].name, 'Lektion 2');
    expect(Store.instance.lessons[2].name, 'Lektion 3');
    expect(Store.instance.lessons[3].name, 'Lektion 4');
    expect(Store.instance.lessons.last.name, 'Lektion 18');
    expect(Store.instance.practiceLists, isEmpty);

    int totalOf(Lesson lesson) => lesson.boxes.fold<int>(
          0,
          (s, b) => s + b.vocabs.length,
        );

    expect(Store.instance.lessons[0].boxes.length, 5);
    expect(totalOf(Store.instance.lessons[0]), 42);
    expect(Store.instance.lessons[1].boxes.length, 5);
    expect(totalOf(Store.instance.lessons[1]), 43);
    expect(Store.instance.lessons[2].boxes.length, 5);
    expect(totalOf(Store.instance.lessons[2]), 42);
    expect(Store.instance.lessons[3].boxes.length, 5);
    expect(totalOf(Store.instance.lessons[3]), 42);
    expect(Store.instance.lessons.last.boxes.length, 5);
    expect(totalOf(Store.instance.lessons.last), 43);
  });
}
