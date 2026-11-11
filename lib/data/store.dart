import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/practice_list.dart';
import '../models/vocab.dart';

/// Zentrale Ablage für Lektionen und Übungslisten (Singleton).
///
/// Alles wird als JSON in den `shared_preferences` gespeichert – im Browser
/// ist das der `localStorage`, auf dem Handy der App-Speicher. Es gibt keinen
/// Server: Sicherungen laufen über Export/Import (siehe [toBackupJson]).
class Store {
  Store._();
  static final Store instance = Store._();

  static const _lessonsKey = 'vocab_lessons_v3';
  static const _listsKey = 'vocab_practice_lists_v1';
  static const _logKey = 'review_log_v1';

  /// Höchstzahl gleichzeitiger Übungslisten.
  static const maxLists = 10;

  List<Lesson> lessons = [];
  List<PracticeList> practiceLists = [];

  /// Wird bei jeder Änderung hochgezählt (damit Ansichten neu zeichnen).
  final ValueNotifier<int> revision = ValueNotifier<int>(0);

  /// Abfragen pro Tag („2026-11-07" → 34) für Lernserie und Tagesstatistik.
  Map<String, int> reviewLog = {};

  /// Lädt den gespeicherten Stand.
  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final lessonsRaw = prefs.getString(_lessonsKey);
    final listsRaw = prefs.getString(_listsKey);
    final logRaw = prefs.getString(_logKey);
    reviewLog = logRaw == null
        ? {}
        : (jsonDecode(logRaw) as Map<String, dynamic>)
            .map((k, v) => MapEntry(k, (v as num).toInt()));
    _apply(
      lessonsJson: lessonsRaw == null ? [] : jsonDecode(lessonsRaw) as List,
      listsJson: listsRaw == null ? [] : jsonDecode(listsRaw) as List,
    );
  }

  /// Übernimmt Lektionen/Listen aus JSON.
  void _apply({required List lessonsJson, required List listsJson}) {
    lessons = lessonsJson
        .map((e) => Lesson.fromJson(e as Map<String, dynamic>))
        .toList();
    _sortLessons();
    practiceLists = listsJson
        .map((e) => PracticeList.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  // ── Eigene Lektionen ───────────────────────────────────────────────────

  Future<void> addLesson(Lesson lesson) async {
    lessons.add(lesson);
    _sortLessons();
    await save();
  }

  /// Löscht [lesson] und nimmt ihre Vokabeln aus allen Übungslisten.
  Future<void> deleteLesson(Lesson lesson) async {
    final ids = {for (final v in lesson.allVocabs) v.id};
    lessons.removeWhere((l) => l.id == lesson.id);
    for (final list in practiceLists) {
      list.vocabIds.removeWhere(ids.contains);
    }
    await save();
  }

  /// Entfernt eine Vokabel aus ihrer Lektion und allen Übungslisten.
  Future<void> deleteVocab(Vocab vocab) async {
    for (final l in lessons) {
      for (final b in l.boxes) {
        b.vocabs.removeWhere((v) => v.id == vocab.id);
      }
    }
    for (final list in practiceLists) {
      list.vocabIds.remove(vocab.id);
    }
    await save();
  }

  Future<void> save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _lessonsKey,
      jsonEncode(lessons.map((l) => l.toJson()).toList()),
    );
    await prefs.setString(
      _listsKey,
      jsonEncode(practiceLists.map((l) => l.toJson()).toList()),
    );
    await prefs.setString(_logKey, jsonEncode(reviewLog));
    revision.value++;
  }

  // ── Statistik ──────────────────────────────────────────────────────────

  static String dayKey(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-'
      '${d.day.toString().padLeft(2, '0')}';

  /// Zählt eine Abfrage für heute (gespeichert wird mit dem nächsten [save]).
  void logReview([DateTime? now]) {
    final key = dayKey(now ?? DateTime.now());
    reviewLog[key] = (reviewLog[key] ?? 0) + 1;
  }

  /// Abfragen heute.
  int get reviewsToday => reviewLog[dayKey(DateTime.now())] ?? 0;

  /// Lernserie: Tage in Folge mit mindestens einer Abfrage. Zählt bis
  /// gestern, wenn heute noch nicht gelernt wurde (die Serie ist dann noch
  /// zu retten).
  int streak([DateTime? now]) {
    now ??= DateTime.now();
    var day = DateTime(now.year, now.month, now.day);
    if ((reviewLog[dayKey(day)] ?? 0) == 0) {
      day = day.subtract(const Duration(days: 1));
    }
    var count = 0;
    while ((reviewLog[dayKey(day)] ?? 0) > 0) {
      count++;
      day = DateTime(day.year, day.month, day.day - 1);
    }
    return count;
  }

  // ── Sicherung ──────────────────────────────────────────────────────────

  /// Kompletter Stand als JSON-Text (für „Sicherung exportieren").
  String toBackupJson() => const JsonEncoder.withIndent(' ').convert({
        'app': 'vokabellerner',
        'version': 1,
        'exportedAt': DateTime.now().toIso8601String(),
        'lessons': lessons.map((l) => l.toJson()).toList(),
        'lists': practiceLists.map((l) => l.toJson()).toList(),
        'reviewLog': reviewLog,
      });

  /// Stellt eine Sicherung wieder her. Wirft [FormatException], wenn der
  /// Text keine gültige Sicherung ist.
  Future<void> restoreBackup(String text) async {
    final Object? json;
    try {
      json = jsonDecode(text);
    } on FormatException {
      throw const FormatException('Das ist keine gültige Sicherungsdatei.');
    }
    if (json is! Map || json['lessons'] is! List) {
      throw const FormatException('Das ist keine gültige Sicherungsdatei.');
    }
    try {
      _apply(
        lessonsJson: json['lessons'] as List,
        listsJson: (json['lists'] as List?) ?? [],
      );
      final log = json['reviewLog'];
      reviewLog = log is Map
          ? log.map((k, v) => MapEntry(k as String, (v as num).toInt()))
          : {};
    } catch (_) {
      throw const FormatException('Die Sicherungsdatei ist beschädigt.');
    }
    await save();
  }

  /// Setzt allen Lernfortschritt zurück (Lektionen bleiben).
  Future<void> resetProgress() async {
    for (final v in vocabById.values) {
      v
        ..level = 0
        ..history = []
        ..srs = null;
    }
    reviewLog = {};
    await save();
  }

  // ── Sortierung & Nachschlagen ──────────────────────────────────────────

  /// Sortiert die Lektionen numerisch nach der Nummer im Namen
  /// („Lektion 1“, „Lektion 2“, …, „Lektion 18“). Namen ohne Nummer
  /// kommen alphabetisch ans Ende.
  void _sortLessons() {
    lessons.sort(_compareLessons);
  }

  int _compareLessons(Lesson a, Lesson b) {
    final int? na = _lessonNumber(a.name);
    final int? nb = _lessonNumber(b.name);
    if (na == null && nb == null) return a.name.compareTo(b.name);
    if (na == null) return 1;
    if (nb == null) return -1;
    return na.compareTo(nb);
  }

  int? _lessonNumber(String name) {
    final match = RegExp(
      r'^lektion\s*(\d+)',
      caseSensitive: false,
    ).firstMatch(name.trim());
    return match == null ? null : int.tryParse(match.group(1)!);
  }

  /// Alle Vokabeln per ID nachschlagen.
  Map<String, Vocab> get vocabById {
    final map = <String, Vocab>{};
    for (final lesson in lessons) {
      for (final box in lesson.boxes) {
        for (final v in box.vocabs) {
          map[v.id] = v;
        }
      }
    }
    return map;
  }

  /// Lektion, zu der [vocab] gehört.
  Lesson? lessonOf(Vocab vocab) {
    for (final l in lessons) {
      for (final b in l.boxes) {
        if (b.vocabs.any((v) => v.id == vocab.id)) return l;
      }
    }
    return null;
  }

  /// Löst IDs zu Vokabeln auf (unbekannte IDs werden übersprungen).
  List<Vocab> resolveVocabs(Iterable<String> ids) {
    final map = vocabById;
    return [for (final id in ids) if (map[id] != null) map[id]!];
  }
}
