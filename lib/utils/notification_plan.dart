import '../l10n/l10n.dart';
import '../models/practice_list.dart';
import '../models/vocab.dart';
import 'review_queue.dart';

/// Eine geplante Lern-Erinnerung.
class PlannedNotification {
  final DateTime time;
  final String title;
  final String body;

  const PlannedNotification(this.time, this.title, this.body);

  @override
  String toString() => '$time  $title';
}

/// Uhrzeiten pro Tag – alle vor 21 Uhr (danach ist es zu spät zum Lernen).
const Map<int, List<(int, int)>> reminderSlots = {
  1: [(17, 0)],
  2: [(15, 0), (19, 0)],
  3: [(14, 30), (17, 30), (20, 15)],
};

/// Ab dieser Stunde wird nicht mehr erinnert.
const int quietFromHour = 21;

/// Wie viele Tage im Voraus geplant wird. Öffnet man die App, wird neu
/// geplant – mit aktuellen Zahlen.
const int planDays = 10;

/// Eine Text-Variante: (Titel, Text) für [n] Vokabeln und den Namen.
typedef _Variant = (String, String) Function(int n, String name);

/// Erste Erinnerung des Tages: freundlich.
List<_Variant> _first(AppLocalizations l) => [
      (n, _) => (l.notifFirst1Title(n), l.notifFirst1Body),
      (n, _) => (l.notifFirst2Title, l.notifFirst2Body(n)),
      (n, _) => (l.notifFirst3Title, l.notifFirst3Body(n)),
      (n, _) => (l.notifFirst4Title, l.notifFirst4Body(n)),
      (n, _) => (l.notifFirst5Title, l.notifFirst5Body(n)),
      (n, _) => (l.notifFirst6Title, l.notifFirst6Body(n)),
      (n, _) => (l.notifFirst7Title, l.notifFirst7Body(n)),
    ];

/// Erste Erinnerung mit Namen, abwechselnd mit [_first].
List<_Variant> _firstNamed(AppLocalizations l) => [
      (n, name) => (l.notifNamed1Title(name), l.notifNamed1Body(n)),
      (n, name) => (l.notifNamed2Title(name), l.notifNamed2Body(n)),
      (n, name) => (l.notifNamed3Title(name), l.notifNamed3Body(n)),
    ];

/// Mittlere Erinnerung: etwas drängender.
List<_Variant> _middle(AppLocalizations l) => [
      (n, _) => (l.notifMiddle1Title, l.notifMiddle1Body(n)),
      (n, _) => (l.notifMiddle2Title, l.notifMiddle2Body(n)),
      (n, _) => (l.notifMiddle3Title, l.notifMiddle3Body(n)),
      (n, _) => (l.notifMiddle4Title, l.notifMiddle4Body(n)),
      (n, _) => (l.notifMiddle5Title, l.notifMiddle5Body(n)),
    ];

/// Letzte Erinnerung vor 21 Uhr: letzte Chance.
List<_Variant> _last(AppLocalizations l) => [
      (n, _) => (l.notifLast1Title, l.notifLast1Body(n)),
      (n, _) => (l.notifLast2Title, l.notifLast2Body(n)),
      (n, _) => (l.notifLast3Title, l.notifLast3Body(n)),
    ];

