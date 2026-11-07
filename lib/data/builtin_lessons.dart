import 'package:flutter/services.dart';

import '../models/vocab.dart';
import '../utils/lesson_parser.dart';

/// Eingebaute Lektionen: Textdateien im Ordner `lektionen/` des Repos.
///
/// Neue Datei auf GitHub anlegen → GitHub Actions baut die App neu → die
/// Lektion ist bei allen da. Der Lernfortschritt bleibt erhalten, weil die
/// IDs aus Dateiname + Wort gebildet werden (nicht zufällig).
const builtInPrefix = 'builtin:';

Future<List<Lesson>> loadBuiltInLessons([AssetBundle? bundle]) async {
  bundle ??= rootBundle;
  final manifest = await AssetManifest.loadFromAssetBundle(bundle);
  final files = manifest
      .listAssets()
      .where((a) => a.startsWith('lektionen/') && a.endsWith('.txt'))
      .toList()
    ..sort();

  final lessons = <Lesson>[];
  for (final file in files) {
    final key = file.substring('lektionen/'.length, file.length - 4);
    try {
      lessons.add(builtInLessonFromText(await bundle.loadString(file), key));
    } on FormatException {
      // Leere oder kaputte Datei überspringen statt die App abstürzen zu lassen.
    }
  }
  return lessons;
}

/// Baut eine eingebaute Lektion mit stabilen IDs aus dem Text einer Datei.
Lesson builtInLessonFromText(String text, String key) {
  final parsed = parseLessonText(text);
  final seen = <String, int>{};
  return Lesson(
    id: '$builtInPrefix$key',
    name: parsed.name,
    boxes: [
      for (var bi = 0; bi < parsed.boxes.length; bi++)
        Box(
          id: '$builtInPrefix$key:k${bi + 1}',
          name: parsed.boxes[bi].name,
          vocabs: [
            for (final v in parsed.boxes[bi].vocabs)
              Vocab(
                id: () {
                  final base = '$builtInPrefix$key:${v.latin}|${v.german}';
                  final n = seen[base] = (seen[base] ?? 0) + 1;
                  return n == 1 ? base : '$base#$n';
                }(),
                latin: v.latin,
                german: v.german,
                middleColumn: v.middle,
              ),
          ],
        ),
    ],
  );
}

String _contentKey(Vocab v) =>
    '${v.latin.trim().toLowerCase()}|${v.german.trim().toLowerCase()}';

/// Führt gespeicherte Lektionen mit den eingebauten zusammen.
///
/// * Inhalt eingebauter Lektionen kommt immer aus den Dateien.
/// * Lernfortschritt wird per ID übernommen – oder, bei alten Daten mit
///   Zufalls-IDs, per Lektionsname + Wort. [idMap] sammelt dabei, welche alte
///   ID zu welcher neuen wurde (für die Übungslisten).
/// * Eigene Lektionen bleiben unverändert.
List<Lesson> mergeBuiltInLessons(
  List<Lesson> stored,
  List<Lesson> builtIn, {
  Map<String, String>? idMap,
}) {
  final byId = {
    for (final l in stored)
      for (final v in l.allVocabs) v.id: v,
  };
  final storedByName = {
    for (final l in stored) l.name.trim().toLowerCase(): l,
  };
  final used = <Lesson>{};

  final result = <Lesson>[];
  for (final lesson in builtIn) {
    final match = stored.where((l) => l.id == lesson.id).firstOrNull ??
        storedByName[lesson.name.trim().toLowerCase()];
    if (match != null) used.add(match);
    final byContent = {
      if (match != null)
        for (final v in match.allVocabs) _contentKey(v): v,
    };

    for (final v in lesson.allVocabs) {
      final old = byId[v.id] ?? byContent[_contentKey(v)];
      if (old == null) continue;
      v
        ..level = old.level
        ..history = old.history
        ..srs = old.srs;
      if (old.id != v.id) idMap?[old.id] = v.id;
    }
    result.add(lesson);
  }

  for (final l in stored) {
    if (!used.contains(l) && !l.isBuiltIn) result.add(l);
  }
  return result;
}
