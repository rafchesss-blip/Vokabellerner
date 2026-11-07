import 'dart:math' as math;

import '../models/practice_list.dart';
import '../models/vocab.dart';
import 'fsrs.dart';

/// Neue Vokabeln pro Runde für Listen **ohne** Testdatum.
const int newCardsPerSession = 15;

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
/// * Fällige Vokabeln kommen immer dran (am ehesten vergessene zuerst).
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

  final due = unique.where((v) => v.isDue(now)).toList()
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
  if (deadline == null || !deadline.isAfter(now)) return;

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
