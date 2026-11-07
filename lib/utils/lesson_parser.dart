// Zerlegt einen Lektionstext in Struktur.
//
// Format (so liegen auch die Dateien in `lektionen/`):
//
//   Lektion 5
//
//   Kasten 1
//   luna | f | der Mond
//   stella | der Stern
//
//   Kasten 2
//   ...
//
// Spalten werden durch „|“, Tabs oder mindestens zwei Leerzeichen getrennt
// (so lässt sich auch eine Tabelle aus Word/PDF direkt einfügen). Die
// mittlere Spalte ist optional. Zeilen, die mit „#“ beginnen, sind
// Kommentare.

class ParsedVocab {
  final String latin;
  final String? middle;
  final String german;

  const ParsedVocab({
    required this.latin,
    this.middle,
    required this.german,
  });
}

class ParsedBox {
  final String name;
  final List<ParsedVocab> vocabs;

  const ParsedBox({required this.name, required this.vocabs});
}

class ParsedLesson {
  final String name;
  final List<ParsedBox> boxes;

  const ParsedLesson({required this.name, required this.boxes});
}

ParsedLesson parseLessonText(String text) {
  final lines = text.split(RegExp(r'\r?\n'));
  String? lessonName;
  final boxes = <ParsedBox>[];
  ParsedBox? current;

  void closeBox() {
    if (current != null && current!.vocabs.isNotEmpty) boxes.add(current!);
    current = null;
  }

  for (final raw in lines) {
    final line = raw.trim();
    if (line.isEmpty || line.startsWith('#')) continue;

    if (_isHeaderLine(line)) continue;

    if (_isLessonName(line)) {
      lessonName ??= line;
      continue;
    }

    if (_isBoxName(line)) {
      closeBox();
      current = ParsedBox(name: line, vocabs: []);
      continue;
    }

    final parts = _splitColumns(raw);
    if (parts.length < 2) continue;

    final latin = parts.first;
    final german = parts.last;
    final String? middle = parts.length >= 3
        ? parts.sublist(1, parts.length - 1).join(' ')
        : null;

    current ??= ParsedBox(name: 'Kasten ${boxes.length + 1}', vocabs: []);
    current!.vocabs.add(
      ParsedVocab(latin: latin, middle: middle, german: german),
    );
  }

  closeBox();

  if (boxes.isEmpty) {
    throw const FormatException(
      'Keine Vokabeln erkannt. Bitte das Format prüfen.',
    );
  }

  return ParsedLesson(name: lessonName ?? 'Neue Lektion', boxes: boxes);
}

bool _isHeaderLine(String line) {
  final lower = line.toLowerCase();
  return lower.contains('lateinisches wort') ||
      lower.contains('mittlere spalte') ||
      lower.contains('übersetzung') ||
      lower.contains('ubersetzung');
}

bool _isLessonName(String line) =>
    RegExp(r'^lektion\b', caseSensitive: false).hasMatch(line);

bool _isBoxName(String line) =>
    RegExp(r'^kasten\b', caseSensitive: false).hasMatch(line);

List<String> _splitColumns(String raw) {
  final List<String> parts = raw.contains('|')
      ? raw.split('|')
      : raw.contains('\t')
          ? raw.split('\t')
          : raw.split(RegExp(r'\s{2,}'));
  return parts.map((p) => p.trim()).where((p) => p.isNotEmpty).toList();
}
