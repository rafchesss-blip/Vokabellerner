import 'package:flutter/material.dart';

import '../data/store.dart';
import '../models/vocab.dart';
import '../widgets/standard_app_bar.dart';

/// Bearbeiten einer eigenen Lektion: Vokabeln ändern, löschen, ergänzen.
/// Der Lernfortschritt unveränderter Vokabeln bleibt erhalten.
class LessonEditScreen extends StatefulWidget {
  final Lesson lesson;

  const LessonEditScreen({super.key, required this.lesson});

  @override
  State<LessonEditScreen> createState() => _LessonEditScreenState();
}

class _VocabDraft {
  final String? id;
  final TextEditingController latin = TextEditingController();
  final TextEditingController middle = TextEditingController();
  final TextEditingController german = TextEditingController();

  _VocabDraft({this.id});

  void dispose() {
    latin.dispose();
    middle.dispose();
    german.dispose();
  }
}

class _BoxDraft {
  final String? id;
  final TextEditingController name = TextEditingController();
  final List<_VocabDraft> vocabs = [];

  _BoxDraft({this.id});

  void dispose() {
    name.dispose();
    for (final v in vocabs) {
      v.dispose();
    }
  }
}

class _LessonEditScreenState extends State<LessonEditScreen> {
  late final TextEditingController _lessonName;
  late final List<_BoxDraft> _boxes;

