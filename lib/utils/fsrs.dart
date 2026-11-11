import 'dart:math' as math;

import '../l10n/l10n.dart';

/// FSRS-6 („Free Spaced Repetition Scheduler") – derselbe Algorithmus,
/// den auch Anki seit Version 23.10 verwendet.
///
/// Quelle der Formeln und Standard-Parameter:
/// https://github.com/open-spaced-repetition/awesome-fsrs/wiki/The-Algorithm
///
/// Jede Vokabel hat ein Gedächtnis-Modell aus
///  * **Stabilität S** (Tage, bis die Abrufwahrscheinlichkeit auf 90 % fällt)
///  * **Schwierigkeit D** (1 = leicht … 10 = schwer)
/// Nach jeder Antwort werden S und D neu berechnet und daraus der nächste
/// Wiederholungstermin bestimmt.

/// Bewertung einer Antwort.
enum Rating {
  again(1), // Nicht gewusst
  hard(2), // Mit Mühe gewusst
  good(3), // Gewusst
  easy(4); // Sofort gewusst

  final int value;
  const Rating(this.value);
}

/// Gedächtniszustand einer Vokabel (unveränderlich).
class FsrsCard {
  final double stability;
  final double difficulty;
  final DateTime lastReview;
  final DateTime due;
  final int reps;
  final int lapses;

  /// Zeitpunkt der allerersten Abfrage (für „neue Vokabeln pro Tag").
  /// Bei Daten aus älteren Versionen unbekannt (`null`).
  final DateTime? firstReview;

  /// Zeitpunkt des letzten „Nochmal" (nicht gewusst).
  final DateTime? lapseAt;

  const FsrsCard({
    required this.stability,
    required this.difficulty,
    required this.lastReview,
    required this.due,
    this.reps = 0,
    this.lapses = 0,
    this.firstReview,
    this.lapseAt,
  });

  /// Kopie mit anderem Fälligkeitstermin.
  FsrsCard withDue(DateTime newDue) => FsrsCard(
        stability: stability,
        difficulty: difficulty,
        lastReview: lastReview,
        due: newDue,
        reps: reps,
        lapses: lapses,
        firstReview: firstReview,
        lapseAt: lapseAt,
      );

  factory FsrsCard.fromJson(Map<String, dynamic> json) => FsrsCard(
        stability: (json['s'] as num).toDouble(),
        difficulty: (json['d'] as num).toDouble(),
        lastReview: DateTime.fromMillisecondsSinceEpoch(json['last'] as int),
        due: DateTime.fromMillisecondsSinceEpoch(json['due'] as int),
        reps: (json['reps'] as num?)?.toInt() ?? 0,
        lapses: (json['lapses'] as num?)?.toInt() ?? 0,
        firstReview: json['first'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json['first'] as int),
        lapseAt: json['lapseAt'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json['lapseAt'] as int),
      );

  Map<String, dynamic> toJson() => {
        's': stability,
        'd': difficulty,
        'last': lastReview.millisecondsSinceEpoch,
        'due': due.millisecondsSinceEpoch,
        'reps': reps,
        'lapses': lapses,
        if (firstReview != null) 'first': firstReview!.millisecondsSinceEpoch,
        if (lapseAt != null) 'lapseAt': lapseAt!.millisecondsSinceEpoch,
      };
}

class Fsrs {
  /// Standard-Parameter von FSRS-6.
  static const List<double> w = [
    0.212, 1.2931, 2.3065, 8.2956, 6.4133, 0.8334, 3.0194, 0.001, 1.8722, //
    0.1666, 0.796, 1.4835, 0.0614, 0.2629, 1.6483, 0.6014, 1.8729, 0.5425,
    0.0912, 0.0658, 0.1542,
  ];

  /// Gewünschte Abrufwahrscheinlichkeit beim nächsten Termin.
  static const double desiredRetention = 0.9;

  static const double maxIntervalDays = 365;
  static const double _minStability = 0.001;

  static double get _decay => -w[20];
  static double get _factor => math.pow(0.9, 1 / _decay) - 1;

  /// Abrufwahrscheinlichkeit nach [elapsedDays] Tagen bei Stabilität [s].
  static double retrievability(double elapsedDays, double s) =>
      math.pow(1 + _factor * elapsedDays / s, _decay).toDouble();

  /// Aktuelle Abrufwahrscheinlichkeit einer Karte (0..1).
  static double retrievabilityOf(FsrsCard card, DateTime now) =>
      retrievability(_days(card.lastReview, now), card.stability);

