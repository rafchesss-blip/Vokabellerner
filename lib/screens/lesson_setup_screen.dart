import 'package:flutter/material.dart';

import '../l10n/l10n.dart';
import '../models/vocab.dart';
import '../theme/app_theme.dart';
import '../widgets/standard_app_bar.dart';

/// Name der aktuellen App-Sprache (in der App-Sprache), z. B. „Deutsch" –
/// Vorgabe für die Übersetzungssprache neuer Lektionen.
String _appLanguageName() => switch (appLanguageCode) {
      'en' => L.languageEnglish,
      'es' => L.languageSpanish,
      'fr' => L.languageFrench,
      'it' => L.languageItalian,
      'pt' => L.languagePortuguese,
      'pl' => L.languagePolish,
      'tr' => L.languageTurkish,
      'ru' => L.languageRussian,
      'zh' => L.languageChinese,
      _ => L.languageGerman,
    };

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
  static List<String> _languages(AppLocalizations l) => [
        l.languageEnglish,
        l.languageFrench,
        l.languageLatin,
        l.languageSpanish,
        l.languageItalian,
        l.languageRussian,
      ];
  static List<String> _extraSuggestions(AppLocalizations l) => [
        l.lessonSetupSuggestionExample,
        l.lessonSetupSuggestionMnemonic,
        l.lessonSetupSuggestionPronunciation,
        l.lessonSetupSuggestionOpposite,
      ];
  static const _maxExtras = 3;

  late final _name = TextEditingController(text: widget.lesson?.name ?? '');
  late final _language =
      TextEditingController(text: widget.lesson?.language ?? '');
  late final _translation = TextEditingController(
      text: widget.lesson?.translationLanguage ?? _appLanguageName());
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
            ? context.l10n.lessonSetupExtraDefaultName(i + 1)
            : _extras[i].text.trim(),
    ];
    final lesson = widget.lesson ??
        Lesson(id: newId(), name: '', boxes: [])
      ..mainBox;
    lesson
      ..name = _name.text.trim()
      ..language = _language.text.trim()
      ..translationLanguage = _translation.text.trim().isEmpty
          ? _appLanguageName()
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
    final l10n = context.l10n;

    return Scaffold(
      appBar: standardAppBar(
        context,
        widget.lesson == null
            ? l10n.lessonSetupTitleNew
            : l10n.lessonSetupTitleEdit,
        showSettings: false,
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: FilledButton.icon(
            onPressed: _valid ? _save : null,
            icon: const Icon(Icons.check),
            label: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child:
                  Text(l10n.commonSave, style: const TextStyle(fontSize: 17)),
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
            decoration: InputDecoration(
              labelText: l10n.lessonSetupNameLabel,
              hintText: l10n.lessonSetupNameHint,
              border: const OutlineInputBorder(),
            ),
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _language,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              labelText: l10n.lessonSetupLanguageLabel,
              border: const OutlineInputBorder(),
            ),
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              for (final l in _languages(l10n))
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
            decoration: InputDecoration(
              labelText: l10n.lessonSetupTranslationLabel,
              border: const OutlineInputBorder(),
            ),
          ),
          const Divider(height: 40),
          Text(l10n.lessonSetupFieldsTitle, style: titleStyle),
          const SizedBox(height: 4),
          Text(
            l10n.lessonSetupFieldsHelp,
            style: TextStyle(color: muted(context)),
          ),
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                CheckboxListTile(
                  value: true,
                  onChanged: null,
                  title: Text(l10n.lessonSetupWord),
                  subtitle: Text(l10n.lessonSetupAlwaysIncluded),
                ),
                CheckboxListTile(
                  value: true,
                  onChanged: null,
                  title: Text(l10n.lessonSetupTranslation),
                  subtitle: Text(l10n.lessonSetupAlwaysIncluded),
                ),
                CheckboxListTile(
                  value: _hasForms,
                  onChanged: (v) => setState(() => _hasForms = v ?? false),
                  title: Text(l10n.lessonSetupForms),
                  subtitle: Text(l10n.lessonSetupFormsSubtitle),
                ),
                if (_hasForms)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          l10n.lessonSetupWhichForms,
                          style: TextStyle(color: muted(context)),
                        ),
                        const SizedBox(height: 6),
                        Wrap(
                          spacing: 8,
                          runSpacing: 4,
                          children: [
                            FilterChip(
                              label: Text(l10n.lessonSetupAllForms),
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
                              l10n.lessonSetupAllFormsHelp,
                              style: TextStyle(color: muted(context)),
                            ),
                          )
                        else if (_kinds.isEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              l10n.lessonSetupPickOneKind,
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
          Text(l10n.lessonSetupExtrasTitle, style: titleStyle),
          const SizedBox(height: 4),
          Text(
            l10n.lessonSetupExtrasHelp,
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
                  labelText: l10n.lessonSetupExtraFieldLabel(i + 1),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    tooltip: l10n.lessonSetupRemove,
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
                  label: Text(l10n.lessonSetupExtraChip),
                  onPressed: _addExtra,
                ),
                for (final s in _extraSuggestions(l10n))
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
