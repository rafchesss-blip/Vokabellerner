import 'package:flutter_test/flutter_test.dart';

import 'package:vokabellerner/data/store.dart';

void main() {
  test('Lektionen werden numerisch sortiert (kleinste Zahl oben)', () {
    Store.instance.loadCloudJson({
      'lessons': [
        {'id': 'l18', 'name': 'Lektion 18', 'boxes': []},
        {'id': 'l2', 'name': 'Lektion 2', 'boxes': []},
        {'id': 'l10', 'name': 'Lektion 10', 'boxes': []},
        {'id': 'l1', 'name': 'Lektion 1', 'boxes': []},
        {'id': 'extra', 'name': 'Wiederholung', 'boxes': []},
      ],
      'lists': [],
    });

    expect(
      Store.instance.lessons.map((l) => l.name).toList(),
      ['Lektion 1', 'Lektion 2', 'Lektion 10', 'Lektion 18', 'Wiederholung'],
    );
  });
}
