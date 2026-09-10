import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/practice_list.dart';
import '../models/vocab.dart';

/// Zentrale Ablage für Lektionen und Übungslisten (Singleton).
///
/// Alles wird als JSON in den `shared_preferences` gespeichert.
class Store {
  Store._();
  static final Store instance = Store._();

  static const _lessonsKey = 'vocab_lessons_v3';
  static const _listsKey = 'vocab_practice_lists_v1';

  List<Lesson> lessons = [];
  List<PracticeList> practiceLists = [];

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();

    final lessonsRaw = prefs.getString(_lessonsKey);
    if (lessonsRaw == null) {
      lessons = _seed();
    } else {
      lessons = (jsonDecode(lessonsRaw) as List)
          .map((e) => Lesson.fromJson(e as Map<String, dynamic>))
          .toList();
      _addMissingLessons();
    }

    final listsRaw = prefs.getString(_listsKey);
    practiceLists = listsRaw == null
        ? []
        : (jsonDecode(listsRaw) as List)
            .map((e) => PracticeList.fromJson(e as Map<String, dynamic>))
            .toList();

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

  /// Löst IDs zu Vokabeln auf (unbekannte IDs werden übersprungen).
  List<Vocab> resolveVocabs(Iterable<String> ids) {
    final map = vocabById;
    return [for (final id in ids) if (map[id] != null) map[id]!];
  }

  /// Ergänzt bei bestehenden Nutzern fehlende Standard-Lektionen
  /// (z. B. Lektion 1), ohne vorhandenen Lernfortschritt zu verändern.
  void _addMissingLessons() {
    final names = lessons.map((l) => l.name).toSet();
    if (!names.contains('Lektion 1')) {
      lessons.insert(0, _lesson1());
    }
  }

  /// Lektion 1 (5 Kästen, 42 Vokabeln).
  Lesson _lesson1() {
    Vocab v(String latin, String german, [String? middle]) =>
        Vocab(id: newId(), latin: latin, german: german, middleColumn: middle);

    return Lesson(id: newId(), name: 'Lektion 1', boxes: [
      Box(id: newId(), name: 'Kasten 1', vocabs: [
        v('ecce', 'Schau! Schaut!'),
        v('ibi', 'dort'),
        v('esse', 'sein, sich befinden'),
        v('est', 'er (sie, es) ist, befindet sich'),
        v('sunt', 'sie sind, befinden sich'),
        v('servus', 'der Sklave, der Diener', 'm'),
        v('etiam', 'auch, sogar'),
        v('et', 'und, auch'),
      ]),
      Box(id: newId(), name: 'Kasten 2', vocabs: [
        v('domina', 'die Herrin, die Dame', 'f'),
        v('serva', 'die Sklavin, die Dienerin', 'f'),
        v('stāre', 'stehen'),
        v('cōgitāre', 'denken, nachdenken, beabsichtigen'),
        v('clāmāre', 'laut rufen, schreien'),
      ]),
      Box(id: newId(), name: 'Kasten 3', vocabs: [
        v('iam', 'schon, bereits, nun'),
        v('adesse', 'da sein, helfen'),
        v('adest', 'er (sie, es) ist da'),
        v('adsunt', 'sie sind da'),
        v('dominus', 'der Herr', 'm'),
        v('tum', 'da, dann, damals'),
        v('venīre', 'kommen'),
        v('rīdēre', 'lachen, auslachen'),
        v('postrēmō', 'schließlich'),
        v('sed', 'aber, sondern'),
        v('nōndum', 'noch nicht'),
        v('cūr?', 'warum?'),
        v('nōn', 'nicht'),
      ]),
      Box(id: newId(), name: 'Kasten 4', vocabs: [
        v('dēbēre', 'müssen, sollen, schulden'),
        v('dubitāre', 'zögern, zweifeln'),
        v('gaudēre', 'sich freuen'),
      ]),
      Box(id: newId(), name: 'Kasten 5', vocabs: [
        v('equus', 'das Pferd', 'm'),
        v('spectāre', 'betrachten, anschauen, zuschauen'),
        v('audēre', 'wagen'),
        v('ōrāre', 'bitten, beten, anflehen'),
        v('tandem', 'endlich, schließlich'),
        v('vidēre', 'sehen'),
        v('populus', 'das Volk', 'm'),
        v('victōria', 'der Sieg', 'f'),
        v('hae, hae', '(spöttisches Lachen)'),
        v('itaque', 'deshalb'),
        v('hūc', 'hierher'),
        v('medicus', 'der Arzt', 'm'),
        v('sōlum', 'nur'),
      ]),
    ]);
  }

