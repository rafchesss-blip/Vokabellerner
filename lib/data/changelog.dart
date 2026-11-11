/// Was ist neu? Wird nur in der Browser-Version angezeigt.
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
    4,
    '11.11.2026',
    '📱 Die App fürs Handy',
    'Auf der Startseite kannst du jetzt die Android-App herunterladen. '
        'Sie erinnert dich mehrmals am Tag ans Lernen.',
  ),
  ChangelogEntry(
    3,
    '11.11.2026',
    '✅ Nach dem Test ist Ruhe',
    'Ist der Test einer Übungsliste vorbei, musst du sie nicht mehr lernen. '
        'Üben kannst du sie trotzdem jederzeit.',
  ),
  ChangelogEntry(
    2,
    '08.11.2026',
    '🚨 Der Tag vor dem Test',
    'Am letzten Lerntag kommen Vokabeln, die du falsch hattest, nach einer '
        'halben Stunde noch einmal – bis sie wirklich sitzen.',
  ),
  ChangelogEntry(
    1,
    '07.11.2026',
    '🎯 Lernen bis zum Testtag',
    'Gib deiner Übungsliste ein Testdatum. Die App verteilt die Vokabeln '
        'auf die Tage davor und trägt dir auf Wunsch Erinnerungen in den '
        'Kalender ein.',
  ),
];