  bool _busy = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _lessonName = TextEditingController(text: widget.lesson.name);
    _boxes = _parseBoxes(widget.lesson);
  }

  List<_BoxDraft> _parseBoxes(Lesson lesson) {
    final boxes = <_BoxDraft>[];
    for (final rawBox in lesson.boxes) {
      final box = _BoxDraft(id: rawBox.id);
      box.name.text = rawBox.name;
      for (final v in rawBox.vocabs) {
        final draft = _VocabDraft(id: v.id);
        draft.latin.text = v.latin;
        draft.middle.text = v.middleColumn ?? '';
        draft.german.text = v.german;
        box.vocabs.add(draft);
      }
      if (box.vocabs.isEmpty) box.vocabs.add(_VocabDraft());
      boxes.add(box);
    }
    if (boxes.isEmpty) {
      final box = _BoxDraft();
      box.name.text = 'Kasten 1';
      box.vocabs.add(_VocabDraft());
      boxes.add(box);
    }
    return boxes;
  }

  @override
  void dispose() {
    _lessonName.dispose();
    for (final b in _boxes) {
      b.dispose();
    }
    super.dispose();
  }

  void _addBox() {
    setState(() {
      final box = _BoxDraft();
      box.name.text = 'Kasten ${_boxes.length + 1}';
      box.vocabs.add(_VocabDraft());
      _boxes.add(box);
    });
  }

  void _addVocab(_BoxDraft box) {
    setState(() => box.vocabs.add(_VocabDraft()));
  }

  void _removeBox(_BoxDraft box) {
    setState(() {
      _boxes.remove(box);
      box.dispose();
    });
  }

  void _removeVocab(_BoxDraft box, _VocabDraft vocab) {
    setState(() {
      box.vocabs.remove(vocab);
      vocab.dispose();
    });
  }

  Future<void> _save() async {
    final name = _lessonName.text.trim();
    if (name.isEmpty) {
      setState(() => _error = 'Bitte einen Lektionsnamen eingeben.');
      return;
    }

    final oldVocabs = {for (final v in widget.lesson.allVocabs) v.id: v};
    final boxes = <Box>[];
    for (final box in _boxes) {
      final vocabs = <Vocab>[];
      for (final v in box.vocabs) {
        final latin = v.latin.text.trim();
        final german = v.german.text.trim();
        if (latin.isEmpty && german.isEmpty) continue; // leere Zeile
        if (latin.isEmpty || german.isEmpty) {
          setState(() => _error =
              'Jede Vokabel braucht ein lateinisches Wort und eine Übersetzung.');
          return;
        }
        final middle = v.middle.text.trim();
        final old = oldVocabs[v.id];
        vocabs.add(Vocab(
          id: v.id ?? newId(),
          latin: latin,
          german: german,
          middleColumn: middle.isEmpty ? null : middle,
          level: old?.level ?? 0,
          history: old?.history,
          srs: old?.srs,
        ));
      }
      if (vocabs.isNotEmpty) {
        boxes.add(Box(
          id: box.id ?? newId(),
          name: box.name.text.trim().isEmpty
              ? 'Kasten ${boxes.length + 1}'
              : box.name.text.trim(),
          vocabs: vocabs,
        ));
      }
    }

    if (boxes.isEmpty) {
      setState(() => _error = 'Füge mindestens einen Kasten mit Vokabeln hinzu.');
      return;
    }

    setState(() {
      _busy = true;
      _error = null;
    });

    await Store.instance.replaceLesson(
      Lesson(id: widget.lesson.id, name: name, boxes: boxes),
    );
    if (mounted) Navigator.pop(context, true);
  }

  Future<void> _deleteLesson() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('„${widget.lesson.name}" löschen?'),
        content: const Text(
          'Die Lektion und ihr Lernfortschritt werden entfernt. Das kann '
          'nicht rückgängig gemacht werden.',
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
    if (confirmed != true || !mounted) return;

    await Store.instance.deleteLesson(widget.lesson.id);
    if (!mounted) return;
    // Bearbeiten- und Detailansicht schließen.
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: standardAppBar(
        context,
        'Lektion bearbeiten',
        actions: [
          IconButton(
            tooltip: 'Lektion löschen',
            icon: const Icon(Icons.delete_outline, color: Colors.red),
            onPressed: _deleteLesson,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        children: [
          TextField(
            controller: _lessonName,
            decoration: const InputDecoration(
              labelText: 'Lektionsname',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          for (final box in _boxes) _buildBoxCard(box),
          OutlinedButton.icon(
            onPressed: _addBox,
            icon: const Icon(Icons.add),
            label: const Text('Kasten hinzufügen'),
          ),
          if (_error != null) ...[
            const SizedBox(height: 12),
            Text(
              _error!,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ],
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: _busy ? null : _save,
            icon: _busy
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.save_outlined),
            label: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text('Speichern'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBoxCard(_BoxDraft box) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: box.name,
                    decoration: const InputDecoration(
                      labelText: 'Kastenname',
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                  ),
                ),
                IconButton(
                  tooltip: 'Kasten entfernen',
                  icon: const Icon(Icons.delete_outline),
                  onPressed: _boxes.length > 1
                      ? () => _removeBox(box)
                      : null,
                ),
              ],
            ),
            const SizedBox(height: 8),
            for (final vocab in box.vocabs) _buildVocabRow(box, vocab),
            TextButton.icon(
              onPressed: () => _addVocab(box),
              icon: const Icon(Icons.add, size: 18),
              label: const Text('Vokabel hinzufügen'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVocabRow(_BoxDraft box, _VocabDraft vocab) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TextField(
              controller: vocab.latin,
              decoration: const InputDecoration(
                labelText: 'Latein',
                border: OutlineInputBorder(),
                isDense: true,
              ),
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: TextField(
              controller: vocab.middle,
              decoration: const InputDecoration(
                labelText: 'Mittlere Spalte',
                border: OutlineInputBorder(),
                isDense: true,
              ),
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: TextField(
              controller: vocab.german,
              decoration: const InputDecoration(
                labelText: 'Übersetzung',
                border: OutlineInputBorder(),
                isDense: true,
              ),
            ),
          ),
          IconButton(
            tooltip: 'Vokabel löschen',
            icon: const Icon(Icons.close, size: 20),
            onPressed: box.vocabs.length > 1
                ? () => _removeVocab(box, vocab)
                : null,
          ),
        ],
      ),
    );
  }
}
