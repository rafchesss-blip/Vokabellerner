import 'package:flutter/material.dart';

import '../data/store.dart';
import '../models/settings.dart';
import '../models/vocab.dart';
import '../theme/app_theme.dart';
import '../utils/fsrs.dart';
import '../utils/review_queue.dart';
import '../utils/normalize.dart';
import '../widgets/session_summary.dart';
import '../widgets/standard_app_bar.dart';

/// Ein Antwortteil (z. B. „Übersetzung", „Formen" oder ein Sonstiges-Feld).
class AnswerPart {
  final String label;
  final String correct;
  const AnswerPart(this.label, this.correct);
}

/// Test-Modus: Wort wird angezeigt, Übersetzung und/oder Formen (und auf
/// Wunsch die Sonstiges-Felder) müssen selbst eingegeben werden.
class TestScreen extends StatefulWidget {
  final List<Vocab> vocabs;

  const TestScreen({super.key, required this.vocabs});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late List<Vocab> _queue;
  int _index = 0;

  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  bool _checked = false;
  List<bool> _partResults = [];
  int _correctCount = 0;

  /// Anzahl unterschiedlicher Vokabeln zu Beginn des Tests.
  late int _total;

  /// Vokabeln, die in diesem Test schon einmal geprüft wurden.
  final Set<String> _seen = {};

  Vocab get _current => _queue[_index];

  String get _question =>
      Settings.instance.direction == LanguageDirection.latinToGerman
          ? _current.latin
          : _current.german;

  @override
  void initState() {
    super.initState();
    _queue = List.of(widget.vocabs);
    _total = _queue.length;
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
    final lesson = Store.instance.lessonOf(v);
    final translationLabel = s.direction == LanguageDirection.latinToGerman
        ? 'Übersetzung (${lesson?.translationLanguage ?? 'Deutsch'})'
        : (lesson == null || lesson.language.isEmpty
            ? 'Wort'
            : 'Wort (${lesson.language})');

    final needTranslation = s.answerMode != AnswerMode.middleOnly;
    final needMiddle = hasMiddle && s.answerMode != AnswerMode.translationOnly;

    final parts = <AnswerPart>[];
    if (needTranslation) parts.add(AnswerPart(translationLabel, translation));
    if (needMiddle) {
      parts.add(AnswerPart('Formen', v.middleColumn!));
    }
    // Fallback: „nur Formen" gewählt, aber keine vorhanden.
    if (parts.isEmpty) parts.add(AnswerPart(translationLabel, translation));
    if (s.askExtras) {
      for (final e in v.extras) {
        parts.add(AnswerPart(e.label, e.value));
      }
    }

    return parts;
  }

  bool get _allFilled =>
      _controllers.every((c) => c.text.trim().isNotEmpty);

  void _check() {
    if (_checked) return;
    final parts = _partsFor(_current);
    final results = <bool>[
      for (var i = 0; i < parts.length; i++)
        normalizeAnswer(_controllers[i].text) ==
            normalizeAnswer(parts[i].correct),
    ];
    final allCorrect = results.every((r) => r);
    final card = _current;
    final firstTry = _seen.add(card.id);

    setState(() {
      _checked = true;
      _partResults = results;
      if (allCorrect && firstTry) _correctCount++;
      Store.instance.logReview();
      reviewWithExam(
        card,
        allCorrect ? Rating.good : Rating.again,
        Store.instance.practiceLists,
      );
      // Falsch beantwortete Vokabeln kommen später noch einmal dran.
      if (!allCorrect) {
        _queue.insert((_index + 4).clamp(0, _queue.length), card);
      }
    });

    Store.instance.save();
  }

  bool _summaryShown = false;

  void _next() {
    if (_index + 1 >= _queue.length) {
      if (!_summaryShown) _showSummary();
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
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      _queue = {for (final v in _queue) v.id: v}.values.toList()..shuffle();
      _index = 0;
      _correctCount = 0;
      _seen.clear();
      _summaryShown = false;
      _disposeInputs();
      _initInputs();
    });
    _focusFirst();
  }

  void _showSummary() {
    _summaryShown = true;
    showSessionSummary(
      context,
      correct: _correctCount,
      total: _total,
      onRestart: _restart,
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
