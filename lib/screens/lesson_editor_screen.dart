import 'package:flutter/material.dart';

import '../services/api.dart';
import '../services/auth.dart';
import '../widgets/standard_app_bar.dart';

/// Formular zum Hinzufügen einer neuen Lektion durch den Admin.
///
/// Die Lektion wird im bekannten Tabellen-Format erfasst:
/// Kästen mit jeweils mehreren Zeilen „Lateinisches Wort / Mittlere Spalte /
/// Übersetzung".
class LessonEditorScreen extends StatefulWidget {
  const LessonEditorScreen({super.key});

  @override
  State<LessonEditorScreen> createState() => _LessonEditorScreenState();
}

class _VocabDraft {
  final TextEditingController latin = TextEditingController();
  final TextEditingController middle = TextEditingController();
  final TextEditingController german = TextEditingController();

  void dispose() {
    latin.dispose();
    middle.dispose();
    german.dispose();
  }
}

class _BoxDraft {
  final TextEditingController name = TextEditingController();
  final List<_VocabDraft> vocabs = [];

  void dispose() {
    name.dispose();
    for (final v in vocabs) {
      v.dispose();
    }
  }
}

class _LessonEditorScreenState extends State<LessonEditorScreen> {
  final TextEditingController _lessonName = TextEditingController();
  final List<_BoxDraft> _boxes = [];

  bool _busy = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _addBox();
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

    final boxes = <Map<String, dynamic>>[];
    for (final box in _boxes) {
      final vocabs = <Map<String, dynamic>>[];
      for (final v in box.vocabs) {
        final latin = v.latin.text.trim();
        final german = v.german.text.trim();
        if (latin.isEmpty || german.isEmpty) {
          setState(() => _error = 'Jede Vokabel braucht ein lateinisches Wort und eine Übersetzung.');
          return;
        }
        vocabs.add({
          'latin': latin,
          'middle': v.middle.text.trim().isEmpty ? null : v.middle.text.trim(),
          'german': german,
        });
      }
      if (vocabs.isNotEmpty) {
        boxes.add({
          'name': box.name.text.trim().isEmpty
              ? 'Kasten ${boxes.length + 1}'
              : box.name.text.trim(),
          'vocabs': vocabs,
        });
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

    try {
      await Api.adminAddLesson(AuthService.instance.token!, {
        'name': name,
        'boxes': boxes,
      });
      if (mounted) {
        Navigator.pop(context, true);
      }
    } catch (e) {
      if (mounted) setState(() => _error = e.toString());
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: standardAppBar(context, 'Lektion hinzufügen'),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        children: [
          TextField(
            controller: _lessonName,
            decoration: const InputDecoration(
              labelText: 'Lektionsname',
              hintText: 'z. B. Lektion 5',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          for (var i = 0; i < _boxes.length; i++) _buildBoxCard(_boxes[i]),
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
              child: Text('Lektion speichern'),
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
            const Text(
              'Latein · Mittlere Spalte · Übersetzung',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
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
            tooltip: 'Vokabel entfernen',
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