  /// Beim ersten Start werden Lektion 1 und Lektion 18 angelegt.
  List<Lesson> _seed() {
    Vocab v(String latin, String german, [String? middle]) =>
        Vocab(id: newId(), latin: latin, german: german, middleColumn: middle);

    return [
      _lesson1(),
      Lesson(id: newId(), name: 'Lektion 18', boxes: [
        Box(id: newId(), name: 'Kasten 1', vocabs: [
          v('vetus', 'alt', 'vetus, vetus, veteris'),
          v('idem', 'derselbe, der gleiche', 'eadem, idem, eiusdem, eidem'),
          v('eōdem locō', 'am selben Ort, am selben Platz'),
          v('restituere', 'wiederherstellen, wieder errichten',
              'restituō, restituī, restitūtum'),
          v('mūrus', 'die Mauer', 'mūrī m'),
          v('mūnīre', 'bauen, befestigen, schützen',
              'mūniō, mūnīvī, mūnītum'),
          v('aciēs', 'die Schärfe, die Schlacht, das Heer', 'aciēī f'),
          v('caedēs', 'der Mord, das Blutbad', 'caedis f, Pl. -ium'),
        ]),
        Box(id: newId(), name: 'Kasten 2', vocabs: [
          v('intrā', 'innerhalb von (wo? wohin?)'),
          v('sē recipere', 'sich zurückziehen', 'mē recipiō'),
          v('cēnsēre', 'meinen, einschätzen, seine Stimme abgeben für',
              'cēnseō, cēnsuī, cēnsum'),
          v('tegere', 'bedecken, schützen, verbergen', 'tegō, tēxī, tēctum'),
          v('sacer', 'heilig, geweiht', 'sacra, sacrum'),
          v('exstinguere', 'auslöschen, vernichten',
              'exstinguō, exstinxī, exstinctum'),
        ]),
        Box(id: newId(), name: 'Kasten 3', vocabs: [
          v('Titus', 'Titus (Sohn des röm. Kaisers Vespasian)', 'Titī m'),
          v('circum', 'rings um, um ... herum'),
          v('collocāre', 'aufstellen, unterbringen', 'collocō, collocāvī'),
          v('religiō',
              'der Glaube, die (Gottes-)Verehrung, die Frömmigkeit, die Gewissenhaftigkeit',
              'religiōnis f'),
          v('cūrae esse', 'jdm. Sorge bereiten'),
          v('cōnsulere', 'jdn. um Rat fragen',
              'cōnsulō, cōnsuluī, cōnsultum'),
          v('cupiditās', 'das Verlangen (nach), die Leidenschaft',
              'cupiditātis f'),
          v('saevus', 'schrecklich, wild, wütend', 'saeva, saevum'),
          v('praebēre', 'geben, hinhalten', 'praebeō, praebuī'),
          v('sē praebēre', 'sich zeigen', 'mē praebeō'),
          v('iste', 'dieser, diese, dieses (da)', 'ista, istud, istīus, istī'),
        ]),
        Box(id: newId(), name: 'Kasten 4', vocabs: [
          v('barbarus', 'ausländisch, unzivilisiert; Subst. Barbar',
              'barbara, barbarum'),
          v('excipere', 'aufnehmen, eine Ausnahme machen',
              'excipiō, excēpī, exceptum'),
          v('dēdere', 'ausliefern, übergeben', 'dēdō, dēdidī, dēditum'),
          v('claudere', 'schließen, abschließen, einschließen',
              'claudō, clausī, clausum'),
          v('prōpōnere', 'darlegen, vorschlagen, in Aussicht stellen',
              'prōpōnō, prōposuī, prōpositum'),
          v('etsī', 'auch wenn, obwohl'),
          v('incendium', 'der Brand, das Feuer', 'incendiī n'),
          v('dūrus', 'hart, hartherzig', 'dūra, dūrum'),
        ]),
        Box(id: newId(), name: 'Kasten 5', vocabs: [
          v('cōnsulere in', 'vorgehen gegen'),
          v('sānē', 'allerdings, gewiss, überhaupt, meinetwegen'),
          v('nihil nisi', 'nichts als, nur'),
          v('arx', 'die Burg', 'arcis f'),
          v('oportet', 'es gehört sich, es ist nötig', 'oportuit'),
          v('condiciō', 'die Bedingung, die Verabredung, die Lage',
              'condiciōnis f'),
          v('mūnītiō', 'der Bau, die Befestigung', 'mūnītiōnis f'),
          v('cēdere', 'gehen, nachgeben, zurückweichen', 'cēdō, cessī, cessum'),
          v('crīmen', 'das Verbrechen, der Vorwurf', 'crīminis n'),
          v('occidere', '(zu Boden) fallen, umkommen, untergehen',
              'occidō, occidī'),
        ]),
      ]),
    ];
  }
}
