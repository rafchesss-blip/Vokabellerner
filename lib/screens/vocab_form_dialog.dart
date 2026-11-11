import 'package:flutter/material.dart';

import '../models/vocab.dart';

/// Vokabel selbst eingeben oder bearbeiten – mit genau den Feldern der
/// Lektion. Liefert die Vokabel zurück, `null` bei Abbruch.
Future<Vocab?> showVocabForm(
  BuildContext context,
  Lesson lesson, {
  Vocab? vocab,
}) =>
    showDialog<Vocab>(
      context: context,
      builder: (_) => _VocabForm(lesson: lesson, vocab: vocab),
    );

class _VocabForm extends StatefulWidget {
  final Lesson lesson;
  final Vocab? vocab;

  const _VocabForm({required this.lesson, this.vocab});

  @override
  State<_VocabForm> createState() => _VocabFormState();
}

class _VocabFormState extends State<_VocabForm> {
  late final _word = TextEditingController(text: widget.vocab?.latin);
  late final _translation = TextEditingController(text: widget.vocab?.german);
  late final _forms = TextEditingController(text: widget.vocab?.middleColumn);
  late final _extras = [
    for (final label in widget.lesson.extraLabels)
      TextEditingController(
        text: widget.vocab?.extras
            .where((e) => e.label == label)
            .firstOrNull
            ?.value,
      ),
  ];

  @override
  void dispose() {
    for (final c in [_word, _translation, _forms, ..._extras]) {
      c.dispose();
    }
    super.dispose();
  }

  bool get _valid =>
      _word.text.trim().isNotEmpty && _translation.text.trim().isNotEmpty;

  void _save() {
    if (!_valid) return;
    final lesson = widget.lesson;
    final extras = [
      for (var i = 0; i < lesson.extraLabels.length; i++)
        if (_extras[i].text.trim().isNotEmpty)
          VocabExtra(lesson.extraLabels[i], _extras[i].text.trim()),
    ];
    final forms = _forms.text.trim();
    final v = widget.vocab ??
        Vocab(id: newId(), latin: '', german: '');
    v
      ..latin = _word.text.trim()
      ..german = _translation.text.trim()
      ..middleColumn = lesson.hasForms && forms.isNotEmpty ? forms : null
      ..extras = extras;
    Navigator.pop(context, v);
  }

  Widget _field(
    TextEditingController c,
    String label, {
    String? hint,
    bool last = false,
    bool autofocus = false,
  }) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: TextField(
          controller: c,
          autofocus: autofocus,
          textInputAction: last ? TextInputAction.done : TextInputAction.next,
          onSubmitted: last ? (_) => _save() : null,
          onChanged: (_) => setState(() {}),
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            border: const OutlineInputBorder(),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final lesson = widget.lesson;
    final language = lesson.language.isEmpty ? '' : ' (${lesson.language})';
    final hasExtras = lesson.extraLabels.isNotEmpty;

    return AlertDialog(
      title: Text(widget.vocab == null ? 'Neue Vokabel' : 'Vokabel bearbeiten'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _field(_word, 'Wort$language', autofocus: true),
            _field(
              _translation,
              'Übersetzung (${lesson.translationLanguage})',
              last: !lesson.hasForms && !hasExtras,
            ),
            if (lesson.hasForms)
              _field(
                _forms,
                'Formen',
                hint: lesson.formKinds.map((k) => k.label).join(', '),
                last: !hasExtras,
              ),
            for (var i = 0; i < lesson.extraLabels.length; i++)
              _field(
                _extras[i],
                lesson.extraLabels[i],
                last: i == lesson.extraLabels.length - 1,
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
          onPressed: _valid ? _save : null,
          child: const Text('Speichern'),
        ),
      ],
    );
  }
}
