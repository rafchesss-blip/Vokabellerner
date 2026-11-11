import 'package:flutter/material.dart';

import '../data/store.dart';
import '../l10n/l10n.dart';
import '../models/vocab.dart';
import '../theme/app_theme.dart';
import '../utils/review_queue.dart';
import '../widgets/standard_app_bar.dart';
import 'flashcard_screen.dart';
import 'test_screen.dart';

enum _Mode { flashcards, test }

enum _Filter { smart, all, weak }

/// Nach der Auswahl: Modus (Karteikarten/Test) wählen und starten.
class PracticeScreen extends StatefulWidget {
  final List<Vocab> vocabs;

  const PracticeScreen({super.key, required this.vocabs});

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  _Mode _mode = _Mode.flashcards;
  _Filter _filter = _Filter.smart;

  void _snack(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  List<Vocab> _selected() => switch (_filter) {
        _Filter.smart =>
          planReview(widget.vocabs, Store.instance.practiceLists).session,
        _Filter.all => List.of(widget.vocabs)..shuffle(),
        _Filter.weak =>
          widget.vocabs.where((v) => v.isWeak).toList()..shuffle(),
      };

  void _start() {
    final vocabs = _selected();
    if (vocabs.isEmpty) {
      _snack(_filter == _Filter.smart
          ? context.l10n.practiceNothingDue
          : context.l10n.practiceNoWeak);
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => _mode == _Mode.test
            ? TestScreen(vocabs: vocabs)
            : FlashcardScreen(vocabs: vocabs),
      ),
    ).then((_) {
      if (mounted) setState(() {}); // Zähler aktualisieren
    });
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Scaffold(
      appBar: standardAppBar(context, l.practiceTitle),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            l.practiceSelectedCount(widget.vocabs.length),
            textAlign: TextAlign.center,
            style: TextStyle(color: muted(context)),
          ),
          const SizedBox(height: 16),
          SegmentedButton<_Mode>(
            segments: [
              ButtonSegment(
                value: _Mode.flashcards,
                label: Text(l.practiceModeFlashcards),
                icon: const Icon(Icons.style_outlined),
              ),
              ButtonSegment(
                value: _Mode.test,
                label: Text(l.practiceModeTest),
                icon: const Icon(Icons.edit_outlined),
              ),
            ],
            selected: {_mode},
            onSelectionChanged: (s) => setState(() => _mode = s.first),
          ),
          const SizedBox(height: 16),
          Text(
            l.practiceWhichVocabs,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          SegmentedButton<_Filter>(
            segments: [
              ButtonSegment(
                value: _Filter.smart,
                label: Text(l.practiceFilterSmart),
                icon: const Icon(Icons.auto_awesome),
              ),
              ButtonSegment(
                  value: _Filter.all, label: Text(l.practiceFilterAll)),
              ButtonSegment(
                  value: _Filter.weak, label: Text(l.practiceFilterWeak)),
            ],
            selected: {_filter},
            onSelectionChanged: (s) => setState(() => _filter = s.first),
          ),
          const SizedBox(height: 8),
          if (_filter == _Filter.smart)
            Builder(builder: (context) {
              final plan =
                  planReview(widget.vocabs, Store.instance.practiceLists);
              return Text(
                plan.freshLater > 0
                    ? l.practicePlanSummaryLater(
                        plan.due.length, plan.fresh.length, plan.freshLater)
                    : l.practicePlanSummary(plan.due.length, plan.fresh.length),
                textAlign: TextAlign.center,
                style: TextStyle(color: muted(context)),
              );
            }),
          const SizedBox(height: 8),
          Card(
            elevation: 0,
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    _mode == _Mode.flashcards
                        ? Icons.lightbulb_outline
                        : Icons.keyboard_outlined,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      (_mode == _Mode.flashcards
                              ? l.practiceFlashcardsHint
                              : l.practiceTestHint) +
                          (_filter == _Filter.smart
                              ? '\n\n${l.practiceSmartHint}'
                              : ''),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: _start,
            icon: const Icon(Icons.play_arrow),
            label: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child:
                  Text(l.practiceStart, style: const TextStyle(fontSize: 17)),
            ),
          ),
        ],
      ),
    );
  }
}
