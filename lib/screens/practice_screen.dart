import 'package:flutter/material.dart';

import '../models/vocab.dart';
import '../theme/app_theme.dart';
import '../widgets/standard_app_bar.dart';
import 'flashcard_screen.dart';
import 'test_screen.dart';

enum _Mode { flashcards, test }

enum _Filter { all, weak }

/// Nach der Auswahl: Modus (Karteikarten/Test) wählen und starten.
class PracticeScreen extends StatefulWidget {
  final List<Vocab> vocabs;

  const PracticeScreen({super.key, required this.vocabs});

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  _Mode _mode = _Mode.flashcards;
  _Filter _filter = _Filter.all;

  void _snack(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _start() {
    if (_mode == _Mode.test) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => TestScreen(vocabs: List.of(widget.vocabs)),
        ),
      );
    } else {
      final vocabs = _filter == _Filter.all
          ? widget.vocabs
          : widget.vocabs.where((v) => v.isWeak).toList();

      if (vocabs.isEmpty) {
        _snack('Keine schwachen Vokabeln vorhanden. 😎');
        return;
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => FlashcardScreen(vocabs: List.of(vocabs)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: standardAppBar(context, 'Modus wählen'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            '${widget.vocabs.length} Vokabeln ausgewählt',
            textAlign: TextAlign.center,
            style: TextStyle(color: muted(context)),
          ),
          const SizedBox(height: 16),
          SegmentedButton<_Mode>(
            segments: const [
              ButtonSegment(
                value: _Mode.flashcards,
                label: Text('Karteikarten'),
                icon: Icon(Icons.style_outlined),
              ),
              ButtonSegment(
                value: _Mode.test,
                label: Text('Test'),
                icon: Icon(Icons.edit_outlined),
              ),
            ],
            selected: {_mode},
            onSelectionChanged: (s) => setState(() => _mode = s.first),
          ),
          const SizedBox(height: 16),
          if (_mode == _Mode.flashcards) ...[
            Text(
              'Welche Vokabeln?',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            SegmentedButton<_Filter>(
              segments: const [
                ButtonSegment(value: _Filter.all, label: Text('Alle')),
                ButtonSegment(
                  value: _Filter.weak,
                  label: Text('Nur schwache'),
                ),
              ],
              selected: {_filter},
              onSelectionChanged: (s) => setState(() => _filter = s.first),
            ),
            const SizedBox(height: 8),
          ],
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
                      _mode == _Mode.flashcards
                          ? 'Ein Wort wird angezeigt. Du deckst die Bedeutung '
                              'auf und bewertest dich selbst mit Richtig oder '
                              'Falsch.'
                          : 'Ein Wort wird angezeigt. Du gibst Übersetzung '
                              'und mittlere Spalte selbst ein.',
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
            label: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text('Starten', style: TextStyle(fontSize: 17)),
            ),
          ),
        ],
      ),
    );
  }
}
