import 'package:flutter_test/flutter_test.dart';

import 'package:vokabellerner/models/practice_list.dart';
import 'package:vokabellerner/models/vocab.dart';
import 'package:vokabellerner/utils/fsrs.dart';
import 'package:vokabellerner/utils/notification_plan.dart';

void main() {
  final morning = DateTime(2026, 3, 2, 8); // Montag, 8 Uhr
  List<Vocab> vocabs(int n) => [
        for (var i = 0; i < n; i++) Vocab(id: 'v$i', latin: 'l$i', german: 'd$i'),
      ];
  PracticeList list(List<Vocab> v, [DateTime? exam]) => PracticeList(
        id: 'l',
        name: 'Vokabeltest 1',
        vocabIds: [for (final x in v) x.id],
        dueDate: exam,
      );

  test('Mehrmals am Tag, nie ab 21 Uhr, mit echten Zahlen', () {
    final pool = vocabs(10);
    final plan = planNotifications(
      pool: pool,
      lists: [list(pool)],
      perDay: 3,
      streak: 0,
      practicedToday: false,
      now: morning,
    );

    final today = plan.where((n) => n.time.day == 2).toList();
    expect(today.map((n) => n.time.hour), [14, 17, 20]);
    expect(plan.every((n) => n.time.hour < quietFromHour), isTrue);
    expect('${today.first.title} ${today.first.body}', contains('10'));
    // Die Texte wechseln.
    expect(plan.map((n) => n.title).toSet().length, greaterThan(3));
  });

  test('Ist heute alles gelernt, kommt heute nichts mehr', () {
    final pool = vocabs(3);
    final lists = [list(pool)];
    for (final v in pool) {
      v.review(Rating.easy, morning);
    }
    final plan = planNotifications(
      pool: pool,
      lists: lists,
      perDay: 3,
      streak: 4,
      practicedToday: true,
      now: morning.add(const Duration(hours: 1)),
    );
    expect(plan.where((n) => n.time.day == 2), isEmpty);
    // Später werden sie wieder fällig → dann wird wieder erinnert.
    expect(plan, isNotEmpty);
  });

  test('Vergangene Uhrzeiten von heute werden übersprungen', () {
    final pool = vocabs(5);
    final plan = planNotifications(
      pool: pool,
      lists: [list(pool)],
      perDay: 3,
      streak: 0,
      practicedToday: false,
      now: DateTime(2026, 3, 2, 18),
    );
    expect(plan.first.time, DateTime(2026, 3, 2, 20, 15));
  });

  test('Lernserie in Gefahr bei der letzten Erinnerung', () {
    final pool = vocabs(5);
    final plan = planNotifications(
      pool: pool,
      lists: [list(pool)],
      perDay: 2,
      streak: 6,
      practicedToday: false,
      now: morning,
    );
    final last = plan.firstWhere((n) => n.time.hour == 19);
    expect(last.title, contains('6-Tage-Serie'));
  });

  test('Vor dem Test: Countdown, letzter Lerntag, am Testtag nur viel Glück',
      () {
    final pool = vocabs(8);
    final exam = DateTime(2026, 3, 5); // Donnerstag
    final plan = planNotifications(
      pool: pool,
      lists: [list(pool, exam)],
      perDay: 3,
      streak: 0,
      practicedToday: false,
      now: morning,
    );

    final wednesday = plan.where((n) => n.time.day == 4).toList();
    expect(wednesday.first.title, contains('Morgen ist'));

    final examDay = plan.where((n) => n.time.day == 5).toList();
    expect(examDay.length, 1);
    expect(examDay.single.time.hour, 7);
    expect(examDay.single.title, contains('Heute ist'));

    final monday = plan.where((n) => n.time.day == 2).first;
    expect(monday.title, contains('Noch 3 Tage'));
  });

  test('Ohne Übungslisten keine Lern-Erinnerungen', () {
    final plan = planNotifications(
      pool: const [],
      lists: const [],
      perDay: 3,
      streak: 0,
      practicedToday: false,
      now: morning,
    );
    expect(plan, isEmpty);
  });
}
