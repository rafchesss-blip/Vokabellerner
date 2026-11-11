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
    expect(normalizeAnswer('the house'), 'house');
    expect(normalizeAnswer('la maison'), 'maison');
    expect(normalizeAnswer("l'arbre"), 'arbre');
    expect(normalizeAnswer('el perro'), 'perro');
    expect(normalizeAnswer('a casa'), 'casa');
    // Kein Artikel, nur gleicher Anfang:
    expect(normalizeAnswer('these'), 'these');
    expect(normalizeAnswer('ilex'), 'ilex');

    // Sonstiges
    expect(normalizeAnswer('  murus. '), 'murus');
    expect(normalizeAnswer('am selben Ort, am selben Platz'),
        'am selben ort, am selben platz');
  });
}
