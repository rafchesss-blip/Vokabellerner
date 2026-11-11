/// Normalisiert eine Antwort für den Vergleich:
/// - Kleinbuchstaben, mehrfache Leerzeichen vereinheitlichen
/// - Artikel am Anfang sind optional (der/die/das, the/a, le/la/l', el/la,
///   il/lo, o/a …) – für beide Seiten gleich, daher unschädlich
/// - Makronen werden ignoriert (ā = a, ē = e, …)
/// - Satzzeichen am Ende werden ignoriert
String normalizeAnswer(String input) {
  var t = input.toLowerCase().trim();
  t = t.replaceAll(RegExp(r'\s+'), ' ');
  t = t.replaceAll(_articles, '');
  t = _stripMacrons(t);
  t = t.replaceAll(RegExp(r'[.,;:!?]+$'), '').trim();
  return t;
}

/// Artikel am Wortanfang in den Sprachen der App.
final _articles = RegExp(
  r"^(der|die|das|ein|eine|the|an|a|le|la|les|un|une|des|l'|el|los|las|"
  r"una|il|lo|gli|i|uno|o|os|as|um|uma)(\s+|(?<=l')(?=\w))",
);

String _stripMacrons(String s) {
  const macrons = <String, String>{
    'ā': 'a',
    'ē': 'e',
    'ī': 'i',
    'ō': 'o',
    'ū': 'u',
    'ȳ': 'y',
  };
  return s
      .split('')
      .map((c) => macrons[c] ?? c)
      .join()
      // Kombinierendes Makron (a + U+0304) entfernen
      .replaceAll('\u0304', '');
}
