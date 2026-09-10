import 'package:flutter/material.dart';

import '../data/store.dart';
import '../models/vocab.dart';
import '../theme/app_theme.dart';
import '../widgets/standard_app_bar.dart';

/// Auswahl-Bildschirm für Vokabeln:
/// Lektionen → Kästen → Vokabeln, jeweils mit Häkchen und aufklappbar.
///
/// Liefert die ausgewählten Vokabel-IDs beim Bestätigen an den Aufrufer
/// zurück (`Navigator.pop(context, Set<String>)`).
class SelectionScreen extends StatefulWidget {
  final Set<String> initialSelectedIds;
  final String confirmLabel;

  const SelectionScreen({
    super.key,
    this.initialSelectedIds = const {},
    this.confirmLabel = 'Fertig',
  });

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  late final Set<String> _selected = {...widget.initialSelectedIds};
  final Set<String> _expandedLessons = {};
  final Set<String> _expandedBoxes = {};

  List<Lesson> get _lessons => Store.instance.lessons;

  // ── Auswahl-Logik ───────────────────────────────────────────────────────

  bool? _lessonValue(Lesson lesson) {
    final vocabs = lesson.allVocabs;
    final count = vocabs.where((v) => _selected.contains(v.id)).length;
    if (count == 0) return false;
    if (count == vocabs.length) return true;
    return null; // teils ausgewählt → unbestimmter Zustand
  }

  bool? _boxValue(Box box) {
    final count = box.vocabs.where((v) => _selected.contains(v.id)).length;
    if (count == 0) return false;
    if (count == box.vocabs.length) return true;
    return null;
  }

  void _toggleLesson(Lesson lesson) {
    setState(() {
      final all = lesson.allVocabs.map((v) => v.id);
      if (lesson.allVocabs.every((v) => _selected.contains(v.id))) {
        _selected.removeAll(all);
      } else {
        _selected.addAll(all);
      }
    });
  }

  void _toggleBox(Box box) {
    setState(() {
      final all = box.vocabs.map((v) => v.id);
      if (box.vocabs.every((v) => _selected.contains(v.id))) {
        _selected.removeAll(all);
      } else {
        _selected.addAll(all);
      }
    });
  }

  void _toggleVocab(Vocab vocab) {
    setState(() {
      if (!_selected.remove(vocab.id)) _selected.add(vocab.id);
    });
  }

  void _selectAll() {
    setState(() {
      _selected.addAll(
        _lessons.expand((l) => l.allVocabs).map((v) => v.id),
      );
    });
  }

  void _clearAll() => setState(_selected.clear);

  void _confirm() => Navigator.pop(context, _selected);

  // ── Bausteine ──────────────────────────────────────────────────────────

  Widget _buildLessonTile(Lesson lesson) {
    final expanded = _expandedLessons.contains(lesson.id);
    return Column(
      children: [
        InkWell(
          onTap: () => setState(() {
            expanded
                ? _expandedLessons.remove(lesson.id)
                : _expandedLessons.add(lesson.id);
          }),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(4, 4, 8, 4),
            child: Row(
              children: [
                Checkbox(
                  tristate: true,
                  value: _lessonValue(lesson),
                  onChanged: (_) => _toggleLesson(lesson),
                ),
                Expanded(
                  child: Text(
                    lesson.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '${lesson.allVocabs.length}',
                  style: TextStyle(color: muted(context), fontSize: 13),
                ),
                const SizedBox(width: 4),
                Icon(
                  expanded ? Icons.expand_less : Icons.expand_more,
                  color: muted(context),
                ),
              ],
            ),
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }

  Widget _buildBoxTile(Box box) {
    final expanded = _expandedBoxes.contains(box.id);
    return InkWell(
      onTap: () => setState(() {
        expanded ? _expandedBoxes.remove(box.id) : _expandedBoxes.add(box.id);
      }),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(28, 4, 8, 4),
        child: Row(
          children: [
            Checkbox(
              tristate: true,
              value: _boxValue(box),
              onChanged: (_) => _toggleBox(box),
            ),
            Expanded(
              child: Text(
                box.name,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              '${box.vocabs.length}',
              style: TextStyle(color: muted(context), fontSize: 13),
            ),
            const SizedBox(width: 4),
            Icon(
              expanded ? Icons.expand_less : Icons.expand_more,
              color: muted(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVocabHeader() {
    final style = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: muted(context),
    );
    return Padding(
      padding: const EdgeInsets.fromLTRB(92, 4, 8, 2),
      child: Row(
        children: [
          Expanded(flex: 3, child: Text('Latein', style: style)),
          Expanded(flex: 2, child: Text('Mittlere Spalte', style: style)),
          Expanded(flex: 3, child: Text('Deutsch', style: style)),
        ],
      ),
    );
  }

  Widget _buildVocabTile(Vocab vocab) {
    return InkWell(
      onTap: () => _toggleVocab(vocab),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(52, 2, 8, 2),
        child: Row(
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: _selected.contains(vocab.id),
                onChanged: (_) => _toggleVocab(vocab),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                vocab.latin,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                vocab.middleColumn ?? '–',
                style: TextStyle(
                  color: muted(context),
                  fontStyle: FontStyle.italic,
                  fontSize: 13,
                ),
              ),
            ),
            Expanded(flex: 3, child: Text(vocab.german)),
          ],
        ),
      ),
    );
  }

  // ── Build ──────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final selectedCount = _selected.length;

    return Scaffold(
      appBar: standardAppBar(
        context,
        'Vokabeln auswählen',
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            tooltip: 'Auswahl',
            onSelected: (value) {
              if (value == 'all') _selectAll();
              if (value == 'none') _clearAll();
            },
            itemBuilder: (_) => const [
              PopupMenuItem(value: 'all', child: Text('Alle auswählen')),
              PopupMenuItem(value: 'none', child: Text('Auswahl aufheben')),
            ],
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 24),
        children: [
          for (final lesson in _lessons) ...[
            _buildLessonTile(lesson),
            if (_expandedLessons.contains(lesson.id))
              for (final box in lesson.boxes) ...[
                _buildBoxTile(box),
                if (_expandedBoxes.contains(box.id)) ...[
                  _buildVocabHeader(),
                  for (final vocab in box.vocabs) _buildVocabTile(vocab),
                ],
              ],
          ],
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: FilledButton.icon(
            onPressed: _confirm,
            icon: const Icon(Icons.check),
            label: Text(
              '${widget.confirmLabel} ($selectedCount Vokabeln)',
            ),
          ),
        ),
      ),
    );
  }
}
