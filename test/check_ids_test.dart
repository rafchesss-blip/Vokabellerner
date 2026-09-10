import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:vokabellerner/data/store.dart';

void main() {
  test('IDs aller Vokabeln sind eindeutig', () async {
    SharedPreferences.setMockInitialValues({});
    await Store.instance.load();

    final ids = <String>[];
    for (final l in Store.instance.lessons) {
      for (final b in l.boxes) {
        for (final v in b.vocabs) {
          ids.add(v.id);
        }
      }
    }

    final unique = ids.toSet().length;
    // ignore: avoid_print
    print('Anzahl IDs: ${ids.length}, eindeutig: $unique');
    expect(unique, ids.length, reason: 'Es gibt doppelte IDs!');
  });
}
