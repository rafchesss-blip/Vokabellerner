import 'package:flutter/material.dart';

import '../data/store.dart';
import '../models/vocab.dart';
import '../services/scan.dart';
import '../theme/app_theme.dart';
import '../utils/ai_scan.dart';
import '../utils/goals.dart';
import '../widgets/standard_app_bar.dart';
import 'lesson_setup_screen.dart';
import 'vocab_form_dialog.dart';

/// Eine eigene Lektion: Vokabeln ansehen, selbst eingeben oder mit einer
/// KI-App vom Foto ablesen lassen.
class LessonScreen extends StatefulWidget {
  final Lesson lesson;

  const LessonScreen({super.key, required this.lesson});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  Lesson get _lesson => widget.lesson;

  /// Foto ist an die KI geschickt, Antwort steht noch aus.
  bool _waitingForAi = false;

  late final AppLifecycleListener _lifecycle;

  @override
  void initState() {
    super.initState();
    // Zurück aus der KI-App: Antwort aus der Zwischenablage holen.
    // Android gibt die Zwischenablage erst frei, wenn die App den Fokus
    // hat – daher kurz warten.
    _lifecycle = AppLifecycleListener(onResume: () async {
      if (!_waitingForAi) return;
      await Future<void>.delayed(const Duration(milliseconds: 600));
      if (mounted && _waitingForAi) _importFromClipboard(auto: true);
    });
  }

  @override
  void dispose() {
    _lifecycle.dispose();
    super.dispose();
  }

