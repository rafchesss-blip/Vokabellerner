import 'package:flutter_test/flutter_test.dart';

import 'package:vokabellerner/utils/normalize.dart';

void main() {
  test('normalizeAnswer ist makronen- und artikeltolerant', () {
    // Makronen
    expect(normalizeAnswer('mūrus'), 'murus');
    expect(normalizeAnswer('MŪRUS'), 'murus');
    expect(normalizeAnswer('caedēs'), 'caedes');

    // Artikel
    expect(normalizeAnswer('der Herr'), 'herr');
    expect(normalizeAnswer('Herr'), 'herr');
    expect(normalizeAnswer('die Mauer'), 'mauer');
    expect(normalizeAnswer('das Heer'), 'heer');

    // Sonstiges
    expect(normalizeAnswer('  murus. '), 'murus');
    expect(normalizeAnswer('am selben Ort, am selben Platz'),
        'am selben ort, am selben platz');
  });
}
