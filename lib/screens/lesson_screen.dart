import 'package:flutter/material.dart';

import '../data/store.dart';
import '../models/vocab.dart';
import '../services/scan.dart';
import '../theme/app_theme.dart';
import '../utils/ai_scan.dart';
import '../utils/goals.dart';
import '../widgets/hint_dialog.dart';
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
    final go = await showHintOnce(
      context,
      id: 'manual',
      emoji: '✍️',
      title: 'Vokabeln eintippen',
      text: 'Du bekommst ein Feld für jede Angabe dieser Lektion. Nur Wort '
          'und Übersetzung müssen ausgefüllt sein. Später kannst du jede '
          'Vokabel antippen, um sie zu ändern.',
    );
    if (!go || !mounted) return;
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
    var go = await showHintOnce(
      context,
      id: 'scan',
      emoji: '📷',
      title: 'So funktioniert Scannen',
      text: '1. Fotografiere die Vokabelliste – gerade und gut lesbar.\n'
          '2. Wähle eine KI-App. Sie öffnet sich mit dem Foto und der '
          'Anleitung.\n'
          '3. Schick die Nachricht ab.\n'
          '4. Kopiere die Antwort und komm zurück – die Vokabeln werden '
          'automatisch erkannt.\n\n'
          'Abgelesen wird: ${scanColumns(_lesson).join(' · ')}',
      button: "Los geht's",
    );
    if (!go || !mounted) return;

    final camera = await showModalBottomSheet<bool>(
      context: context,
      showDragHandle: true,
      builder: (_) => const _PhotoSourceSheet(),
    );
    if (camera == null || !mounted) return;

    final photo = await pickVocabPhoto(camera: camera);
    if (photo == null || !mounted) return;

    go = await showHintOnce(
      context,
      id: 'free_ai',
      emoji: '💡',
      title: 'Am besten eine kostenlose KI',
      text: 'ChatGPT, Gemini und Co. lesen Vokabeln auch in der kostenlosen '
          'Version zuverlässig ab – du brauchst kein Abo. Die Anleitung für '
          'die KI wird automatisch eingefügt.',
    );
    if (!go || !mounted) return;

    final app = await showModalBottomSheet<AiApp>(
      context: context,
      showDragHandle: true,
      builder: (_) => const _AiPickerSheet(),
    );
    if (app == null || !mounted) return;
    if (app.missing) {
      await installAiApp(app);
      return;
    }

    setState(() => _waitingForAi = true);
    final ok = await sendToAi(app, photo, buildScanPrompt(_lesson));
    if (!ok && mounted) {
      setState(() => _waitingForAi = false);
      _snack('${app.name} ließ sich nicht öffnen.');
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

/// Kamera oder Galerie? `true` = Kamera, `false` = Galerie.
class _PhotoSourceSheet extends StatelessWidget {
  const _PhotoSourceSheet();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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

/// Auswahl der KI-App – nur KI-Apps, keine anderen „Teilen"-Ziele.
class _AiPickerSheet extends StatelessWidget {
  const _AiPickerSheet();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<List<AiApp>>(
        future: aiApps(),
        builder: (context, snap) {
          if (!snap.hasData) {
            return const Padding(
              padding: EdgeInsets.all(32),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          final apps = snap.data!;
          final installed = apps.where((a) => !a.missing).toList();
          final missing = apps.where((a) => a.missing).toList();
          return ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
                child: Text(
                  'Mit welcher KI?',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              if (installed.isEmpty)
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
                  child: Text(
                    'Auf deinem Handy ist noch keine KI-App. Installiere eine '
                    '– kostenlos – und tippe danach noch einmal auf '
                    '„Scannen".',
                    style: TextStyle(color: muted(context)),
                  ),
                ),
              for (final app in installed)
                ListTile(
                  leading: app.icon.isEmpty
                      ? const Icon(Icons.smart_toy_outlined, size: 40)
                      : Image.memory(app.icon, width: 40, height: 40),
                  title: Text(
                    app.name,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  onTap: () => Navigator.pop(context, app),
                ),
              for (final app in missing)
                ListTile(
                  leading: const Icon(Icons.download_outlined, size: 40),
                  title: Text('${app.name} installieren'),
                  subtitle: const Text('kostenlos im Play Store'),
                  onTap: () => Navigator.pop(context, app),
                ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Text(
                  'Der Vokabeltrainer ist nicht mit diesen Apps oder ihren '
                  'Anbietern verbunden. Für sie gilt ihre eigene '
                  'Datenschutzerklärung.',
                  style: TextStyle(color: faint(context), fontSize: 12),
                ),
              ),
            ],
          );
        },
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
