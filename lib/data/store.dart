import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/practice_list.dart';
import '../models/vocab.dart';
import '../services/api.dart';
import '../services/auth.dart';

/// Zentrale Ablage für Lektionen und Übungslisten (Singleton).
///
/// Alles wird als JSON in den `shared_preferences` gespeichert. Ist ein
/// Benutzer angemeldet, werden die Daten zusätzlich in die Cloud synchronisiert.
class Store {
  Store._();
  static final Store instance = Store._();

  static const _lessonsKey = 'vocab_lessons_v3';
  static const _listsKey = 'vocab_practice_lists_v1';

  List<Lesson> lessons = [];
  List<PracticeList> practiceLists = [];

  bool _loading = false;
  Timer? _pushTimer;

  Future<void> load() async {
    _loading = true;
    try {
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
      _sortLessons();

      final listsRaw = prefs.getString(_listsKey);
      practiceLists = listsRaw == null
          ? []
          : (jsonDecode(listsRaw) as List)
              .map((e) => PracticeList.fromJson(e as Map<String, dynamic>))
              .toList();

      await save();
    } finally {
      _loading = false;
    }
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
    _scheduleCloudPush();
  }

  // ── Cloud-Sync ─────────────────────────────────────────────────────────

  Map<String, dynamic> toCloudJson() => {
        'lessons': lessons.map((l) => l.toJson()).toList(),
        'lists': practiceLists.map((l) => l.toJson()).toList(),
      };

  void loadCloudJson(Map<String, dynamic> json) {
    lessons = (json['lessons'] as List? ?? [])
        .map((e) => Lesson.fromJson(e as Map<String, dynamic>))
        .toList();
    practiceLists = (json['lists'] as List? ?? [])
        .map((e) => PracticeList.fromJson(e as Map<String, dynamic>))
        .toList();
    _sortLessons();
  }

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

  /// Überträgt den lokalen Stand in die Cloud.
  Future<void> pushToCloud() async {
    if (!AuthService.instance.isLoggedIn) return;
    try {
      await Api.putData(AuthService.instance.token!, toCloudJson());
    } catch (_) {
      // Offline: lokale Daten bleiben erhalten und werden später erneut
      // gesendet.
    }
  }

  /// Lädt den Cloud-Stand und ersetzt die lokalen Daten.
  Future<void> pullFromCloud() async {
    if (!AuthService.instance.isLoggedIn) return;
    try {
      final data = await Api.getData(AuthService.instance.token!);
      if (data['lessons'] != null) {
        _loading = true;
        try {
          loadCloudJson(data);
          await save();
        } finally {
          _loading = false;
        }
      }
    } catch (_) {
      // Offline: lokalen Stand weiterverwenden.
    }
  }

  /// Setzt die lokalen Daten auf einen frischen Startzustand zurück
  /// (z. B. nach dem Abmelden).
  Future<void> resetLocal() async {
    _loading = true;
    try {
      lessons = _seed();
      practiceLists = [];
      await save();
    } finally {
      _loading = false;
    }
  }

  /// Pusht zeitverzögert, damit schnelle Folgen von `save()` (z. B. beim
  /// Karteikarten-Üben) zu einem einzigen Cloud-Aufruf gebündelt werden.
  void _scheduleCloudPush() {
    if (_loading || !AuthService.instance.isLoggedIn) return;
    _pushTimer?.cancel();
    _pushTimer = Timer(const Duration(seconds: 2), () {
      pushToCloud();
    });
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
    void insertAfter(String anchor, Lesson lesson) {
      if (lessons.any((l) => l.name == lesson.name)) return;
      final idx = lessons.indexWhere((l) => l.name == anchor);
      lessons.insert(idx + 1, lesson);
    }

    if (!lessons.any((l) => l.name == 'Lektion 1')) {
      lessons.insert(0, _lesson1());
    }
    insertAfter('Lektion 1', _lesson2());
    insertAfter('Lektion 2', _lesson3());
    insertAfter('Lektion 3', _lesson4());
  }

