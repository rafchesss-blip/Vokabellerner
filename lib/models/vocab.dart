import '../utils/fsrs.dart';

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

/// Ein „Sonstiges"-Feld einer Vokabel (z. B. Beispielsatz, Merkhilfe).
class VocabExtra {
  final String label;
  final String value;

  const VocabExtra(this.label, this.value);

  factory VocabExtra.fromJson(Map<String, dynamic> json) =>
      VocabExtra(json['label'] as String, json['value'] as String);

  Map<String, dynamic> toJson() => {'label': label, 'value': value};
}

/// Eine einzelne Vokabel inklusive Lernstufe.
///
/// [latin] ist das Wort in der Fremdsprache, [german] die Übersetzung,
/// [middleColumn] die Formen (die Namen stammen aus der Latein-Version).
///
/// Die Lernstufe reicht von -5 (sehr schlecht) über 0 (neutral)
/// bis +5 (sehr gut).
class Vocab {
  String id;
  String latin;
  String german;
  String? middleColumn;

  /// Bis zu drei „Sonstiges"-Felder.
  List<VocabExtra> extras;

  /// Aktuelle Lernstufe: -5 .. +5, Standard 0 (neutral).
  int level;

  /// Verlauf aller Stufen-Änderungen.
  List<StatEvent> history;

  /// Gedächtnis-Modell für die Wiederholungsplanung (FSRS).
  /// `null`, solange die Vokabel noch nie abgefragt wurde.
  FsrsCard? srs;

  Vocab({
    required this.id,
    required this.latin,
    required this.german,
    this.middleColumn,
    List<VocabExtra>? extras,
    this.level = 0,
    List<StatEvent>? history,
    this.srs,
  })  : extras = extras ?? [],
        history = history ?? [];

  bool get hasMiddle =>
      middleColumn != null && middleColumn!.trim().isNotEmpty;

  /// „Noch nicht so gut": neutral oder schlechter.
  bool get isWeak => level < 1;

  /// Ändert die Lernstufe um [delta] (±1), begrenzt auf -5 .. +5.
  void adjustLevel(int delta, [DateTime? at]) {
    final newLevel = (level + delta).clamp(-5, 5).toInt();
    if (newLevel == level) return;
    level = newLevel;
    history.add(StatEvent(time: at ?? DateTime.now(), level: newLevel));
  }

  void markCorrect() => review(Rating.good);

  void markWrong() => review(Rating.again);

  /// Noch nie abgefragt.
  bool get isNew => srs == null;

  /// Zur Wiederholung fällig (neue Vokabeln zählen nicht als fällig).
  bool isDue([DateTime? now]) =>
      srs != null && !srs!.due.isAfter(now ?? DateTime.now());

  /// Wahrscheinlichkeit (0..1), dass die Vokabel gerade gewusst wird.
  /// `null` für neue Vokabeln.
  double? recall([DateTime? now]) => srs == null
      ? null
      : Fsrs.retrievabilityOf(srs!, now ?? DateTime.now());

  /// Wertet eine Antwort aus: plant die nächste Wiederholung (FSRS) und
  /// passt die Lernstufe an (nicht gewusst −1, sonst +1).
  void review(Rating rating, [DateTime? now]) {
    now ??= DateTime.now();
    srs = Fsrs.review(srs, rating, now);
    adjustLevel(rating == Rating.again ? -1 : 1, now);
  }