  void _snack(String text) => ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(text)));

  // ── Selbst eingeben ────────────────────────────────────────────────────

  Future<void> _addManually() async {
    final v = await showVocabForm(context, _lesson);
    if (v == null) return;
    _lesson.mainBox.vocabs.add(v);
    await Store.instance.save();
    if (mounted) _snack('„${v.latin}" hinzugefügt.');
  }

  Future<void> _edit(Vocab vocab) async {
    final v = await showVocabForm(context, _lesson, vocab: vocab);
    if (v != null) await Store.instance.save();
  }

  Future<void> _delete(Vocab vocab) async {
    await Store.instance.deleteVocab(vocab);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('„${vocab.latin}" gelöscht.'),
      action: SnackBarAction(
        label: 'Rückgängig',
        onPressed: () {
          _lesson.mainBox.vocabs.add(vocab);
          Store.instance.save();
        },
      ),
    ));
  }

  // ── Scannen mit KI ─────────────────────────────────────────────────────

  Future<void> _scan() async {
    final camera = await showModalBottomSheet<bool>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (_) => _ScanHelpSheet(lesson: _lesson),
    );
    if (camera == null || !mounted) return;

    final photo = await pickVocabPhoto(camera: camera);
    if (photo == null || !mounted) return;

    setState(() => _waitingForAi = true);
    try {
      await sendToAi(photo, buildScanPrompt(_lesson));
    } catch (_) {
      if (mounted) {
        _snack('Teilen hat nicht geklappt. Ist eine KI-App installiert?');
      }
    }
  }

  /// Holt die Antwort der KI aus der Zwischenablage. [auto]: beim
  /// Zurückkommen in die App – dann still, wenn noch nichts da ist.
  Future<void> _importFromClipboard({bool auto = false}) async {
    final text = await readClipboard();
    if (!mounted) return;
    final looksRight = text != null && looksLikeScanAnswer(text);
    if (auto && !looksRight) return;

    final found = text == null || text.contains('Antworte NUR')
        ? <Vocab>[]
        : parseScanAnswer(text, _lesson);
    if (found.isEmpty) {
      _snack('Keine Vokabeln in der Zwischenablage. Kopiere in der KI-App '
          'die ganze Antwort und versuch es noch einmal.');
      return;
    }

    final existing = {
      for (final v in _lesson.allVocabs)
        '${v.latin.toLowerCase()}|${v.german.toLowerCase()}',
    };
    final fresh = [
      for (final v in found)
        if (!existing.contains('${v.latin.toLowerCase()}|'
            '${v.german.toLowerCase()}'))
          v,
    ];

    final chosen = await showDialog<List<Vocab>>(
      context: context,
      builder: (_) => _ImportPreview(
        lesson: _lesson,
        vocabs: fresh,
        duplicates: found.length - fresh.length,
      ),
    );
    if (chosen == null || !mounted) return;

    _lesson.mainBox.vocabs.addAll(chosen);
    await Store.instance.save();
    await clearClipboard();
    if (!mounted) return;
    setState(() => _waitingForAi = false);
    _snack('${chosen.length} Vokabeln übernommen. Tippe eine an, um sie zu '
        'korrigieren.');
  }

  // ── Lektion ────────────────────────────────────────────────────────────

  Future<void> _editSettings() async {
    final changed = await Navigator.push<Lesson>(
      context,
      MaterialPageRoute(builder: (_) => LessonSetupScreen(lesson: _lesson)),
    );
    if (changed != null) await Store.instance.save();
  }

  Future<void> _deleteLesson() async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('„${_lesson.name}" löschen?'),
        content: const Text(
          'Die Lektion und alle ihre Vokabeln werden gelöscht – auch aus '
          'deinen Übungslisten.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Abbrechen'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Löschen'),
          ),
        ],
      ),
    );
    if (ok != true) return;
    await Store.instance.deleteLesson(_lesson);
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: Store.instance.revision,
      builder: (context, _, __) {
        final vocabs = _lesson.allVocabs;
        return Scaffold(
          appBar: standardAppBar(
            context,
            _lesson.name,
            actions: [
              PopupMenuButton<String>(
                tooltip: 'Optionen',
                onSelected: (v) {
                  if (v == 'settings') _editSettings();
                  if (v == 'delete') _deleteLesson();
                },
                itemBuilder: (_) => const [
                  PopupMenuItem(
                    value: 'settings',
                    child: Text('Lektion einstellen'),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: Text('Lektion löschen'),
                  ),
                ],
              ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            children: [
              _AddCard(
                waiting: _waitingForAi,
                onManual: _addManually,
                onScan: _scan,
                onPaste: _importFromClipboard,
                onCancelWaiting: () => setState(() => _waitingForAi = false),
              ),
              const SizedBox(height: 16),
              if (vocabs.isEmpty)
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    'Noch keine Vokabeln in dieser Lektion.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: muted(context)),
                  ),
                )
              else ...[
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 0, 4, 8),
                  child: Text(
                    '${vocabs.length} Vokabeln',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      for (final v in vocabs)
                        _VocabTile(
                          vocab: v,
                          onTap: () => _edit(v),
                          onDelete: () => _delete(v),
                        ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}

/// Oben: „Selbst eingeben" und „Scannen mit KI" (bzw. Warten auf die KI).
class _AddCard extends StatelessWidget {
  final bool waiting;
  final VoidCallback onManual;
  final VoidCallback onScan;
  final VoidCallback onPaste;
  final VoidCallback onCancelWaiting;

  const _AddCard({
    required this.waiting,
    required this.onManual,
    required this.onScan,
    required this.onPaste,
    required this.onCancelWaiting,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    if (waiting) {
      return Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Row(
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2.5),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Warte auf die Antwort der KI …',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Kopiere in der KI-App die Antwort (Kopieren-Knopf am '
                'Textblock) und komm zurück – die Vokabeln werden dann '
                'automatisch erkannt.',
                style: TextStyle(color: muted(context)),
              ),
              const SizedBox(height: 12),
              FilledButton.icon(
                onPressed: onPaste,
                icon: const Icon(Icons.content_paste),
                label: const Text('Antwort einfügen'),
              ),
              TextButton(
                onPressed: onCancelWaiting,
                child: const Text('Abbrechen'),
              ),
            ],
          ),
        ),
      );
    }

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Vokabeln hinzufügen',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onManual,
                    icon: const Icon(Icons.edit_outlined),
                    label: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text('Selbst eingeben'),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: onScan,
                    icon: const Icon(Icons.document_scanner_outlined),
                    label: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text('Scannen'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.auto_awesome, size: 18, color: scheme.primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Tipp: Mit „Scannen" fotografierst du die Vokabelliste '
                    'aus deinem Buch. Eine KI-App wie ChatGPT oder Gemini '
                    'liest sie für dich ab – kein Abtippen nötig.',
                    style: TextStyle(color: muted(context), fontSize: 13),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Erklärt den Ablauf beim Scannen. Liefert `true` = Kamera, `false` =
/// Galerie, `null` = Abbruch.
class _ScanHelpSheet extends StatelessWidget {
  final Lesson lesson;

  const _ScanHelpSheet({required this.lesson});

  @override
  Widget build(BuildContext context) {
    final fields = scanColumns(lesson).join(' · ');

    Widget step(String n, String text) => Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 12,
                child: Text(n, style: const TextStyle(fontSize: 12)),
              ),
              const SizedBox(width: 12),
              Expanded(child: Text(text)),
            ],
          ),
        );

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Scannen mit KI',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4),
            Text(
              'Abgelesen wird: $fields',
              style: TextStyle(color: muted(context)),
            ),
            const SizedBox(height: 16),
            step('1', 'Fotografiere die Vokabelliste – gerade und gut lesbar.'),
            step(
              '2',
              'Wähle deine KI-App (ChatGPT, Gemini, …). Beim ersten Mal '
                  'fragt das Handy, womit – tippe „Immer", dann geht es '
                  'nächstes Mal schneller.',
            ),
            step(
              '3',
              'Schick die Nachricht ab. Die Anleitung für die KI ist schon '
                  'dabei. Fehlt sie, halte das Textfeld gedrückt und tippe '
                  '„Einfügen".',
            ),
            step(
              '4',
              'Kopiere die Antwort der KI und komm hierher zurück. Die '
                  'Vokabeln werden automatisch erkannt.',
            ),
            const SizedBox(height: 8),
            FilledButton.icon(
              onPressed: () => Navigator.pop(context, true),
              icon: const Icon(Icons.photo_camera_outlined),
              label: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text('Foto aufnehmen', style: TextStyle(fontSize: 16)),
              ),
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: () => Navigator.pop(context, false),
              icon: const Icon(Icons.photo_library_outlined),
              label: const Text('Foto aus der Galerie'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Vorschau der erkannten Vokabeln – einzelne lassen sich abwählen.
class _ImportPreview extends StatefulWidget {
  final Lesson lesson;
  final List<Vocab> vocabs;
  final int duplicates;

  const _ImportPreview({
    required this.lesson,
    required this.vocabs,
    required this.duplicates,
  });

  @override
  State<_ImportPreview> createState() => _ImportPreviewState();
}

class _ImportPreviewState extends State<_ImportPreview> {
  late final Set<Vocab> _chosen = {...widget.vocabs};

  @override
  Widget build(BuildContext context) {
    final vocabs = widget.vocabs;
    return AlertDialog(
      title: Text('${vocabs.length} Vokabeln erkannt'),
      contentPadding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (widget.duplicates > 0)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Text(
                  '${widget.duplicates} waren schon in der Lektion und '
                  'werden übersprungen.',
                  style: TextStyle(color: muted(context), fontSize: 13),
                ),
              ),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                children: [
                  for (final v in vocabs)
                    CheckboxListTile(
                      dense: true,
                      value: _chosen.contains(v),
                      onChanged: (on) => setState(
                          () => on! ? _chosen.add(v) : _chosen.remove(v)),
                      title: Text(
                        v.latin,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(_details(v)),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Abbrechen'),
        ),
        FilledButton(
          onPressed: _chosen.isEmpty
              ? null
              : () => Navigator.pop(
                  context, [for (final v in vocabs) if (_chosen.contains(v)) v]),
          child: Text('${_chosen.length} übernehmen'),
        ),
      ],
    );
  }
}

String _details(Vocab v) => [
      v.german,
      if (v.hasMiddle) v.middleColumn!,
      for (final e in v.extras) '${e.label}: ${e.value}',
    ].join(' · ');

class _VocabTile extends StatelessWidget {
  final Vocab vocab;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const _VocabTile({
    required this.vocab,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      onTap: onTap,
      leading: vocab.isNew
          ? Icon(Icons.fiber_new_outlined, size: 20, color: faint(context))
          : Icon(
              isKnown(vocab)
                  ? Icons.check_circle
                  : Icons.radio_button_unchecked,
              size: 20,
              color: isKnown(vocab) ? Colors.green : faint(context),
            ),
      title: Text(
        vocab.latin,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(_details(vocab)),
      trailing: IconButton(
        tooltip: 'Löschen',
        icon: const Icon(Icons.delete_outline),
        onPressed: onDelete,
      ),
    );
  }
}