  /// Lektion 2 (5 Kästen, 43 Vokabeln).
  Lesson _lesson2() {
    Vocab v(String latin, String german, [String? middle]) =>
        Vocab(id: newId(), latin: latin, german: german, middleColumn: middle);

    return Lesson(id: newId(), name: 'Lektion 2', boxes: [
      Box(id: newId(), name: 'Kasten 1', vocabs: [
        v('diū', 'lange, lange Zeit'),
        v('exspectāre', 'warten (auf), erwarten', 'exspectō'),
        v('per', 'durch'),
        v('via', 'der Weg, die Straße', 'f'),
        v('properāre', 'eilen, sich beeilen', 'properō'),
        v('semper', 'immer'),
        v('post', 'hinter, nach'),
        v('subitō', 'plötzlich'),
      ]),
      Box(id: newId(), name: 'Kasten 2', vocabs: [
        v('nōn iam', 'nicht mehr'),
        v('nam', 'denn, nämlich'),
        v('undique', 'von allen Seiten, von überallher'),
        v('turba', 'die Menge, die Menschenmenge', 'f'),
        v('reperīre', 'finden, wiederfinden', 'reperiō'),
        v('ante', 'vor'),
        v('taberna', 'das Gasthaus, der Laden', 'f'),
      ]),
      Box(id: newId(), name: 'Kasten 3', vocabs: [
        v('intrāre', 'betreten, hineingehen', 'intrō'),
        v('porta', 'das Tor, die Tür', 'f'),
        v('aperīre', 'öffnen, aufdecken', 'aperiō'),
        v('mox', 'bald'),
        v('servāre', 'retten, bewahren; beobachten', 'servō'),
        v('fenestra', 'das Fenster', 'f'),
        v('ad', 'zu, bei, nach, an'),
      ]),
      Box(id: newId(), name: 'Kasten 4', vocabs: [
        v('sedēre', 'sitzen', 'sedeō'),
        v('audīre', 'hören', 'audiō'),
        v('tū', 'du'),
        v('tenēre', 'halten, festhalten, besitzen', 'teneō'),
        v('nunc', 'jetzt, nun'),
        v('pecūnia', 'das Geld, das Vermögen', 'f'),
        v('postulāre', 'fordern, verlangen', 'postulō'),
      ]),
      Box(id: newId(), name: 'Kasten 5', vocabs: [
        v('violāre', 'verletzen, beleidigen', 'violō'),
        v('satis', 'genug'),
        v('valēre', 'gesund sein, stark sein, Einfluss haben', 'valeō'),
        v('rogāre', 'fragen, bitten', 'rogō'),
        v('quid?', 'was?'),
        v('dēsīderāre', 'vermissen, verlangen, sich sehnen nach', 'dēsīderō'),
        v('necāre', 'töten', 'necō'),
        v('egō', 'ich'),
        v('amīcus', 'der Freund', 'm'),
        v('ita', 'so'),
        v('ubi?', 'wo?'),
        v('prīmō', 'zuerst'),
        v('dare', 'geben', 'dō'),
        v('scīre', 'wissen, kennen, verstehen', 'sciō'),
      ]),
    ]);
  }

  /// Lektion 4 (5 Kästen, 42 Vokabeln).
  Lesson _lesson4() {
    Vocab v(String latin, String german, [String? middle]) =>
        Vocab(id: newId(), latin: latin, german: german, middleColumn: middle);

    return Lesson(id: newId(), name: 'Lektion 4', boxes: [
      Box(id: newId(), name: 'Kasten 1', vocabs: [
        v('dē', 'über; von, von ... her, von ... weg, ... herab'),
        v('atque', 'und, und auch'),
        v('cōgitāre dē', 'denken an, nachdenken über', 'cōgitō dē'),
        v('movēre', 'bewegen, beeindrucken', 'moveō'),
        v('memoria', 'die Erinnerung, das Gedächtnis; die Zeit', 'f'),
        v('nōlle', 'nicht wollen', 'nōlō'),
        v('procul', 'von fern, weit weg'),
        v('Diāna', 'Diana (Göttin der Jagd und Schützerin der Tiere)'),
        v('dea', 'die Göttin', 'f'),
      ]),
      Box(id: newId(), name: 'Kasten 2', vocabs: [
        v('cum', 'mit, zusammen mit'),
        v('amīca', 'die Freundin', 'f'),
        v('nescīre', 'nicht wissen, nicht kennen, nicht verstehen', 'nescīō'),
        v('nōn nescīre', 'genau wissen, genau kennen', 'nōn nescīō'),
        v('amāre', 'lieben', 'amō'),
        v('memoriā tenēre', 'im Gedächtnis behalten', 'memoriā teneō'),
        v('timēre', 'fürchten, Angst haben (vor)', 'timeō'),
        v('in', 'in, an, auf, bei (wo?)'),
      ]),
      Box(id: newId(), name: 'Kasten 3', vocabs: [
        v('campus', 'das Feld, der freie Platz', 'm'),
        v('īra', 'der Zorn, die Wut', 'f'),
        v('sentīre', 'fühlen, meinen, wahrnehmen', 'sentīō'),
        v('ārdēre', 'brennen', 'ārdeō'),
        v('appellāre', 'rufen, anrufen, nennen', 'appellō'),
        v('velle', 'wollen', 'volō'),
        v('propter', 'wegen'),
        v('tibi', 'dir, für dich'),
      ]),
      Box(id: newId(), name: 'Kasten 4', vocabs: [
        v('agitāre', 'treiben, betreiben, überlegen', 'agitō'),
        v('nōnne?', '(etwa) nicht?'),
        v('terrēre', 'erschrecken', 'terreō'),
        v('fuga', 'die Flucht', 'f'),
        v('in', 'in (... hinein), nach (wohin?); gegen'),
        v('silva', 'der Wald', 'f'),
        v('oculus', 'das Auge', 'm'),
        v('tamen', 'dennoch, jedoch'),
      ]),
      Box(id: newId(), name: 'Kasten 5', vocabs: [
        v('enim', 'denn, nämlich'),
        v('vītāre', 'meiden, vermeiden', 'vītō'),
        v('profectō', 'sicherlich, tatsächlich'),
        v('mūtāre', 'ändern, verändern, verwandeln', 'mūtō'),
        v('ē / ex', 'aus, von ... her'),
        v('at', 'aber, jedoch'),
        v('circumvenīre', 'umringen, umzingeln', 'circumveniō'),
        v('prope', 'nahe, in der Nähe; beinahe'),
        v('-que', 'und'),
      ]),
    ]);
  }

