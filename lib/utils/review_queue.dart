import 'dart:math' as math;

import '../models/practice_list.dart';
import '../models/vocab.dart';
import 'fsrs.dart';

/// Neue Vokabeln pro Runde für Listen **ohne** Testdatum.
const int newCardsPerSession = 15;

/// Am letzten Lerntag gilt eine Vokabel erst als sicher, wenn sie
/// mindestens so lange nach dem letzten Fehler richtig beantwortet wurde.
const Duration settleTime = Duration(minutes: 30);

DateTime _day(DateTime d) => DateTime(d.year, d.month, d.day);

/// Letzter Lerntag vor einem Test: der Tag **vor** dem Testtag (am Testtag
/// selbst ist keine Zeit mehr zum Üben).
DateTime studyDeadline(DateTime examDate) =>
    DateTime(examDate.year, examDate.month, examDate.day - 1);

/// Lerntage von heute bis einschließlich zum letzten Lerntag (mind. 1).
int studyDaysLeft(DateTime examDate, DateTime now) =>
    math.max(1, studyDeadline(examDate).difference(_day(now)).inDays + 1);

/// Nächster noch erreichbarer letzter Lerntag (Testtag − 1) einer Liste,
/// die [vocabId] enthält. `null`, wenn es keinen bevorstehenden Test gibt.
DateTime? nextDeadlineFor(
  String vocabId,
  Iterable<PracticeList> lists, {
  DateTime? now,
}) {
  final today = _day(now ?? DateTime.now());
  DateTime? best;
  for (final l in lists) {
    final exam = l.dueDate;
    if (exam == null || !l.vocabIds.contains(vocabId)) continue;
    final deadline = studyDeadline(exam);
    if (deadline.isBefore(today)) continue;
    if (best == null || deadline.isBefore(best)) best = deadline;
  }
  return best;
}

/// Zeitpunkt des letzten Fehlers („Nochmal"/falsch) – aus FSRS oder, bei
/// Daten aus älteren Versionen, aus dem Lernverlauf (Stufe gesunken).
DateTime? lastMistake(Vocab v) {
  DateTime? fromHistory;
  for (var i = v.history.length - 1; i >= 0; i--) {
    final before = i == 0 ? 0 : v.history[i - 1].level;
    if (v.history[i].level < before) {
      fromHistory = v.history[i].time;
      break;
    }
  }
  final lapse = v.srs?.lapseAt;
  if (lapse == null) return fromHistory;
  if (fromHistory == null) return lapse;
  return lapse.isAfter(fromHistory) ? lapse : fromHistory;
}

/// Am letzten Lerntag: Vokabel hatte heute einen Fehler und wurde danach
/// noch nicht mit genug Abstand ([settleTime]) richtig beantwortet.
bool _notSettled(Vocab v, DateTime now) {
  final mistake = lastMistake(v);
  if (mistake == null || _day(mistake) != _day(now)) return false;
  return v.srs!.lastReview.difference(mistake) < settleTime;
}

/// Plan für die nächste Lern-Runde.
class ReviewPlan {
  /// Fällige Wiederholungen (am ehesten vergessene zuerst).
  final List<Vocab> due;

  /// Neue Vokabeln, die heute drankommen.
  final List<Vocab> fresh;

  /// Neue Vokabeln, die danach noch übrig sind.
  final int freshLater;

  const ReviewPlan({
    required this.due,
    required this.fresh,
    required this.freshLater,
  });

  List<Vocab> get session => [...due, ...fresh];

  bool get isEmpty => due.isEmpty && fresh.isEmpty;
}