  factory Vocab.fromJson(Map<String, dynamic> json) => Vocab(
        id: json['id'] as String,
        latin: json['latin'] as String,
        german: json['german'] as String,
        middleColumn: json['middleColumn'] as String?,
        extras: (json['extras'] as List? ?? [])
            .map((e) => VocabExtra.fromJson(e as Map<String, dynamic>))
            .toList(),
        level: (json['level'] as num?)?.toInt() ?? 0,
        history: (json['history'] as List? ?? [])
            .map((e) => StatEvent.fromJson(e as Map<String, dynamic>))
            .toList(),
        srs: json['srs'] == null
            ? null
            : FsrsCard.fromJson(json['srs'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'latin': latin,
        'german': german,
        'middleColumn': middleColumn,
        if (extras.isNotEmpty)
          'extras': extras.map((e) => e.toJson()).toList(),
        'level': level,
        'history': history.map((e) => e.toJson()).toList(),
        if (srs != null) 'srs': srs!.toJson(),
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

/// Welche Formen eine Lektion hat (fürs Eingeben und Scannen).
enum FormKind {
  verb,
  noun,
  plural,
  adjective,
  comparison,
  gender,
  inflectionClass,
  government,
  wordClass,
}

extension FormKindX on FormKind {
  String get label => switch (this) {
        FormKind.verb => 'Verbformen',
        FormKind.noun => 'Nomenformen',
        FormKind.plural => 'Plural',
        FormKind.adjective => 'Adjektivformen',
        FormKind.comparison => 'Steigerung',
        FormKind.gender => 'Geschlecht',
        FormKind.inflectionClass => 'Deklination/Konjugation',
        FormKind.government => 'Fall/Präposition',
        FormKind.wordClass => 'Wortart',
      };

  String get example => switch (this) {
        FormKind.verb =>
          'Stammformen bzw. unregelmäßige Formen, z. B. vocō, vocāvī, '
              'vocātum oder go, went, gone',
        FormKind.noun => 'z. B. Genitiv: lūnae',
        FormKind.plural => 'z. B. mice, les chevaux',
        FormKind.adjective => 'Formen der anderen Geschlechter, z. B. bonus, -a, -um',
        FormKind.comparison => 'z. B. good, better, best',
        FormKind.gender => 'bei Nomen, z. B. m, f, n oder der/die/das',
        FormKind.inflectionClass => 'z. B. a-Deklination, e-Konjugation',
        FormKind.government =>
          'welcher Fall oder welche Präposition folgt, z. B. + Dat., '
              'sich freuen über',
        FormKind.wordClass => 'z. B. Verb, Nomen, Adjektiv, Adverb',
      };
}

/// Eine Lektion mit mehreren Kästen.
class Lesson {
  String id;
  String name;
  List<Box> boxes;

  /// Sprache der Wörter (z. B. „Englisch") und der Übersetzung.
  String language;
  String translationLanguage;

  /// Ob die Vokabeln Formen haben und welche. [allForms]: alles, was im
  /// Buch zum Wort steht – nicht nur die bekannten [FormKind]s.
  bool hasForms;
  bool allForms;
  Set<FormKind> formKinds;

  /// Namen der „Sonstiges"-Felder (0–3), z. B. „Beispielsatz".
  List<String> extraLabels;

  Lesson({
    required this.id,
    required this.name,
    required this.boxes,
    this.language = '',
    this.translationLanguage = 'Deutsch',
    this.hasForms = false,
    this.allForms = false,
    Set<FormKind>? formKinds,
    List<String>? extraLabels,
  })  : formKinds = formKinds ?? {},
        extraLabels = extraLabels ?? [];

  /// Alle Vokabeln landen im ersten Kasten (eigene Lektionen haben einen).
  Box get mainBox {
    if (boxes.isEmpty) boxes.add(Box(id: newId(), name: 'Vokabeln', vocabs: []));
    return boxes.first;
  }

  /// Alle Vokabeln dieser Lektion (über alle Kästen hinweg).
  List<Vocab> get allVocabs =>
      boxes.expand((box) => box.vocabs).toList(growable: false);

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        id: json['id'] as String,
        name: json['name'] as String,
        boxes: (json['boxes'] as List? ?? [])
            .map((e) => Box.fromJson(e as Map<String, dynamic>))
            .toList(),
        language: json['language'] as String? ?? '',
        translationLanguage:
            json['translationLanguage'] as String? ?? 'Deutsch',
        hasForms: json['hasForms'] as bool? ?? false,
        allForms: json['allForms'] as bool? ?? false,
        formKinds: {
          for (final k in json['formKinds'] as List? ?? [])
            ...FormKind.values.where((f) => f.name == k),
        },
        extraLabels: (json['extraLabels'] as List? ?? [])
            .map((e) => e as String)
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'language': language,
        'translationLanguage': translationLanguage,
        'hasForms': hasForms,
        'allForms': allForms,
        'formKinds': [for (final k in formKinds) k.name],
        'extraLabels': extraLabels,
        'boxes': boxes.map((b) => b.toJson()).toList(),
      };
}
