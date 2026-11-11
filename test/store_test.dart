import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:vokabellerner/data/store.dart';
import 'package:vokabellerner/models/practice_list.dart';
import 'package:vokabellerner/models/vocab.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('Die App startet ohne Lektionen', () async {
    SharedPreferences.setMockInitialValues({});
    await Store.instance.load();
    expect(Store.instance.lessons, isEmpty);
  });

  test('Eigene Lektion wird gespeichert und wieder geladen', () async {
    SharedPreferences.setMockInitialValues({});
    final store = Store.instance;
    await store.load();

    final lesson = Lesson(
      id: 'l1',
      name: 'Unit 1',
      boxes: [],
      language: 'Englisch',
      hasForms: true,
      formKinds: {FormKind.verb},
      extraLabels: ['Beispielsatz'],
    );
    lesson.mainBox.vocabs.add(Vocab(
      id: 'v1',
      latin: 'to go',
      german: 'gehen',
      middleColumn: 'went, gone',
      extras: [const VocabExtra('Beispielsatz', 'I go home.')],
    ));
    await store.addLesson(lesson);
    store.practiceLists.add(PracticeList(id: 'p', name: 'Test', vocabIds: ['v1']));
    await store.save();

    await store.load();
    final loaded = store.lessons.single;
    expect(loaded.language, 'Englisch');
    expect(loaded.formKinds, {FormKind.verb});
    expect(loaded.extraLabels, ['Beispielsatz']);
    final v = loaded.allVocabs.single;
    expect(v.middleColumn, 'went, gone');
    expect(v.extras.single.value, 'I go home.');

    await store.deleteLesson(loaded);
    expect(store.lessons, isEmpty);
    expect(store.practiceLists.single.vocabIds, isEmpty);
  });
}
