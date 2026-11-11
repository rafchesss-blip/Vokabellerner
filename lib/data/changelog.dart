/// Was ist neu? Erscheint oben rechts, bis man es einmal gelesen hat.
///
/// Neue Einträge **oben** einfügen, mit der nächsthöheren [ChangelogEntry.id].
/// Kurz und so geschrieben, wie es Nutzer merken – nicht, was im Code
/// geändert wurde.
library;

class ChangelogEntry {
  /// Fortlaufende Nummer. Gelesene Einträge merkt sich die App über sie.
  final int id;
  final String date;
  final String title;
  final String text;

  const ChangelogEntry(this.id, this.date, this.title, this.text);
}

const changelog = [
  ChangelogEntry(
    6,
    '11.11.2026',
    '🔒 Datenschutz auf einen Blick',
    'Unter Einstellungen → „Über die App" findest du die '
        'Datenschutzerklärung und die Einführung zum Nachlesen: Alles bleibt '
        'auf deinem Handy, und die App ist ohne Werbung und ohne Käufe.',
  ),
  ChangelogEntry(
    5,
    '11.11.2026',
    '🤖 Scannen nur mit KI-Apps',
    'Beim Scannen siehst du nur noch KI-Apps wie ChatGPT oder Gemini zur '
        'Auswahl. Die Anleitung für die KI wird gleich mitgeschickt.',
  ),
  ChangelogEntry(
    4,
    '11.11.2026',
    '🧩 Mehr Formen',
    'Neu bei den Formen: Plural, Steigerung, Fall/Präposition, '
        'Deklination/Konjugation und Wortart. Mit „Alles" übernimmt die KI '
        'wirklich alles, was im Buch zum Wort steht.',
  ),
  ChangelogEntry(
    3,
    '11.11.2026',
    '👋 Mit deinem Namen',
    'Wenn du magst, begrüßt dich die App mit Namen – auch in den '
        'Erinnerungen. Ändern kannst du ihn in den Einstellungen.',
  ),
  ChangelogEntry(
    2,
    '11.11.2026',
    '💡 Kurze Tipps',
    'Beim ersten Mal erklärt ein kleines Fenster, wie Lektion anlegen, '
        'Eintippen und Scannen funktionieren. Mit „Nicht mehr anzeigen" ist '
        'es weg.',
  ),
  ChangelogEntry(
    1,
    '11.11.2026',
    '📚 Lektionen in jeder Sprache',
    'Leg eigene Lektionen an – Englisch, Französisch, Latein oder was du '
        'lernst – und tipp die Vokabeln ein oder scanne sie aus dem Buch.',
  ),
];