/// Plant die Erinnerungen für die nächsten [planDays] Tage.
///
/// * [perDay] Erinnerungen pro Tag (1–3), alle vor [quietFromHour] Uhr.
/// * Die Zahlen kommen aus der echten Lernplanung ([planReview]). Für
///   kommende Tage wird angenommen, dass bis dahin nicht gelernt wird – wer
///   lernt, öffnet die App, und dann wird ohnehin neu geplant.
/// * Ist heute alles erledigt, gibt es heute keine Erinnerung mehr.
/// * Ist der Test einer Liste vorbei, erinnert sie nicht mehr ans Lernen.
/// * Vor einem Test: Countdown, am Vortag „letzter Lerntag", am Testtag
///   morgens viel Glück.
List<PlannedNotification> planNotifications({
  required List<Vocab> pool,
  required List<PracticeList> lists,
  required int perDay,
  required int streak,
  required bool practicedToday,
  String name = '',
  DateTime? now,
}) {
  now ??= DateTime.now();
  final slots = reminderSlots[perDay.clamp(1, 3)]!;
  final today = DateTime(now.year, now.month, now.day);
  final result = <PlannedNotification>[];
  final l10n = L;
  final first = _first(l10n);
  final firstNamed = _firstNamed(l10n);
  final middle = _middle(l10n);
  final last = _last(l10n);

  for (var d = 0; d < planDays; d++) {
    final day = DateTime(today.year, today.month, today.day + d);

    // Testtag: morgens Daumen drücken.
    for (final l in lists) {
      final exam = l.dueDate;
      if (exam == null || DateTime(exam.year, exam.month, exam.day) != day) {
        continue;
      }
      final morning = DateTime(day.year, day.month, day.day, 7);
      if (morning.isAfter(now)) {
        result.add(PlannedNotification(
          morning,
          l10n.notifExamDayTitle(l.name),
          l10n.notifExamDayBody,
        ));
      }
    }

    // Nur Vokabeln aus Listen, deren Test noch nicht vorbei ist.
    final ids = {for (final l in activeLists(lists, now: day)) ...l.vocabIds};
    final dayPool = [for (final v in pool) if (ids.contains(v.id)) v];
    if (dayPool.isEmpty) continue;

    // Am Testtag wird nicht mehr gelernt.
    final examToday = nextExamList(lists, now: day)?.dueDate;
    if (examToday != null &&
        DateTime(examToday.year, examToday.month, examToday.day) == day) {
      continue;
    }

    for (var i = 0; i < slots.length; i++) {
      final (h, m) = slots[i];
      if (h >= quietFromHour) continue;
      final time = DateTime(day.year, day.month, day.day, h, m);
      if (!time.isAfter(now)) continue;

      // Für heute zählt der aktuelle Stand, für später der erwartete.
      final plan = planReview(dayPool, lists, now: d == 0 ? now : time);
      if (plan.isEmpty) continue;
      final n = plan.due.length + plan.fresh.length;

      final isLast = i == slots.length - 1;
      final variant = d + i;

      var (title, body) = (slots.length == 1 || i == 0
          ? (name.isNotEmpty && d.isEven
              ? firstNamed[(d ~/ 2) % firstNamed.length]
              : first[variant % first.length])
          : isLast
              ? last[variant % last.length]
              : middle[variant % middle.length])(n, name);

      // Lernserie in Gefahr (nur heute bekannt, ob schon gelernt wurde).
      if (isLast && streak > 0 && (d > 0 || !practicedToday)) {
        title = name.isEmpty
            ? l10n.notifStreakTitle(streak)
            : l10n.notifStreakTitleNamed(name, streak);
        body = l10n.notifStreakBody(n);
      }

      // Bevorstehender Test hat Vorrang.
      final exam = nextExamList(lists, now: day);
      if (exam != null) {
        final e = exam.dueDate!;
        final days = DateTime(e.year, e.month, e.day).difference(day).inDays;
        if (days == 1) {
          title = l10n.notifExamTomorrowTitle(exam.name);
          body = isLast
              ? l10n.notifExamTomorrowBodyLast(n)
              : l10n.notifExamTomorrowBody(n);
        } else if (days >= 2 && days <= 3 && i == 0) {
          title = l10n.notifExamSoonTitle(days, exam.name);
          body = l10n.notifExamSoonBody(n);
        }
      }

      result.add(PlannedNotification(time, title, body));
    }
  }

  result.sort((a, b) => a.time.compareTo(b.time));
  return result;
}
