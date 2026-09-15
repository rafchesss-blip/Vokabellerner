import '../models/vocab.dart';

/// Hilfsfunktionen für Lernziele: „Bis wann muss ich die Vokabeln können?"
///
/// Eine Vokabel gilt als **gewusst**, wenn ihre Lernstufe positiv ist
/// (level > 0). Aus dem Zieldatum einer Übungsliste wird ein Tagesziel
/// berechnet, damit man das Gesamtziel rechtzeitig erreicht.

bool _isSameDay(DateTime a, DateTime b) =>
    a.year == b.year && a.month == b.month && a.day == b.day;

/// Ob eine Vokabel als „gewusst" gilt.
bool isKnown(Vocab v) => v.level > 0;

/// Zeitpunkt, zu dem die Vokabel **erstmals** eine positive Lernstufe hatte.
///
/// Der Verlauf (`history`) ist chronologisch, daher genügt das erste
/// positive Ereignis.
DateTime? firstKnownAt(Vocab v) {
  for (final e in v.history) {
    if (e.level > 0) return e.time;
  }
  return null;
}

/// Fortschritt einer Übungsliste in Bezug auf ein (optionales) Zieldatum.
class GoalProgress {
  final int total;
  final int known;
  final int remaining;

  /// Verbleibende Tage inklusive heute (mindestens 1, wenn Ziel vorhanden).
  final int daysRemaining;

  /// Wie viele Vokabeln man pro Tag lernen muss (aufgerundet).
  final int dailyTarget;

  /// Wie viele Vokabeln heute erstmals „gewusst" wurden.
  final int learnedToday;

  /// Anteil gewusster Vokabeln in Prozent (0–100).
  final double overallPercent;

  /// Erreichter Anteil des Tagesziels in Prozent (kann > 100 sein).
  final double dailyPercent;

  const GoalProgress({
    required this.total,
    required this.known,
    required this.remaining,
    required this.daysRemaining,
    required this.dailyTarget,
    required this.learnedToday,
    required this.overallPercent,
    required this.dailyPercent,
  });

  /// Gibt an, ob ein Tagesziel berechnet werden kann (Zieldatum vorhanden).
  bool get hasDailyGoal => daysRemaining > 0;

  /// Leerer Fortschritt für Listen ohne Vokabeln.
  static const GoalProgress empty = GoalProgress(
    total: 0,
    known: 0,
    remaining: 0,
    daysRemaining: 0,
    dailyTarget: 0,
    learnedToday: 0,
    overallPercent: 0,
    dailyPercent: 0,
  );
}

/// Berechnet den Fortschritt für [vocabs] mit optionalem [dueDate].
GoalProgress computeGoal(
  List<Vocab> vocabs,
  DateTime? dueDate, {
  DateTime? now,
}) {
  now ??= DateTime.now();
  final today = DateTime(now.year, now.month, now.day);

  final total = vocabs.length;
  if (total == 0) return GoalProgress.empty;

  final known = vocabs.where(isKnown).length;
  final remaining = total - known;
  final overallPercent = known / total * 100;

  if (dueDate == null) {
    return GoalProgress(
      total: total,
      known: known,
      remaining: remaining,
      daysRemaining: 0,
      dailyTarget: 0,
      learnedToday: 0,
      overallPercent: overallPercent,
      dailyPercent: 0,
    );
  }

  final due = DateTime(dueDate.year, dueDate.month, dueDate.day);
  final rawDays = due.difference(today).inDays + 1; // heute zählt mit
  final daysRemaining = rawDays < 1 ? 1 : rawDays;
  final dailyTarget = (remaining / daysRemaining).ceil();

  final learnedToday = vocabs.where((v) {
    if (!isKnown(v)) return false;
    final first = firstKnownAt(v);
    return first != null && _isSameDay(first, today);
  }).length;

  final dailyPercent =
      dailyTarget == 0 ? 100.0 : learnedToday / dailyTarget * 100;

  return GoalProgress(
    total: total,
    known: known,
    remaining: remaining,
    daysRemaining: daysRemaining,
    dailyTarget: dailyTarget,
    learnedToday: learnedToday,
    overallPercent: overallPercent,
    dailyPercent: dailyPercent,
  );
}
