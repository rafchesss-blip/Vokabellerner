/// Normalisiert eine Antwort für den Vergleich:
/// - Kleinbuchstaben, mehrfache Leerzeichen vereinheitlichen
/// - Artikel (der/die/das/ein/eine) sind optional
/// - Makronen werden ignoriert (ā = a, ē = e, …)
/// - Satzzeichen am Ende werden ignoriert
String normalizeAnswer(String input) {
  var t = input.toLowerCase().trim();
  t = t.replaceAll(RegExp(r'\s+'), ' ');
  t = t.replaceAll(RegExp(r'^(der|die|das|ein|eine)\s+'), '');
  t = _stripMacrons(t);
  t = t.replaceAll(RegExp(r'[.,;:!?]+$'), '').trim();
  return t;
}

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
