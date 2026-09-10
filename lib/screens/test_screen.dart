import 'package:flutter/material.dart';

import '../data/store.dart';
import '../models/settings.dart';
import '../models/vocab.dart';
import '../theme/app_theme.dart';
import '../utils/normalize.dart';
import '../widgets/standard_app_bar.dart';

/// Ein Antwortteil (z. B. „Deutsche Bedeutung" oder „Mittlere Spalte").
class AnswerPart {
  final String label;
  final String correct;
  const AnswerPart(this.label, this.correct);
}

/// Test-Modus: Wort wird angezeigt, Übersetzung und/oder mittlere Spalte
/// müssen selbst eingegeben werden.
class TestScreen extends StatefulWidget {
  final List<Vocab> vocabs;

  const TestScreen({super.key, required this.vocabs});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late final List<Vocab> _queue;
  int _index = 0;

  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  bool _checked = false;
  List<bool> _partResults = [];
  int _correctCount = 0;

  Vocab get _current => _queue[_index];

  String get _question =>
      Settings.instance.direction == LanguageDirection.latinToGerman
          ? _current.latin
          : _current.german;

  @override
  void initState() {
    super.initState();
    _queue = List.of(widget.vocabs)..shuffle();
    _initInputs();
  }

  void _initInputs() {
    final parts = _partsFor(_current);
    _controllers =
        List.generate(parts.length, (_) => TextEditingController());
    _focusNodes = List.generate(parts.length, (_) => FocusNode());
    _checked = false;
    _partResults = List.filled(parts.length, false);
  }

  void _disposeInputs() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
  }

  void _focusFirst() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _focusNodes.isNotEmpty) _focusNodes.first.requestFocus();
    });
  }

  List<AnswerPart> _partsFor(Vocab v) {
    final s = Settings.instance;
    final hasMiddle = v.hasMiddle;

    final translation = s.direction == LanguageDirection.latinToGerman
        ? v.german
        : v.latin;
    final translationLabel = s.direction == LanguageDirection.latinToGerman
        ? 'Deutsche Bedeutung'
        : 'Lateinisches Wort';

    final needTranslation = s.answerMode != AnswerMode.middleOnly;
    final needMiddle = hasMiddle && s.answerMode != AnswerMode.translationOnly;

    final parts = <AnswerPart>[];
    if (needTranslation) parts.add(AnswerPart(translationLabel, translation));
    if (needMiddle) {
      parts.add(AnswerPart('Mittlere Spalte', v.middleColumn!));
    }
    // Fallback: „nur mittlere Spalte" gewählt, aber keine vorhanden.
    if (parts.isEmpty) parts.add(AnswerPart(translationLabel, translation));

    return parts;
  }

  bool get _allFilled =>
      _controllers.every((c) => c.text.trim().isNotEmpty);

  void _check() {
    final parts = _partsFor(_current);
    final results = <bool>[
      for (var i = 0; i < parts.length; i++)
        normalizeAnswer(_controllers[i].text) ==
            normalizeAnswer(parts[i].correct),
    ];
    final allCorrect = results.every((r) => r);

    setState(() {
      _checked = true;
      _partResults = results;
      if (allCorrect) {
        _current.markCorrect();
        _correctCount++;
      } else {
        _current.markWrong();
      }
    });

    Store.instance.save();
  }

  void _next() {
    if (_index + 1 >= _queue.length) {
      _showSummary();
      return;
    }
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      _index++;
      _disposeInputs();
      _initInputs();
    });
    _focusFirst();
  }

  void _restart() {
    Navigator.pop(context); // Dialog schließen
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      _queue.shuffle();
      _index = 0;
      _correctCount = 0;
      _disposeInputs();
      _initInputs();
    });
    _focusFirst();
  }

  void _showSummary() {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Fertig!'),
        content: Text(
          'Du hast $_correctCount von ${_queue.length} Vokabeln '
          'richtig beantwortet.',
        ),
        actions: [
          TextButton(
            onPressed: _restart,
            child: const Text('Nochmal üben'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pop(context);
            },
            child: const Text('Fertig'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    FocusManager.instance.primaryFocus?.unfocus();
    _disposeInputs();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final parts = _partsFor(_current);
    final allCorrect =
        _partResults.isNotEmpty && _partResults.every((r) => r);

    return Scaffold(
      appBar: standardAppBar(context, 'Test ${_index + 1} / ${_queue.length}'),
      body: Column(
        children: [
          LinearProgressIndicator(value: (_index + 1) / _queue.length),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Card(
                  elevation: 0,
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Text(
                          'Übersetze:',
                          style: TextStyle(color: muted(context)),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          _question,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                for (var i = 0; i < parts.length; i++) ...[
                  TextField(
                    controller: _controllers[i],
                    focusNode: _focusNodes[i],
                    enabled: !_checked,
                    textInputAction: i == parts.length - 1
                        ? TextInputAction.done
                        : TextInputAction.next,
                    onSubmitted: (_) {
                      if (i < parts.length - 1) {
                        _focusNodes[i + 1].requestFocus();
                      } else if (!_checked && _allFilled) {
                        _check();
                      }
                    },
                    onChanged: (_) => setState(() {}),
                    decoration: InputDecoration(
                      labelText: parts[i].label,
                      border: const OutlineInputBorder(),
                      helperText: _checked && !_partResults[i]
                          ? 'Richtig: ${parts[i].correct}'
                          : null,
                      errorText:
                          _checked && !_partResults[i] ? 'Falsch' : null,
                      suffixIcon: _checked
                          ? Icon(
                              _partResults[i]
                                  ? Icons.check_circle
                                  : Icons.cancel,
                              color: _partResults[i]
                                  ? Colors.green
                                  : Colors.red,
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
                if (_checked) ...[
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: (allCorrect ? Colors.green : Colors.red)
                          .withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      allCorrect ? 'Richtig! 🎉' : 'Leider falsch.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: allCorrect ? Colors.green : Colors.red,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
                FilledButton(
                  onPressed: _checked
                      ? _next
                      : (_allFilled ? _check : null),
                  child: Text(
                    _checked
                        ? (_index + 1 >= _queue.length ? 'Fertig' : 'Weiter')
                        : 'Prüfen',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