/// Stellt die nächste Runde aus [pool] zusammen.
///
/// * Fällige Vokabeln kommen immer dran (am ehesten vergessene zuerst) –
///   auch die, die erst später heute fällig werden (z. B. 10 Minuten nach
///   einem Fehler). Am letzten Lerntag vor einem Test zusätzlich alle, die
///   heute falsch waren und noch nicht sicher sitzen.
/// * Neue Vokabeln mit Testtermin werden gleichmäßig auf die Lerntage bis
///   zum Vortag des Tests verteilt (frühester Test zuerst). Was heute schon
///   neu gelernt wurde, wird abgezogen.
/// * Neue Vokabeln ohne Testtermin: bis zu [newCardsPerSession] pro Runde.
ReviewPlan planReview(
  Iterable<Vocab> pool,
  Iterable<PracticeList> lists, {
  DateTime? now,
}) {
  now ??= DateTime.now();
  final today = _day(now);
  final unique = {for (final v in pool) v.id: v}.values.toList();

  final tomorrow = DateTime(today.year, today.month, today.day + 1);
  bool dueToday(Vocab v) {
    if (v.srs == null) return false;
    if (v.srs!.due.isBefore(tomorrow)) return true;
    return nextDeadlineFor(v.id, lists, now: now) == today &&
        _notSettled(v, now!);
  }

  final due = unique.where(dueToday).toList()
    ..sort((a, b) => a.recall(now)!.compareTo(b.recall(now)!));

  // Neue und heute erstmals gelernte Vokabeln nach Lern-Deadline gruppieren.
  final freshBy = <DateTime?, List<Vocab>>{};
  final startedTodayBy = <DateTime?, int>{};
  for (final v in unique) {
    final deadline = nextDeadlineFor(v.id, lists, now: now);
    if (v.isNew) {
      (freshBy[deadline] ??= []).add(v);
    } else {
      final first = v.srs!.firstReview;
      if (first != null && _day(first) == today) {
        startedTodayBy[deadline] = (startedTodayBy[deadline] ?? 0) + 1;
      }
    }
  }

  final deadlines = freshBy.keys.whereType<DateTime>().toList()..sort();
  final fresh = <Vocab>[];
  var later = 0;
  for (final deadline in [...deadlines, null]) {
    final group = freshBy[deadline] ?? const [];
    final int quota;
    if (deadline == null) {
      quota = newCardsPerSession;
    } else {
      final days = deadline.difference(today).inDays + 1;
      final startedToday = startedTodayBy[deadline] ?? 0;
      final perDay = ((group.length + startedToday) / days).ceil();
      quota = math.max(0, perDay - startedToday);
    }
    fresh.addAll(group.take(quota));
    later += math.max(0, group.length - quota);
  }

  return ReviewPlan(due: due, fresh: fresh, freshLater: later);
}

/// Bewertet [v] per FSRS und passt den nächsten Termin an einen
/// bevorstehenden Test an:
///
/// * Spätestens am letzten Lerntag (Vortag des Tests) kommt die Vokabel
///   noch einmal dran – so wird vor dem Test alles wiederholt.
/// * Je näher der Test, desto kürzer die Abstände: höchstens die Hälfte der
///   verbleibenden Zeit (mindestens 1 Tag).
/// * Am letzten Lerntag selbst wird gepaukt: „Schwer" oder richtig kurz
///   nach einem Fehler → in [settleTime] noch einmal. Erst wer eine Vokabel
///   mit Abstand zum letzten Fehler weiß, ist mit ihr fertig.
void reviewWithExam(
  Vocab v,
  Rating rating,
  Iterable<PracticeList> lists, {
  DateTime? now,
}) {
  now ??= DateTime.now();
  v.review(rating, now);
  if (rating == Rating.again) return; // kommt ohnehin gleich wieder

  final deadline = nextDeadlineFor(v.id, lists, now: now);
  if (deadline == null) return;

  if (deadline == _day(now)) {
    // Letzter Lerntag: unsichere Vokabeln heute noch einmal.
    final mistake = lastMistake(v);
    final shaky = rating == Rating.hard ||
        (mistake != null &&
            _day(mistake) == deadline &&
            now.difference(mistake) < settleTime);
    final card = v.srs!;
    final next = now.add(settleTime);
    if (shaky && card.due.isAfter(next)) v.srs = card.withDue(next);
    return;
  }

  final remaining = deadline.difference(now);
  final gap = remaining ~/ 2 > const Duration(days: 1)
      ? remaining ~/ 2
      : const Duration(days: 1);
  var latest = _day(now.add(gap));
  if (latest.isAfter(deadline)) latest = deadline;

  final card = v.srs!;
  if (card.due.isAfter(latest)) v.srs = card.withDue(latest);
}

/// Nächster bevorstehender Test aller Listen (Testtag heute oder später).
PracticeList? nextExamList(Iterable<PracticeList> lists, {DateTime? now}) {
  final today = _day(now ?? DateTime.now());
  PracticeList? best;
  for (final l in lists) {
    final d = l.dueDate;
    if (d == null || _day(d).isBefore(today)) continue;
    if (best == null || d.isBefore(best.dueDate!)) best = l;
  }
  return best;
}

/// Ob der Test von [list] vorbei ist (Testtag liegt vor heute).
bool examOver(PracticeList list, {DateTime? now}) {
  final exam = list.dueDate;
  return exam != null && _day(exam).isBefore(_day(now ?? DateTime.now()));
}

/// Listen, die noch gelernt werden: ohne Testdatum oder Test noch nicht
/// vorbei. Nach dem Test fällt eine Liste aus „Heute" und den Erinnerungen
/// heraus – üben kann man sie trotzdem noch über die Übungslisten.
List<PracticeList> activeLists(
  Iterable<PracticeList> lists, {
  DateTime? now,
}) =>
    [for (final l in lists) if (!examOver(l, now: now)) l];
