import 'package:flutter_test/flutter_test.dart';

import 'package:vokabellerner/models/practice_list.dart';
import 'package:vokabellerner/models/vocab.dart';
import 'package:vokabellerner/utils/fsrs.dart';
import 'package:vokabellerner/utils/review_queue.dart';

/// Szenario aus der Praxis: Morgen ist der Vokabeltest, heute wird alles
/// wiederholt – aber nur 2 von 10 Vokabeln sitzen.
void main() {
  final lastDay = DateTime(2026, 3, 4, 16); // Test am 5.3.
  final exam = DateTime(2026, 3, 5);

  List<Vocab> learned(int n) {
    // Vor ein paar Tagen gelernt, heute fällig (Deadline-Deckel).
    return [
      for (var i = 0; i < n; i++)
        Vocab(id: 'v$i', latin: 'l$i', german: 'd$i')
          ..review(Rating.good, DateTime(2026, 3, 1, 16)),
    ];
  }

  List<PracticeList> listFor(List<Vocab> v) => [
        PracticeList(
          id: 'l',
          name: 'Vokabeltest',
          vocabIds: [for (final x in v) x.id],
          dueDate: exam,
        ),
      ];

  /// Eine Karteikarten-Runde wie in der App: „Nochmal"-Karten kommen in
  /// derselben Runde wieder und werden dann (knapp) gewusst.
  void session(List<Vocab> cards, List<PracticeList> lists, DateTime start,
      bool Function(Vocab) knows) {
    var t = start;
    final again = <Vocab>[];
    for (final v in cards) {
      t = t.add(const Duration(seconds: 20));
      if (knows(v)) {
        reviewWithExam(v, Rating.good, lists, now: t);
      } else {
        reviewWithExam(v, Rating.again, lists, now: t);
        again.add(v);
      }
    }
    for (final v in again) {
      t = t.add(const Duration(seconds: 20));
      reviewWithExam(v, Rating.good, lists, now: t);
    }
  }

  test('Nur 2 von 10 gewusst → NICHT „für heute erledigt"', () {
    final vocabs = learned(10);
    final lists = listFor(vocabs);
    expect(planReview(vocabs, lists, now: lastDay).due.length, 10);

    session(vocabs, lists, lastDay, (v) => v.id == 'v0' || v.id == 'v1');

    final after = planReview(vocabs, lists,
        now: lastDay.add(const Duration(minutes: 10)));
    expect(after.isEmpty, isFalse);
    expect(after.due.length, 8);
    expect(after.due.map((v) => v.id), isNot(contains('v0')));
  });

  test('Erst richtig mit Abstand zum Fehler → dann ist die Vokabel fertig', () {
    final vocabs = learned(3);
    final lists = listFor(vocabs);
    session(vocabs, lists, lastDay, (v) => false);

    // 40 Minuten später: alle noch einmal, diesmal gewusst.
    final later = lastDay.add(const Duration(minutes: 40));
    var plan = planReview(vocabs, lists, now: later);
    expect(plan.due.length, 3);
    for (final v in plan.due) {
      reviewWithExam(v, Rating.good, lists, now: later);
    }
    plan = planReview(vocabs, lists, now: later.add(const Duration(minutes: 1)));
    expect(plan.isEmpty, isTrue);
  });

  test('„Schwer" am letzten Lerntag → in 30 Minuten noch einmal', () {
    final vocabs = learned(1);
    final lists = listFor(vocabs);
    reviewWithExam(vocabs.single, Rating.hard, lists, now: lastDay);
    expect(vocabs.single.srs!.due, lastDay.add(settleTime));
  });

  test('Alte Daten: heute falsch, aber schon nach dem Test geplant → wieder da',
      () {
    final v = Vocab(
      id: 'alt',
      latin: 'a',
      german: 'b',
      level: 1,
      history: [
        StatEvent(time: DateTime(2026, 3, 1, 16), level: 1),
        StatEvent(time: DateTime(2026, 3, 4, 15), level: 0), // heute falsch
        StatEvent(time: DateTime(2026, 3, 4, 15, 1), level: 1),
      ],
      srs: FsrsCard(
        stability: 5,
        difficulty: 5,
        lastReview: DateTime(2026, 3, 4, 15, 1),
        due: DateTime(2026, 3, 9), // nach dem Test – der alte Fehler
      ),
    );
    final plan = planReview([v], listFor([v]), now: lastDay);
    expect(plan.due.single.id, 'alt');
  });

  test('Ohne Test: „Nochmal" in 10 Minuten zählt heute noch als offen', () {
    final now = DateTime(2026, 3, 4, 16);
    final v = Vocab(id: 'x', latin: 'a', german: 'b')
      ..review(Rating.good, DateTime(2026, 3, 1))
      ..review(Rating.again, now);
    final plan = planReview([v], const [], now: now.add(const Duration(minutes: 1)));
    expect(plan.due.single.id, 'x');
  });
}