  /// Lektion 3 (5 Kästen, 42 Vokabeln).
  Lesson _lesson3() {
    Vocab v(String latin, String german, [String? middle]) =>
        Vocab(id: newId(), latin: latin, german: german, middleColumn: middle);

    return Lesson(id: newId(), name: 'Lektion 3', boxes: [
      Box(id: newId(), name: 'Kasten 1', vocabs: [
        v('Salvē! Salvēte!', 'Sei gegrüßt! Seid gegrüßt!'),
        v('narrāre', 'erzählen', 'narrō'),
        v('puella', 'das Mädchen', 'f'),
        v('statim', 'sofort'),
        v('parāre', '(vor)bereiten; vorhaben, erwerben', 'parō'),
        v('iniūria', 'das Unrecht, die Beleidigung', 'f'),
        v('sustinēre', 'ertragen, standhalten', 'sustineō'),
        v('quemadmodum', 'wie, auf welche Weise'),
      ]),
      Box(id: newId(), name: 'Kasten 2', vocabs: [
        v('prohibēre', 'abhalten, hindern, verhindern', 'prohibeō'),
        v('paulum', 'ein wenig'),
        v('respondēre', 'antworten', 'respondeō'),
        v('certē', 'gewiss, sicherlich'),
        v('indicāre', 'anzeigen, melden', 'indicō'),
        v('negāre', 'leugnen, verneinen, verweigern', 'negō'),
        v('culpa', 'die Schuld', 'f'),
        v('probāre', 'prüfen, beweisen, für gut befinden', 'probō'),
      ]),
      Box(id: newId(), name: 'Kasten 3', vocabs: [
        v('bene', 'gut'),
        v('Circus Maximus',
            'der Circus Maximus (Rennbahn für Wagenrennen in Rom)', 'm'),
        v('ūnā', 'zusammen, zugleich'),
        v('prōvidēre', 'sorgen für', 'prōvideō m. Dat.'),
        v('socius', 'der Gefährte, der Verbündete', 'm'),
        v('vocāre', 'rufen, nennen', 'vocō'),
        v('iterum', 'wieder(um), zum zweiten Mal'),
        v('superāre', 'besiegen, überwinden, übertreffen', 'superō'),
        v('dum', 'während, solange, bis'),
      ]),
      Box(id: newId(), name: 'Kasten 4', vocabs: [
        v('temptāre', 'versuchen, prüfen, angreifen', 'temptō'),
        v('cavēre', 'vorsichtig sein, sich hüten (vor)', 'caveō m. Akk.'),
        v('nōn dēbēre', 'nicht dürfen, nicht müssen', 'nōn dēbeō'),
        v('sententia', 'die Meinung, der Satz, der Sinn', 'f'),
        v('placēre', 'gefallen', 'placeō'),
        v('pārēre', 'gehorchen', 'pāreō'),
        v('paulō', '(um) ein wenig'),
        v('paulō post', 'wenig später, kurz darauf'),
        v('gladius', 'das Schwert', 'm'),
      ]),
      Box(id: newId(), name: 'Kasten 5', vocabs: [
        v('animus', 'der Geist, der Mut, die Gesinnung', 'm'),
        v('deesse', 'fehlen, abwesend sein, nicht da sein'),
        v('mandāre', 'übergeben, einen Auftrag geben', 'mandō'),
        v('poena', 'die Strafe', 'f'),
        v('instāre', 'bevorstehen, bedrängen, drohen', 'instō m. Dat.'),
        v('et ... et', 'sowohl ... als auch'),
        v('grātia', 'der Dank', 'f'),
        v('grātiam dēbēre', 'Dank schulden', 'grātiam dēbeō'),
      ]),
    ]);
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
      _lesson2(),
      _lesson3(),
      _lesson4(),
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
