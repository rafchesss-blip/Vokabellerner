import 'package:flutter/material.dart';

import '../models/vocab.dart';
import '../theme/app_theme.dart';
import '../widgets/standard_app_bar.dart';

/// Neue Lektion anlegen oder ihre Einstellungen ändern: Name, Sprache und
/// welche Felder eingegeben werden (Wort, Übersetzung, Formen, Sonstiges).
///
/// Liefert die (neue oder geänderte) Lektion zurück, `null` bei Abbruch.
class LessonSetupScreen extends StatefulWidget {
  final Lesson? lesson;

  const LessonSetupScreen({super.key, this.lesson});

  @override
  State<LessonSetupScreen> createState() => _LessonSetupScreenState();
}

class _LessonSetupScreenState extends State<LessonSetupScreen> {
  static const _languages = [
    'Englisch',
    'Französisch',
    'Latein',
    'Spanisch',
    'Italienisch',
    'Russisch',
  ];
  static const _extraSuggestions = [
    'Beispielsatz',
    'Merkhilfe',
    'Aussprache',
    'Gegenteil',
  ];
  static const _maxExtras = 3;

  late final _name = TextEditingController(text: widget.lesson?.name ?? '');
  late final _language =
      TextEditingController(text: widget.lesson?.language ?? '');
  late final _translation = TextEditingController(
      text: widget.lesson?.translationLanguage ?? 'Deutsch');
  late bool _hasForms = widget.lesson?.hasForms ?? false;
  late bool _allForms = widget.lesson?.allForms ?? true;
  late final Set<FormKind> _kinds = {
    ...?widget.lesson?.formKinds,
  };
  late final List<TextEditingController> _extras = [
    for (final l in widget.lesson?.extraLabels ?? const <String>[])
      TextEditingController(text: l),
  ];

  @override
  void dispose() {
    _name.dispose();
    _language.dispose();
    _translation.dispose();
    for (final c in _extras) {
      c.dispose();
    }
    super.dispose();
  }

  bool get _valid =>
      _name.text.trim().isNotEmpty &&
      _language.text.trim().isNotEmpty &&
      (!_hasForms || _allForms || _kinds.isNotEmpty);

  void _addExtra([String label = '']) {
    if (_extras.length >= _maxExtras) return;
    setState(() => _extras.add(TextEditingController(text: label)));
  }

  void _save() {
    final labels = [
      for (var i = 0; i < _extras.length; i++)
        _extras[i].text.trim().isEmpty
            ? 'Sonstiges ${i + 1}'
            : _extras[i].text.trim(),
    ];
    final lesson = widget.lesson ??
        Lesson(id: newId(), name: '', boxes: [])
      ..mainBox;
    lesson
      ..name = _name.text.trim()
      ..language = _language.text.trim()
      ..translationLanguage = _translation.text.trim().isEmpty
          ? 'Deutsch'
          : _translation.text.trim()
      ..hasForms = _hasForms
      ..allForms = _hasForms && _allForms
      ..formKinds = _hasForms && !_allForms ? {..._kinds} : {}
      ..extraLabels = labels;
    Navigator.pop(context, lesson);
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: standardAppBar(
        context,
        widget.lesson == null ? 'Neue Lektion' : 'Lektion einstellen',
        showSettings: false,
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: FilledButton.icon(
            onPressed: _valid ? _save : null,
            icon: const Icon(Icons.check),
            label: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text('Speichern', style: TextStyle(fontSize: 17)),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _name,
            autofocus: widget.lesson == null,
            textCapitalization: TextCapitalization.sentences,
            decoration: const InputDecoration(
              labelText: 'Name der Lektion',
              hintText: 'z. B. Unit 3 oder Lektion 5',
              border: OutlineInputBorder(),
            ),
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _language,
            textCapitalization: TextCapitalization.sentences,
            decoration: const InputDecoration(
              labelText: 'Sprache der Wörter',
              border: OutlineInputBorder(),
            ),
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              for (final l in _languages)
                ChoiceChip(
                  label: Text(l),
                  selected: _language.text.trim() == l,
                  onSelected: (_) => setState(() => _language.text = l),
                ),
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _translation,
            textCapitalization: TextCapitalization.sentences,
            decoration: const InputDecoration(
              labelText: 'Übersetzung auf',
              border: OutlineInputBorder(),
            ),
          ),
          const Divider(height: 40),
          Text('Was wird eingegeben?', style: titleStyle),
          const SizedBox(height: 4),
          Text(
            'Danach richtet sich das Eingeben, das Scannen mit KI und der '
            'Test.',
            style: TextStyle(color: muted(context)),
          ),
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                const CheckboxListTile(
                  value: true,
                  onChanged: null,
                  title: Text('Wort'),
                  subtitle: Text('immer dabei'),
                ),
                const CheckboxListTile(
                  value: true,
                  onChanged: null,
                  title: Text('Übersetzung'),
                  subtitle: Text('immer dabei'),
                ),
                CheckboxListTile(
                  value: _hasForms,
                  onChanged: (v) => setState(() => _hasForms = v ?? false),
                  title: const Text('Formen'),
                  subtitle: const Text(
                      'z. B. Stammformen, Genitiv, Geschlecht'),
                ),
                if (_hasForms)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Welche Formen?',
                          style: TextStyle(color: muted(context)),
                        ),
                        const SizedBox(height: 6),
                        Wrap(
                          spacing: 8,
                          runSpacing: 4,
                          children: [
                            FilterChip(
                              label: const Text('Alles'),
                              selected: _allForms,
                              onSelected: (on) =>
                                  setState(() => _allForms = on),
                            ),
                            if (!_allForms)
                              for (final k in FormKind.values)
                                FilterChip(
                                  label: Text(k.label),
                                  selected: _kinds.contains(k),
                                  onSelected: (on) => setState(() =>
                                      on ? _kinds.add(k) : _kinds.remove(k)),
                                ),
                          ],
                        ),
                        if (_allForms)
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              'Alles, was im Buch zum Wort steht: Stammformen, '
                              'Plural, Geschlecht, Steigerung, Fall und mehr.',
                              style: TextStyle(color: muted(context)),
                            ),
                          )
                        else if (_kinds.isEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              'Wähle mindestens eine Art aus.',
                              style: TextStyle(color: scheme.error),
                            ),
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text('Sonstiges (bis zu 3)', style: titleStyle),
          const SizedBox(height: 4),
          Text(
            'Eigene Felder, z. B. Beispielsatz oder Merkhilfe.',
            style: TextStyle(color: muted(context)),
          ),
          const SizedBox(height: 8),
          for (var i = 0; i < _extras.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TextField(
                controller: _extras[i],
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  labelText: 'Sonstiges ${i + 1} – Name',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    tooltip: 'Entfernen',
                    icon: const Icon(Icons.close),
                    onPressed: () => setState(() {
                      _extras.removeAt(i).dispose();
                    }),
                  ),
                ),
              ),
            ),
          if (_extras.length < _maxExtras)
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                ActionChip(
                  avatar: const Icon(Icons.add, size: 18),
                  label: const Text('Sonstiges'),
                  onPressed: _addExtra,
                ),
                for (final s in _extraSuggestions)
                  if (!_extras.any((c) => c.text.trim() == s))
                    ActionChip(
                      label: Text(s),
                      onPressed: () => _addExtra(s),
                    ),
              ],
            ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
