import 'package:flutter/material.dart';

import '../data/store.dart';
import '../models/settings.dart';
import '../models/vocab.dart';
import '../theme/app_theme.dart';
import '../widgets/standard_app_bar.dart';

/// Karteikarten-Modus: Wort anzeigen, Bedeutung aufdecken, selbst
/// mit Richtig/Falsch bewerten (ohne Eingabe).
class FlashcardScreen extends StatefulWidget {
  final List<Vocab> vocabs;

  const FlashcardScreen({super.key, required this.vocabs});

  @override
  State<FlashcardScreen> createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  late final List<Vocab> _queue;
  int _index = 0;
  bool _revealed = false;
  int _correct = 0;

  Vocab get _current => _queue[_index];

  bool get _showLatin =>
      Settings.instance.direction == LanguageDirection.latinToGerman;

  String get _front => _showLatin ? _current.latin : _current.german;
  String get _back => _showLatin ? _current.german : _current.latin;

  @override
  void initState() {
    super.initState();
    _queue = List.of(widget.vocabs)..shuffle();
  }

  Future<void> _rate(bool correct) async {
    if (correct) {
      _current.markCorrect();
      _correct++;
    } else {
      _current.markWrong();
    }
    await Store.instance.save();

    if (!mounted) return;

    if (_index + 1 >= _queue.length) {
      _showSummary();
    } else {
      setState(() {
        _index++;
        _revealed = false;
      });
    }
  }

  void _restart() {
    Navigator.pop(context); // Dialog schließen
    setState(() {
      _queue.shuffle();
      _index = 0;
      _revealed = false;
      _correct = 0;
    });
  }

  void _showSummary() {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Fertig!'),
        content: Text(
          'Du hast $_correct von ${_queue.length} Karten richtig bewertet.',
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: standardAppBar(context, 'Karte ${_index + 1} / ${_queue.length}'),
      body: Column(
        children: [
          LinearProgressIndicator(value: (_index + 1) / _queue.length),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                      elevation: 0,
                      color: Theme.of(context).colorScheme.surfaceContainerHighest,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 48,
                        ),
                        child: Text(
                          _front,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    if (_revealed) ...[
                      Text(
                        'Bedeutung',
                        style: TextStyle(color: muted(context)),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _back,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (_current.hasMiddle) ...[
                        const SizedBox(height: 12),
                        Chip(
                          avatar: const Icon(Icons.category_outlined, size: 18),
                          label: Text(_current.middleColumn!),
                        ),
                      ],
                    ],
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: _revealed
                ? Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.red,
                            side: const BorderSide(color: Colors.red),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: () => _rate(false),
                          child: const Text('Falsch'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: () => _rate(true),
                          child: const Text('Richtig'),
                        ),
                      ),
                    ],
                  )
                : FilledButton.icon(
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () => setState(() => _revealed = true),
                    icon: const Icon(Icons.visibility_outlined),
                    label: const Text('Bedeutung anzeigen'),
                  ),
          ),
        ],
      ),
    );
  }
}
