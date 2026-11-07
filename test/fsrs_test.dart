import 'package:flutter_test/flutter_test.dart';

import 'package:vokabellerner/models/practice_list.dart';
import 'package:vokabellerner/models/vocab.dart';
import 'package:vokabellerner/utils/fsrs.dart';
import 'package:vokabellerner/utils/review_queue.dart';

void main() {
  final t0 = DateTime(2026, 1, 1, 10);

  Vocab vocab(String id) => Vocab(id: id, latin: 'l$id', german: 'd$id');

  group('FSRS', () {
    test('Erste Bewertung: Intervalle wachsen von Nochmal bis Leicht', () {
      Duration next(Rating r) => Fsrs.previewInterval(null, r, t0);

      expect(next(Rating.again), const Duration(minutes: 10));
      expect(next(Rating.hard) < next(Rating.good), isTrue);
      expect(next(Rating.good) < next(Rating.easy), isTrue);
      // Standard-Parameter: „Gut" ≈ 2,3 Tage.
      expect(next(Rating.good).inHours, inInclusiveRange(50, 60));
    });

    test('Bei 90 % Ziel-Behaltensrate entspricht das Intervall der Stabilität',
        () {
      expect(Fsrs.intervalDays(10), closeTo(10, 0.001));
      expect(Fsrs.retrievability(10, 10), closeTo(0.9, 0.001));
    });

    test('Erfolgreiche Wiederholungen verlängern die Abstände', () {
      var card = Fsrs.review(null, Rating.good, t0);
      var lastInterval = card.due.difference(t0);
      for (var i = 0; i < 4; i++) {
        final now = card.due;
        card = Fsrs.review(card, Rating.good, now);
        final interval = card.due.difference(now);
        expect(interval > lastInterval, isTrue);
        lastInterval = interval;
      }
      expect(card.reps, 5);
      expect(card.lapses, 0);
    });

    test('Vergessen senkt die Stabilität und zählt einen Fehler', () {
      final learned = Fsrs.review(null, Rating.easy, t0);
      final forgot = Fsrs.review(learned, Rating.again, learned.due);
      expect(forgot.stability < learned.stability, isTrue);
      expect(forgot.difficulty > learned.difficulty, isTrue);
      expect(forgot.lapses, 1);
    });

    test('Schwierigkeit bleibt zwischen 1 und 10', () {
      var card = Fsrs.review(null, Rating.again, t0);
      for (var i = 0; i < 30; i++) {
        card = Fsrs.review(card, Rating.again, card.due);
      }
      expect(card.difficulty, inInclusiveRange(1, 10));
      for (var i = 0; i < 30; i++) {
        card = Fsrs.review(card, Rating.easy, card.due);
      }
      expect(card.difficulty, inInclusiveRange(1, 10));
    });
  });

  group('Vocab + FSRS', () {
    test('JSON-Rundreise erhält den FSRS-Zustand', () {
      final v = vocab('1')..review(Rating.good, t0);
      final copy = Vocab.fromJson(v.toJson());
      expect(copy.srs!.stability, v.srs!.stability);
      expect(copy.srs!.due, v.srs!.due);
      expect(copy.level, 1);
    });

    test('Alte Daten ohne FSRS-Zustand laden als „neu"', () {
      final v = Vocab.fromJson({
        'id': 'x',
        'latin': 'mūrus',
        'german': 'die Mauer',
        'level': 3,
        'history': [],
      });
      expect(v.isNew, isTrue);
      expect(v.level, 3);
    });
  });

  group('Wiederholungs-Sitzung', () {
    test('Fällige zuerst (am ehesten vergessen vorne), dann begrenzt neue', () {
      final weak = vocab('weak')..review(Rating.hard, t0);
      final strong = vocab('strong')..review(Rating.easy, t0);
      final notYet = vocab('notYet')..review(Rating.easy, t0);
      final fresh = [for (var i = 0; i < 20; i++) vocab('n$i')];

      // Später: beide fällig, „notYet" bekommt einen neuen fernen Termin.
      final later = t0.add(const Duration(days: 30));
      notYet.review(Rating.easy, later);

      final session = buildReviewSession(
        [strong, weak, notYet, ...fresh],
        now: later,
      );
      expect(session.take(2).map((v) => v.id), ['weak', 'strong']);
      expect(session.length, 2 + newCardsPerSession);
      expect(session.contains(notYet), isFalse);
    });

    test('Keine Doppelten, wenn eine Vokabel in mehreren Listen ist', () {
      final v = vocab('a');
      expect(buildReviewSession([v, v, v]).length, 1);
    });

    test('Wiederholung wird spätestens auf den Testtag gelegt', () {
      final v = vocab('a');
      final exam = DateTime(2026, 1, 3);
      final lists = [
        PracticeList(id: 'l', name: 'Test', vocabIds: ['a'], dueDate: exam),
      ];
      reviewWithExam(v, Rating.easy, lists, now: t0);
      expect(v.srs!.due, exam);
    });

    test('Vergangene Testtermine begrenzen nichts', () {
      final v = vocab('a');
      final lists = [
        PracticeList(
          id: 'l',
          name: 'Alt',
          vocabIds: ['a'],
          dueDate: DateTime(2025, 12, 1),
        ),
      ];
      reviewWithExam(v, Rating.easy, lists, now: t0);
      expect(v.srs!.due.difference(t0).inDays, greaterThan(5));
    });
  });
}
