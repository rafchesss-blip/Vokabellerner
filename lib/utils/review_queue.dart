import '../models/practice_list.dart';
import '../models/vocab.dart';
import 'fsrs.dart';

/// Wie viele neue (noch nie abgefragte) Vokabeln pro Sitzung dazukommen.
const int newCardsPerSession = 15;

/// Stellt eine Wiederholungs-Sitzung zusammen:
/// zuerst alle fälligen Vokabeln (am ehesten vergessene zuerst), danach
/// bis zu [newLimit] neue Vokabeln in Listen-Reihenfolge.
List<Vocab> buildReviewSession(
  Iterable<Vocab> pool, {
  int newLimit = newCardsPerSession,
  DateTime? now,
}) {
  now ??= DateTime.now();
  final unique = {for (final v in pool) v.id: v}.values;

  final due = unique.where((v) => v.isDue(now)).toList()
    ..sort((a, b) => a.recall(now)!.compareTo(b.recall(now)!));
  final fresh = unique.where((v) => v.isNew).take(newLimit);

  return [...due, ...fresh];
}

/// Zählt fällige und neue Vokabeln in [pool].
({int due, int fresh}) countReview(Iterable<Vocab> pool, {DateTime? now}) {
  now ??= DateTime.now();
  final unique = {for (final v in pool) v.id: v}.values;
  return (
    due: unique.where((v) => v.isDue(now)).length,
    fresh: unique.where((v) => v.isNew).length,
  );
}

/// Frühestes noch bevorstehendes Zieldatum (z. B. Vokabeltest) einer Liste,
/// die [vocabId] enthält.
DateTime? nextExamFor(
  String vocabId,
  Iterable<PracticeList> lists, {
  DateTime? now,
}) {
  now ??= DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  DateTime? best;
  for (final l in lists) {
    final d = l.dueDate;
    if (d == null || !l.vocabIds.contains(vocabId)) continue;
    final day = DateTime(d.year, d.month, d.day);
    if (day.isBefore(today)) continue;
    if (best == null || day.isBefore(best)) best = day;
  }
  return best;
}

/// Bewertet [v] und sorgt dafür, dass die nächste Wiederholung spätestens
/// am Tag des nächsten Vokabeltests stattfindet.
void reviewWithExam(
  Vocab v,
  Rating rating,
  Iterable<PracticeList> lists, {
  DateTime? now,
}) {
  now ??= DateTime.now();
  v.review(rating, now);
  final exam = nextExamFor(v.id, lists, now: now);
  final card = v.srs!;
  if (exam != null && exam.isAfter(now) && card.due.isAfter(exam)) {
    v.srs = FsrsCard(
      stability: card.stability,
      difficulty: card.difficulty,
      lastReview: card.lastReview,
      due: exam,
      reps: card.reps,
      lapses: card.lapses,
    );
  }
}
