import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import 'package:vokabellerner/models/practice_list.dart';
import 'package:vokabellerner/models/vocab.dart';
import 'package:vokabellerner/utils/fsrs.dart';
import 'package:vokabellerner/utils/reminders.dart';
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

  group('Planung nach Testdatum', () {
    PracticeList listWith(List<Vocab> vocabs, DateTime? exam) => PracticeList(
          id: 'l',
          name: 'Test',
          vocabIds: [for (final v in vocabs) v.id],
          dueDate: exam,
        );

    test('Fällige zuerst (am ehesten vergessen vorne), ohne Datum 15 neue', () {
      final weak = vocab('weak')..review(Rating.hard, t0);
      final strong = vocab('strong')..review(Rating.easy, t0);
      final notYet = vocab('notYet')..review(Rating.easy, t0);
      final fresh = [for (var i = 0; i < 20; i++) vocab('n$i')];

      final later = t0.add(const Duration(days: 30));
      notYet.review(Rating.easy, later);

      final plan = planReview([strong, weak, notYet, ...fresh], [], now: later);
      expect(plan.due.map((v) => v.id), ['weak', 'strong']);
      expect(plan.fresh.length, newCardsPerSession);
      expect(plan.freshLater, 20 - newCardsPerSession);
    });

    test('Keine Doppelten, wenn eine Vokabel mehrfach im Pool ist', () {
      final v = vocab('a');
      expect(planReview([v, v, v], []).session.length, 1);
    });

    test('Neue Vokabeln werden bis zum Vortag des Tests verteilt', () {
      final vocabs = [for (var i = 0; i < 20; i++) vocab('v$i')];
      // Test am 6.1. → Lerntage 1.–5.1. = 5 Tage → 4 neue pro Tag.
      final lists = [listWith(vocabs, DateTime(2026, 1, 6))];

      var plan = planReview(vocabs, lists, now: t0);
      expect(plan.fresh.length, 4);

      // 4 heute gelernt → für heute keine neuen mehr.
      for (final v in plan.fresh) {
        reviewWithExam(v, Rating.good, lists, now: t0);
      }
      plan = planReview(vocabs, lists, now: t0.add(const Duration(hours: 2)));
      expect(plan.fresh, isEmpty);

      // Am letzten Lerntag kommen alle restlichen neuen dran.
      plan = planReview(vocabs, lists, now: DateTime(2026, 1, 5, 9));
      expect(plan.fresh.length, 16);
    });

    test('Letzte Wiederholung spätestens am Tag VOR dem Test', () {
      final v = vocab('a');
      final lists = [listWith([v], DateTime(2026, 1, 3))];
      reviewWithExam(v, Rating.easy, lists, now: t0); // 1.1., 10 Uhr
      expect(v.srs!.due, DateTime(2026, 1, 2));
    });

    test('Je näher der Test, desto kürzer die Abstände', () {
      final v = vocab('a');
      final exam = DateTime(2026, 1, 31);
      final lists = [listWith([v], exam)];
      var now = t0;
      final gaps = <int>[];
      while (now.isBefore(DateTime(2026, 1, 30))) {
        reviewWithExam(v, Rating.easy, lists, now: now);
        gaps.add(v.srs!.due.difference(now).inHours);
        // Höchstens halbe Restzeit bis zum letzten Lerntag (min. 1 Tag).
        final remaining = studyDeadline(exam).difference(now).inHours;
        expect(gaps.last, lessThanOrEqualTo(remaining ~/ 2 + 24));
        now = v.srs!.due.add(const Duration(hours: 10));
      }
      expect(gaps.length, greaterThan(3));
    });

    test('Vergangene Tests begrenzen nichts', () {
      final v = vocab('a');
      final lists = [listWith([v], DateTime(2025, 12, 1))];
      reviewWithExam(v, Rating.easy, lists, now: t0);
      expect(v.srs!.due.difference(t0).inDays, greaterThan(5));
    });
  });

  group('Kalender-Erinnerungen', () {
    final list = PracticeList(
      id: 'l1',
      name: 'Vokabeltest 1',
      vocabIds: const [],
      dueDate: DateTime(2026, 1, 6),
    );

    test('Ein Termin pro Lerntag bis zum Vortag, dazu der Testtag', () {
      final r = planReminders(list,
          newVocabs: 20, hour: 16, minute: 30, now: t0);
      // 1.–5.1. um 16:30 (heute ist es erst 10 Uhr) + Testtag 6.1. um 7 Uhr.
      expect(r.length, 6);
      expect(r.first.start, DateTime(2026, 1, 1, 16, 30));
      expect(r[4].start, DateTime(2026, 1, 5, 16, 30));
      expect(r[4].title, contains('Letzter Lerntag'));
      expect(r.last.start, DateTime(2026, 1, 6, 7));
      expect(r.last.title, contains('Heute ist'));
    });

    test('Heute schon vorbei → erst ab morgen', () {
      final r = planReminders(list,
          newVocabs: 5, hour: 8, minute: 0, now: t0);
      expect(r.first.start, DateTime(2026, 1, 2, 8));
    });

    test('Kalenderdatei ist gültig aufgebaut', () {
      final r = planReminders(list,
          newVocabs: 20, hour: 16, minute: 0, now: t0);
      final ics = buildIcs(r,
          uidPrefix: 'l1', url: 'https://example.org/app/', now: t0);
      expect(ics, startsWith('BEGIN:VCALENDAR\r\n'));
      expect(ics, endsWith('END:VCALENDAR\r\n'));
      expect('BEGIN:VEVENT'.allMatches(ics).length, r.length);
      expect('BEGIN:VALARM'.allMatches(ics).length, r.length);
      expect(ics, contains('DTSTART:20260101T160000'));
      for (final line in ics.split('\r\n')) {
        expect(utf8.encode(line).length, lessThanOrEqualTo(75), reason: line);
      }
    });
  });
}
