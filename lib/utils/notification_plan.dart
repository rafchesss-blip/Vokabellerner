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

// Platzhalter: {n} = Vokabeln heute (fällig + neu), {due} = fällig,
// {new} = neu, {streak} = Lernserie, {list} = Testname, {days} = Tage bis
// zum Test.

/// Erste Erinnerung des Tages: freundlich.
const _first = [
  ('🧠 {n} Vokabeln warten auf dich', 'Ein paar Minuten reichen – los geht\'s!'),
  ('⚔️ Die Vokabeln greifen an!', '{n} Stück wollen heute besiegt werden.'),
  ('🕵️ Geheimauftrag für heute', '{n} lateinische Wörter entschlüsseln. Bereit?'),
  ('🏛️ Ave! Rom ruft.', 'Heute stehen {n} Vokabeln auf dem Plan.'),
  ('🎯 Mission des Tages', '{n} Vokabeln knacken – schaffst du sie alle?'),
  ('🦉 Die Eule der Minerva hat Hunger', 'Füttere sie mit {n} Vokabeln!'),
  ('🎲 Kleine Wette?', 'Ich wette, du schaffst die {n} Vokabeln in 5 Minuten.'),
];

/// Mittlere Erinnerung: etwas drängender.
const _middle = [
  ('⏰ Psst… deine Vokabeln warten noch', '{n} Stück sind heute noch offen.'),
  ('🐢 Die Vokabeln werden ungeduldig', 'Noch {n} warten – nur ein paar Minuten!'),
  ('💬 Caesar fragt, wo du bleibst', '{n} Vokabeln sind noch übrig.'),
  ('🧩 Fast vergessen?', '{n} Vokabeln wollen heute noch wiederholt werden.'),
  ('🚀 Kurzer Boost gefällig?', '{n} Karten, dann hast du Ruhe.'),
];

/// Letzte Erinnerung vor 21 Uhr: letzte Chance.
const _last = [
  ('🌙 Letzte Chance für heute!', 'Noch {n} Vokabeln – danach ist Feierabend.'),
  ('⌛ Der Tag ist fast vorbei', '{n} Vokabeln, dann bist du für heute durch.'),
  ('🛡️ Endspurt für heute', 'Noch {n} Vokabeln bis zum Feierabend.'),
];

String _fill(String text, Map<String, Object> values) {
  var out = text;
  values.forEach((k, v) => out = out.replaceAll('{$k}', '$v'));
  return out;
}

/// Plant die Erinnerungen für die nächsten [planDays] Tage.
///
/// * [perDay] Erinnerungen pro Tag (1–3), alle vor [quietFromHour] Uhr.
/// * Die Zahlen kommen aus der echten Lernplanung ([planReview]). Für
///   kommende Tage wird angenommen, dass bis dahin nicht gelernt wird – wer
///   lernt, öffnet die App, und dann wird ohnehin neu geplant.
/// * Ist heute alles erledigt, gibt es heute keine Erinnerung mehr.
/// * Vor einem Test: Countdown, am Vortag „letzter Lerntag", am Testtag
///   morgens viel Glück.
List<PlannedNotification> planNotifications({
  required List<Vocab> pool,
  required List<PracticeList> lists,
  required int perDay,
  required int streak,
  required bool practicedToday,
  DateTime? now,
}) {
  now ??= DateTime.now();
  final slots = reminderSlots[perDay.clamp(1, 3)]!;
  final today = DateTime(now.year, now.month, now.day);
  final result = <PlannedNotification>[];

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
          '🍀 Heute ist „${l.name}"!',
          'Du hast geübt – jetzt zeig, was du kannst. Viel Erfolg! 💪',
        ));
      }
    }

    if (pool.isEmpty) continue;

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
      final plan = planReview(pool, lists, now: d == 0 ? now : time);
      if (plan.isEmpty) continue;
      final n = plan.due.length + plan.fresh.length;

      final values = <String, Object>{
        'n': n,
        'due': plan.due.length,
        'new': plan.fresh.length,
        'streak': streak,
      };
      final isLast = i == slots.length - 1;
      final variant = d + i;

      var (title, body) = slots.length == 1 || i == 0
          ? _first[variant % _first.length]
          : isLast
              ? _last[variant % _last.length]
              : _middle[variant % _middle.length];

      // Lernserie in Gefahr (nur heute bekannt, ob schon gelernt wurde).
      if (isLast && streak > 0 && (d > 0 || !practicedToday)) {
        title = '🔥 Deine $streak-Tage-Serie ist in Gefahr!';
        body = 'Noch {n} Vokabeln – lern heute, damit sie nicht reißt.';
      }

      // Bevorstehender Test hat Vorrang.
      final exam = nextExamList(lists, now: day);
      if (exam != null) {
        final e = exam.dueDate!;
        final days = DateTime(e.year, e.month, e.day).difference(day).inDays;
        values['list'] = exam.name;
        values['days'] = days;
        if (days == 1) {
          title = '🚨 Morgen ist „{list}"!';
          body = isLast
              ? 'Letzte Chance: noch {n} Vokabeln wiederholen!'
              : 'Heute ist der letzte Lerntag – {n} Vokabeln warten.';
        } else if (days >= 2 && days <= 3 && i == 0) {
          title = '⚡ Noch {days} Tage bis „{list}"';
          body = 'Endspurt! Heute sind {n} Vokabeln dran.';
        }
      }

      result.add(PlannedNotification(
        time,
        _fill(title, values),
        _fill(body, values),
      ));
    }
  }

  result.sort((a, b) => a.time.compareTo(b.time));
  return result;
}
