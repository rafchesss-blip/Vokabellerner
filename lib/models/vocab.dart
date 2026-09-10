int _idCounter = 0;

/// Erzeugt eine eindeutige ID (für Lektionen, Kästen, Vokabeln und Listen).
///
/// Kombiniert Zeitstempel und Zähler, damit auch bei grober Uhr-Auflösung
/// niemals doppelte IDs entstehen.
String newId() => '${DateTime.now().microsecondsSinceEpoch}-${++_idCounter}';

/// Ein Eintrag im Lern-Verlauf einer Vokabel (Zeitpunkt + Stufe).
class StatEvent {
  final DateTime time;
  final int level;

  StatEvent({required this.time, required this.level});

  factory StatEvent.fromJson(Map<String, dynamic> json) => StatEvent(
        time: DateTime.fromMillisecondsSinceEpoch(json['time'] as int),
        level: json['level'] as int,
      );

  Map<String, dynamic> toJson() => {
        'time': time.millisecondsSinceEpoch,
        'level': level,
      };
}

/// Eine einzelne Vokabel inklusive Lernstufe.
///
/// Die Lernstufe reicht von -5 (sehr schlecht) über 0 (neutral)
/// bis +5 (sehr gut).
class Vocab {
  String id;
  String latin;
  String german;
  String? middleColumn;

  /// Aktuelle Lernstufe: -5 .. +5, Standard 0 (neutral).
  int level;

  /// Verlauf aller Stufen-Änderungen.
  List<StatEvent> history;

  Vocab({
    required this.id,
    required this.latin,
    required this.german,
    this.middleColumn,
    this.level = 0,
    List<StatEvent>? history,
  }) : history = history ?? [];

  bool get hasMiddle =>
      middleColumn != null && middleColumn!.trim().isNotEmpty;

  /// „Noch nicht so gut": neutral oder schlechter.
  bool get isWeak => level < 1;

  /// Ändert die Lernstufe um [delta] (±1), begrenzt auf -5 .. +5.
  void adjustLevel(int delta) {
    final newLevel = (level + delta).clamp(-5, 5).toInt();
    if (newLevel == level) return;
    level = newLevel;
    history.add(StatEvent(time: DateTime.now(), level: newLevel));
  }

  void markCorrect() => adjustLevel(1);

  void markWrong() => adjustLevel(-1);

  factory Vocab.fromJson(Map<String, dynamic> json) => Vocab(
        id: json['id'] as String,
        latin: json['latin'] as String,
        german: json['german'] as String,
        middleColumn: json['middleColumn'] as String?,
        level: (json['level'] as num?)?.toInt() ?? 0,
        history: (json['history'] as List? ?? [])
            .map((e) => StatEvent.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'latin': latin,
        'german': german,
        'middleColumn': middleColumn,
        'level': level,
        'history': history.map((e) => e.toJson()).toList(),
      };
}

/// Ein Kasten innerhalb einer Lektion (Sammlung von Vokabeln).
class Box {
  String id;
  String name;
  List<Vocab> vocabs;

  Box({required this.id, required this.name, required this.vocabs});

  factory Box.fromJson(Map<String, dynamic> json) => Box(
        id: json['id'] as String,
        name: json['name'] as String,
        vocabs: (json['vocabs'] as List? ?? [])
            .map((e) => Vocab.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'vocabs': vocabs.map((v) => v.toJson()).toList(),
      };
}

/// Eine Lektion mit mehreren Kästen.
class Lesson {
  String id;
  String name;
  List<Box> boxes;

  Lesson({required this.id, required this.name, required this.boxes});

  /// Alle Vokabeln dieser Lektion (über alle Kästen hinweg).
  List<Vocab> get allVocabs =>
      boxes.expand((box) => box.vocabs).toList(growable: false);

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        id: json['id'] as String,
        name: json['name'] as String,
        boxes: (json['boxes'] as List? ?? [])
            .map((e) => Box.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'boxes': boxes.map((b) => b.toJson()).toList(),
      };
}