  /// Intervall in Tagen, nach dem die Wahrscheinlichkeit [desiredRetention]
  /// erreicht.
  static double intervalDays(double s) {
    final i = s / _factor * (math.pow(desiredRetention, 1 / _decay) - 1);
    return i.clamp(1, maxIntervalDays).toDouble();
  }

  static double _initStability(Rating g) =>
      math.max(w[g.value - 1], _minStability);

  static double _initDifficulty(Rating g) =>
      w[4] - math.exp(w[5] * (g.value - 1)) + 1;

  static double _nextDifficulty(double d, Rating g) {
    final delta = -w[6] * (g.value - 3);
    final damped = d + delta * (10 - d) / 9;
    final reverted = w[7] * _initDifficulty(Rating.easy) + (1 - w[7]) * damped;
    return reverted.clamp(1, 10).toDouble();
  }

  static double _recallStability(double d, double s, double r, Rating g) {
    final hardPenalty = g == Rating.hard ? w[15] : 1.0;
    final easyBonus = g == Rating.easy ? w[16] : 1.0;
    return s *
        (1 +
            math.exp(w[8]) *
                (11 - d) *
                math.pow(s, -w[9]) *
                (math.exp(w[10] * (1 - r)) - 1) *
                hardPenalty *
                easyBonus);
  }

  static double _forgetStability(double d, double s, double r) {
    final sf = w[11] *
        math.pow(d, -w[12]) *
        (math.pow(s + 1, w[13]) - 1) *
        math.exp(w[14] * (1 - r));
    return math.min(sf, s / math.exp(w[17] * w[18]));
  }

  static double _shortTermStability(double s, Rating g) {
    final next =
        s * math.exp(w[17] * (g.value - 3 + w[18])) * math.pow(s, -w[19]);
    return g.value >= 3 ? math.max(next, s) : next;
  }

  static double _days(DateTime from, DateTime to) =>
      math.max(0, to.difference(from).inMinutes / (60 * 24));

  /// Berechnet den neuen Zustand nach einer Antwort mit [rating].
  /// [card] ist `null`, wenn die Vokabel zum ersten Mal abgefragt wird.
  static FsrsCard review(FsrsCard? card, Rating rating, DateTime now) {
    double s;
    double d;
    var lapses = card?.lapses ?? 0;

    if (card == null) {
      s = _initStability(rating);
      d = _initDifficulty(rating).clamp(1, 10).toDouble();
    } else {
      final elapsed = _days(card.lastReview, now);
      d = _nextDifficulty(card.difficulty, rating);
      if (elapsed < 1) {
        // Wiederholung am selben Tag.
        s = _shortTermStability(card.stability, rating);
      } else {
        final r = retrievability(elapsed, card.stability);
        s = rating == Rating.again
            ? _forgetStability(card.difficulty, card.stability, r)
            : _recallStability(card.difficulty, card.stability, r, rating);
      }
      if (rating == Rating.again) lapses++;
    }
    s = math.max(s, _minStability);

    // Nicht gewusst → am selben Tag (in 10 Minuten) erneut; sonst Tage.
    final due = rating == Rating.again
        ? now.add(const Duration(minutes: 10))
        : now.add(Duration(
            minutes: (intervalDays(s) * 24 * 60).round(),
          ));

    return FsrsCard(
      stability: s,
      difficulty: d,
      lastReview: now,
      due: due,
      reps: (card?.reps ?? 0) + 1,
      lapses: lapses,
      firstReview: card == null ? now : card.firstReview,
      lapseAt: rating == Rating.again ? now : card?.lapseAt,
    );
  }

  /// Vorschau: in wie vielen Tagen wäre die Karte bei [rating] wieder dran?
  static Duration previewInterval(FsrsCard? card, Rating rating, DateTime now) =>
      review(card, rating, now).due.difference(now);
}

/// Kurze Anzeige eines Intervalls, z. B. „10 Min", „3 T", „2 Mon".
String formatInterval(Duration d) {
  if (d.inMinutes < 60) return L.intervalMinutes(math.max(1, d.inMinutes));
  if (d.inHours < 24) return L.intervalHours(d.inHours);
  final days = (d.inMinutes / (60 * 24)).round();
  if (days < 31) return L.intervalDays(days);
  if (days < 365) return L.intervalMonths((days / 30).round());
  return L.intervalYears((days / 365).toStringAsFixed(1));
}
