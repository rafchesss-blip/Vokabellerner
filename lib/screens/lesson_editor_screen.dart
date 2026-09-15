import 'package:flutter/material.dart';

import '../services/api.dart';
import '../services/auth.dart';
import '../theme/app_theme.dart';
import '../utils/lesson_parser.dart';
import '../widgets/standard_app_bar.dart';

/// Admin-Formular zum Hinzufügen einer Lektion.
///
/// Die komplette Lektion wird als Text eingefügt (im bekannten
/// Tabellen-Format mit Kästen und Spalten) und automatisch erkannt.
class LessonEditorScreen extends StatefulWidget {
  const LessonEditorScreen({super.key});

  @override
  State<LessonEditorScreen> createState() => _LessonEditorScreenState();
}

class _BoxView {
  final TextEditingController name;
  final List<ParsedVocab> vocabs;

  _BoxView(this.name, this.vocabs);
}

class _LessonEditorScreenState extends State<LessonEditorScreen> {
  final TextEditingController _input = TextEditingController();
  final TextEditingController _lessonName = TextEditingController();

  final List<_BoxView> _boxes = [];
  bool _parsed = false;
  bool _busy = false;
  String? _error;

  @override
  void dispose() {
    _input.dispose();
    _lessonName.dispose();
    for (final b in _boxes) {
      b.name.dispose();
    }
    super.dispose();
  }

  void _parse() {
    final text = _input.text;
    if (text.trim().isEmpty) {
      setState(() => _error = 'Bitte füge zuerst den Lektionstext ein.');
      return;
    }

    try {
      final lesson = parseLessonText(text);

      // Alte Vorschau-Controller aufräumen.
      for (final b in _boxes) {
        b.name.dispose();
      }

      setState(() {
        _boxes.clear();
        _lessonName.text = lesson.name;
        for (final box in lesson.boxes) {
          _boxes.add(_BoxView(TextEditingController(text: box.name), box.vocabs));
        }
        _parsed = true;
        _error = null;
      });
    } catch (e) {
      setState(() {
        _parsed = false;
        _error = e.toString().replaceFirst('FormatException: ', '');
      });
    }
  }

  void _removeBox(int index) {
    setState(() {
      _boxes[index].name.dispose();
      _boxes.removeAt(index);
    });
  }

  void _removeVocab(_BoxView box, int index) {
    setState(() => box.vocabs.removeAt(index));
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
        vocabs.add({
          'latin': v.latin,
          'middle': v.middle,
          'german': v.german,
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
      setState(() => _error = 'Keine Vokabeln vorhanden.');
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
      if (mounted) Navigator.pop(context, true);
    } catch (e) {
      if (mounted) setState(() => _error = e.toString());
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final total = _boxes.fold<int>(0, (s, b) => s + b.vocabs.length);

    return Scaffold(
      appBar: standardAppBar(context, 'Lektion hinzufügen'),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        children: [
          Text(
            'Füge die komplette Lektion unten ein. Das Programm erkennt '
            'Lektionsname, Kästen und Vokabeln automatisch.',
            style: TextStyle(color: muted(context)),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _input,
            minLines: 8,
            maxLines: 20,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              labelText: 'Lektionstext',
              hintText:
                  'Lektion 5\n\nKasten 1\nLateinisches Wort    Mittlere Spalte    Übersetzung\nluna    f    der Mond\nstella        der Stern\n\nKasten 2\n...',
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: _parse,
            icon: const Icon(Icons.auto_fix_high),
            label: const Text('Lektion erkennen'),
          ),
          if (_error != null) ...[
            const SizedBox(height: 12),
            Text(
              _error!,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ],
          if (_parsed) ...[
            const SizedBox(height: 16),
            TextField(
              controller: _lessonName,
              decoration: const InputDecoration(
                labelText: 'Lektionsname',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${_boxes.length} Kästen · $total Vokabeln erkannt',
              style: TextStyle(color: muted(context), fontSize: 13),
            ),
            const SizedBox(height: 8),
            for (var i = 0; i < _boxes.length; i++) _buildBoxCard(i),
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
        ],
      ),
    );
  }

  Widget _buildBoxCard(int index) {
    final box = _boxes[index];
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
                  onPressed: () => _removeBox(index),
                ),
              ],
            ),
            const SizedBox(height: 8),
            for (var vi = 0; vi < box.vocabs.length; vi++)
              _buildVocabTile(box, vi),
          ],
        ),
      ),
    );
  }

  Widget _buildVocabTile(_BoxView box, int index) {
    final v = box.vocabs[index];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              v.latin,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              v.middle ?? '–',
              style: TextStyle(
                color: muted(context),
                fontStyle: FontStyle.italic,
                fontSize: 13,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(v.german),
          ),
          IconButton(
            tooltip: 'Vokabel entfernen',
            icon: const Icon(Icons.close, size: 18),
            onPressed: () => _removeVocab(box, index),
          ),
        ],
      ),
    );
  }
}
