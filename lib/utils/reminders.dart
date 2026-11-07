import 'dart:convert';
import 'dart:math' as math;

import '../models/practice_list.dart';
import 'review_queue.dart';

/// Lern-Erinnerungen als Kalenderdatei (.ics).
///
/// Die App läuft ohne Server, kann also selbst keine Benachrichtigungen
/// schicken, wenn sie geschlossen ist. Stattdessen landen die Erinnerungen
/// im Kalender des Handys – der meldet sich zuverlässig zur gewählten Zeit.

/// Eine Erinnerung (ein Lerntag oder der Testtag).
class Reminder {
  final DateTime start;
  final String title;
  final String body;

  const Reminder(this.start, this.title, this.body);
}

/// Texte mit Platzhaltern: {list} = Listenname, {days} = Tage bis zum Test,
/// {new} = geplante neue Vokabeln für den Tag.
const _dailyTitles = [
  '⏳ Noch {days} Tage bis „{list}" – die Uhr tickt!',
  '🧠 {new} Vokabeln wollen heute in dein Gehirn einziehen',
  '⚔️ Die Vokabeln greifen an! Noch {days} Tage – verteidige dich!',
  '🏛️ Caesar hätte jetzt gelernt. Und du?',
  '🔥 Lass deine Lernserie nicht ausgehen!',
  '🎯 Mission des Tages: {new} neue Wörter knacken',
  '🕵️ Geheimauftrag: {new} lateinische Wörter entschlüsseln',
  '🦉 Die Eule der Minerva wartet auf dich – nur 10 Minuten!',
  '🚀 {days} Tage bis „{list}". Jetzt Vorsprung holen!',
  '💎 Deine Vokabeln vermissen dich (ehrlich!)',
  '🏆 Wer heute übt, grinst am Testtag. Noch {days} Tage!',
  '🎲 Wetten, du schaffst heute alle Karten?',
];

const _dailyBodies = [
  'Heute: ca. {new} neue Vokabeln plus Wiederholungen. Dauert nur ein paar '
      'Minuten – los geht\'s!',
  'Ein paar Karten jetzt sparen dir am Ende viel Stress.',
  'Kurz reinschauen, Karten umdrehen, fertig. Dein zukünftiges Ich '
      'bedankt sich.',
];

String _fill(String text, PracticeList list, int days, int fresh) => text
    .replaceAll('{list}', list.name)
    .replaceAll('{days}', '$days')
    .replaceAll('{new}', '$fresh');

/// Plant Erinnerungen für [list]: jeden Lerntag bis zum Vortag des Tests
/// um [hour]:[minute] Uhr, dazu am Testtag morgens viel Glück.
///
/// [newVocabs] ist die Zahl der noch nicht gelernten Vokabeln der Liste.
List<Reminder> planReminders(
  PracticeList list, {
  required int newVocabs,
  required int hour,
  required int minute,
  DateTime? now,
}) {
  final exam = list.dueDate;
  if (exam == null) return [];
  now ??= DateTime.now();

  final today = DateTime(now.year, now.month, now.day);
  final deadline = studyDeadline(exam);
  final perDay = (newVocabs / studyDaysLeft(exam, now)).ceil();

  final reminders = <Reminder>[];
  for (var day = today;
      !day.isAfter(deadline);
      day = DateTime(day.year, day.month, day.day + 1)) {
    final start = DateTime(day.year, day.month, day.day, hour, minute);
    if (!start.isAfter(now)) continue; // heute schon vorbei
    final daysToExam = DateTime(exam.year, exam.month, exam.day)
        .difference(day)
        .inDays;
    final index = day.difference(today).inDays;

    final String title;
    final String body;
    if (day == deadline) {
      title = '🚨 Letzter Lerntag vor „${list.name}"! Heute wird alles '
          'wiederholt.';
      body = 'Morgen ist der Test. Geh heute alle fälligen Karten durch – '
          'dann bist du bereit!';
    } else if (daysToExam == 2) {
      title = '⚡ Übermorgen ist „${list.name}" – Endspurt!';
      body = _fill(_dailyBodies[index % _dailyBodies.length], list,
          daysToExam, perDay);
    } else {
      title = _fill(_dailyTitles[index % _dailyTitles.length], list,
          daysToExam, math.max(perDay, 1));
      body = _fill(_dailyBodies[index % _dailyBodies.length], list,
          daysToExam, math.max(perDay, 1));
    }
    reminders.add(Reminder(start, title, body));
  }

  // Testtag: kein Lernen mehr, nur Daumen drücken.
  final examMorning = DateTime(exam.year, exam.month, exam.day, 7, 0);
  if (examMorning.isAfter(now)) {
    reminders.add(Reminder(
      examMorning,
      '🍀 Heute ist „${list.name}"! Du hast geübt – du schaffst das!',
      'Tief durchatmen. Viel Erfolg! 💪',
    ));
  }
  return reminders;
}

/// Baut eine Kalenderdatei (iCalendar) aus [reminders].
String buildIcs(
  List<Reminder> reminders, {
  required String uidPrefix,
  String? url,
  DateTime? now,
}) {
  final stamp = _utcStamp(now ?? DateTime.now());
  final lines = <String>[
    'BEGIN:VCALENDAR',
    'VERSION:2.0',
    'PRODID:-//Vokabellerner//Erinnerungen//DE',
    'CALSCALE:GREGORIAN',
    'METHOD:PUBLISH',
  ];
  for (final r in reminders) {
    final description = url == null ? r.body : '${r.body}\n$url';
    lines.addAll([
      'BEGIN:VEVENT',
      'UID:$uidPrefix-${_localStamp(r.start)}@vokabellerner',
      'DTSTAMP:$stamp',
      'DTSTART:${_localStamp(r.start)}',
      'DURATION:PT15M',
      'SUMMARY:${_escape(r.title)}',
      'DESCRIPTION:${_escape(description)}',
      if (url != null) 'URL:$url',
      'BEGIN:VALARM',
      'ACTION:DISPLAY',
      'DESCRIPTION:${_escape(r.title)}',
      'TRIGGER:PT0M',
      'END:VALARM',
      'END:VEVENT',
    ]);
  }
  lines.add('END:VCALENDAR');
  return '${lines.map(_fold).join('\r\n')}\r\n';
}

String _two(int n) => n.toString().padLeft(2, '0');

/// Lokale Zeit ohne Zeitzone („floating") – gilt in jeder Zeitzone gleich.
String _localStamp(DateTime d) =>
    '${d.year}${_two(d.month)}${_two(d.day)}T${_two(d.hour)}${_two(d.minute)}00';

String _utcStamp(DateTime d) {
  final u = d.toUtc();
  return '${u.year}${_two(u.month)}${_two(u.day)}T'
      '${_two(u.hour)}${_two(u.minute)}${_two(u.second)}Z';
}

String _escape(String text) => text
    .replaceAll('\\', '\\\\')
    .replaceAll(';', '\\;')
    .replaceAll(',', '\\,')
    .replaceAll('\n', '\\n');

/// Zeilen über 75 Bytes umbrechen (iCalendar-Regel), ohne UTF-8-Zeichen zu
/// zerschneiden.
String _fold(String line) {
  if (utf8.encode(line).length <= 75) return line;
  final out = StringBuffer();
  var bytes = 0;
  for (final rune in line.runes) {
    final char = String.fromCharCode(rune);
    final len = utf8.encode(char).length;
    if (bytes + len > 74) {
      out.write('\r\n ');
      bytes = 1;
    }
    out.write(char);
    bytes += len;
  }
  return out.toString();
}
