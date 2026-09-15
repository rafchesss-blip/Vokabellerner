import 'package:flutter_test/flutter_test.dart';

import 'package:vokabellerner/models/vocab.dart';
import 'package:vokabellerner/utils/goals.dart';

void main() {
  test('computeGoal ohne Zieldatum liefert nur Gesamtfortschritt', () {
    final vocabs = [
      Vocab(id: 'a', latin: 'a', german: 'a', level: 1),
      Vocab(id: 'b', latin: 'b', german: 'b', level: -1),
      Vocab(id: 'c', latin: 'c', german: 'c', level: 0),
    ];

    final g = computeGoal(vocabs, null);

    expect(g.total, 3);
    expect(g.known, 1);
    expect(g.overallPercent, closeTo(33.33, 0.01));
    expect(g.hasDailyGoal, false);
  });

  test('computeGoal mit Zieldatum berechnet Tagesziel', () {
    final now = DateTime(2025, 1, 1);
    final vocabs = [
      for (var i = 0; i < 4; i++)
        Vocab(id: '$i', latin: '$i', german: '$i', level: 0),
    ];

    // 4 Vokabeln, Ziel in 2 Tagen (heute + morgen).
    final g = computeGoal(vocabs, DateTime(2025, 1, 2), now: now);

    expect(g.daysRemaining, 2);
    expect(g.dailyTarget, 2);
    expect(g.learnedToday, 0);
    expect(g.dailyPercent, 0);
    expect(g.overallPercent, 0);
  });

  test('learnedToday zählt nur Vokabeln, die heute erstmals positiv wurden', () {
    final now = DateTime(2025, 1, 1);
    final today = DateTime(2025, 1, 1, 9);
    final yesterday = DateTime(2024, 12, 31, 9);

    final vocabs = [
      Vocab(
        id: 'a',
        latin: 'a',
        german: 'a',
        level: 1,
        history: [StatEvent(time: today, level: 1)],
      ),
      Vocab(
        id: 'b',
        latin: 'b',
        german: 'b',
        level: 1,
        history: [StatEvent(time: yesterday, level: 1)],
      ),
      Vocab(id: 'c', latin: 'c', german: 'c', level: 0),
    ];

    final g = computeGoal(vocabs, DateTime(2025, 1, 2), now: now);

    expect(g.known, 2);
    expect(g.learnedToday, 1);
  });

  test('alle Vokabeln gewusst ergibt 100 % und kein offenes Tagesziel', () {
    final now = DateTime(2025, 1, 1);
    final vocabs = [
      Vocab(id: 'a', latin: 'a', german: 'a', level: 3),
      Vocab(id: 'b', latin: 'b', german: 'b', level: 5),
    ];

    final g = computeGoal(vocabs, DateTime(2025, 1, 10), now: now);

    expect(g.remaining, 0);
    expect(g.dailyTarget, 0);
    expect(g.overallPercent, 100);
    expect(g.dailyPercent, 100);
  });
}
