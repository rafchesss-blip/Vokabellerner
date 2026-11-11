/// Was ist neu? Erscheint oben rechts, bis man es einmal gelesen hat.
///
/// Neue Einträge **oben** einfügen, mit der nächsthöheren [ChangelogEntry.id].
/// Kurz und so geschrieben, wie es Nutzer merken – nicht, was im Code
/// geändert wurde.
///
/// Titel und Text stehen nicht hier, sondern als `changelog<id>Title` und
/// `changelog<id>Text` in `lib/l10n/app_de.arb` (und übersetzt in den
/// anderen `app_<sprache>.arb`); danach `flutter gen-l10n` ausführen.
library;

import '../l10n/l10n.dart';

class ChangelogEntry {
  /// Fortlaufende Nummer. Gelesene Einträge merkt sich die App über sie.
  final int id;
  final String date;

  /// Titel in der jeweiligen Sprache, z. B. `e.title(context.l10n)` oder
  /// `e.title(L)`.
  final String Function(AppLocalizations l) title;

  /// Text in der jeweiligen Sprache.
  final String Function(AppLocalizations l) text;

  const ChangelogEntry(this.id, this.date, this.title, this.text);
}

final changelog = [
  ChangelogEntry(
    7,
    '11.11.2026',
    (l) => l.changelog7Title,
    (l) => l.changelog7Text,
  ),
  ChangelogEntry(
    6,
    '11.11.2026',
    (l) => l.changelog6Title,
    (l) => l.changelog6Text,
  ),
  ChangelogEntry(
    5,
    '11.11.2026',
    (l) => l.changelog5Title,
    (l) => l.changelog5Text,
  ),
  ChangelogEntry(
    4,
    '11.11.2026',
    (l) => l.changelog4Title,
    (l) => l.changelog4Text,
  ),
  ChangelogEntry(
    3,
    '11.11.2026',
    (l) => l.changelog3Title,
    (l) => l.changelog3Text,
  ),
  ChangelogEntry(
    2,
    '11.11.2026',
    (l) => l.changelog2Title,
    (l) => l.changelog2Text,
  ),
  ChangelogEntry(
    1,
    '11.11.2026',
    (l) => l.changelog1Title,
    (l) => l.changelog1Text,
  ),
];
