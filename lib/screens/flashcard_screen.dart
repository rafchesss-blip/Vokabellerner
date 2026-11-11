import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/store.dart';
import '../l10n/l10n.dart';
import '../models/settings.dart';
import '../models/vocab.dart';
import '../theme/app_theme.dart';
import '../utils/fsrs.dart';
import '../utils/review_queue.dart';
import '../widgets/session_summary.dart';
import '../widgets/standard_app_bar.dart';

/// Karteikarten-Modus: Wort anzeigen, Karte umdrehen, selbst bewerten
/// (Nochmal / Schwer / Gut / Leicht). Die Bewertung bestimmt per FSRS, wann
/// die Vokabel wieder abgefragt wird. „Nochmal"-Karten kommen in derselben
/// Sitzung noch einmal dran.
///
/// Tastatur: Leertaste/Enter = umdrehen, 1–4 = bewerten.
class FlashcardScreen extends StatefulWidget {
  final List<Vocab> vocabs;

  const FlashcardScreen({super.key, required this.vocabs});

  @override
  State<FlashcardScreen> createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  late List<Vocab> _queue;
  int _index = 0;
  bool _revealed = false;
  int _correct = 0;

  /// Anzahl unterschiedlicher Karten zu Beginn der Sitzung.
  late int _total;

  /// Karten, die in dieser Sitzung schon einmal bewertet wurden.
  final Set<String> _seen = {};

  /// Verhindert, dass ein schneller Doppeltipp zwei Karten bewertet.
  bool _busy = false;

  Vocab get _current => _queue[_index];

  bool get _showLatin =>
      Settings.instance.direction == LanguageDirection.latinToGerman;

  String get _front => _showLatin ? _current.latin : _current.german;
  String get _back => _showLatin ? _current.german : _current.latin;

  String get _wordLabel {
    final language = Store.instance.lessonOf(_current)?.language ?? '';
    return language.isEmpty ? context.l10n.flashcardWord : language;
  }

  String get _translationLabel =>
      Store.instance.lessonOf(_current)?.translationLanguage ??
      context.l10n.flashcardTranslation;

  @override
  void initState() {
    super.initState();
    _queue = List.of(widget.vocabs);
    _total = _queue.length;
  }

  void _reveal() {
    if (!_revealed) setState(() => _revealed = true);
  }

  Future<void> _rate(Rating rating) async {
    if (_busy || !_revealed) return;
    _busy = true;
    try {
      await _applyRating(rating);
    } finally {
      _busy = false;
    }
  }

  Future<void> _applyRating(Rating rating) async {
    final card = _current;
    final firstTry = _seen.add(card.id);
    if (firstTry && rating != Rating.again) _correct++;

    reviewWithExam(card, rating, Store.instance.practiceLists);
    Store.instance.logReview();
    if (rating == Rating.again) {
      // Ein paar Karten später erneut zeigen.
      final pos = (_index + 4).clamp(0, _queue.length);
      _queue.insert(pos, card);
    }
    await Store.instance.save();

    if (!mounted) return;

    if (_index + 1 >= _queue.length) {
      await showSessionSummary(
        context,
        correct: _correct,
        total: _total,
        onRestart: _restart,
      );
    } else {
      setState(() {
        _index++;
        _revealed = false;
      });
    }
  }

  void _restart() {
    setState(() {
      _queue = {for (final v in _queue) v.id: v}.values.toList()..shuffle();
      _index = 0;
      _revealed = false;
      _correct = 0;
      _seen.clear();
    });
  }

  KeyEventResult _onKey(FocusNode _, KeyEvent event) {
    if (event is! KeyDownEvent) return KeyEventResult.ignored;
    final key = event.logicalKey;
    if (!_revealed &&
        (key == LogicalKeyboardKey.space || key == LogicalKeyboardKey.enter)) {
      _reveal();
      return KeyEventResult.handled;
    }
    final rating = switch (key) {
      LogicalKeyboardKey.digit1 || LogicalKeyboardKey.numpad1 => Rating.again,
      LogicalKeyboardKey.digit2 || LogicalKeyboardKey.numpad2 => Rating.hard,
      LogicalKeyboardKey.digit3 || LogicalKeyboardKey.numpad3 => Rating.good,
      LogicalKeyboardKey.digit4 || LogicalKeyboardKey.numpad4 => Rating.easy,
      _ => null,
    };
    if (rating != null && _revealed) {
      _rate(rating);
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    final progress = _index / _queue.length;

    return Focus(
      autofocus: true,
      onKeyEvent: _onKey,
      child: Scaffold(
        appBar: standardAppBar(
            context, context.l10n.flashcardTitle(_index + 1, _queue.length)),
        body: Column(
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween(end: progress),
              duration: const Duration(milliseconds: 300),
              builder: (context, value, _) =>
                  LinearProgressIndicator(value: value, minHeight: 4),
            ),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 520),
                    child: GestureDetector(
                      onTap: _reveal,
                      child: _FlipCard(
                        // Neue Karte → ohne Animation wieder auf die Vorderseite.
                        key: ValueKey(_index),
                        flipped: _revealed,
                        front: _CardFace(
                          label: _showLatin ? _wordLabel : _translationLabel,
                          text: _front,
                          hint: context.l10n.flashcardTapToFlip,
                        ),
                        back: _CardFace(
                          label: _showLatin ? _translationLabel : _wordLabel,
                          text: _back,
                          subtitle: _front,
                          middle: _current.hasMiddle
                              ? _current.middleColumn
                              : null,
                          extras: _current.extras,
                          highlighted: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 560),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: _revealed
                        ? _RatingButtons(
                            key: const ValueKey('rate'),
                            vocab: _current,
                            onRate: _rate,
                          )
                        : SizedBox(
                            key: const ValueKey('reveal'),
                            width: double.infinity,
                            child: FilledButton.icon(
                              style: FilledButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                              ),
                              onPressed: _reveal,
                              icon: const Icon(Icons.flip),
                              label: Text(context.l10n.flashcardFlip),
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Karte, die sich beim Aufdecken um die Y-Achse dreht.
class _FlipCard extends StatelessWidget {
  final bool flipped;
  final Widget front;
  final Widget back;

  const _FlipCard({
    super.key,
    required this.flipped,
    required this.front,
    required this.back,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(end: flipped ? math.pi : 0),
      duration: const Duration(milliseconds: 420),
      curve: Curves.easeInOutCubic,
      builder: (context, angle, _) {
        final showBack = angle > math.pi / 2;
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.0012) // Perspektive
            ..rotateY(angle),
          child: showBack
              ? Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(math.pi),
                  child: back,
                )
              : front,
        );
      },
    );
  }
}

class _CardFace extends StatelessWidget {
  final String label;
  final String text;
  final String? subtitle;
  final String? middle;
  final List<VocabExtra> extras;
  final String? hint;
  final bool highlighted;

  const _CardFace({
    required this.label,
    required this.text,
    this.subtitle,
    this.middle,
    this.extras = const [],
    this.hint,
    this.highlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      constraints: const BoxConstraints(minHeight: 280),
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: highlighted ? scheme.primary : scheme.outline,
          width: highlighted ? 2 : 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: (highlighted ? scheme.primary : Colors.black)
                .withValues(alpha: highlighted ? 0.25 : 0.12),
            blurRadius: 30,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label.toUpperCase(),
            style: TextStyle(
              color: scheme.primary,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 34, fontWeight: FontWeight.w800),
          ),
          if (middle != null) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: scheme.primary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                middle!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: scheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
          for (final e in extras) ...[
            const SizedBox(height: 12),
            Text.rich(
              TextSpan(children: [
                TextSpan(
                  text: '${e.label}: ',
                  style: TextStyle(
                    color: muted(context),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(text: e.value),
              ]),
              textAlign: TextAlign.center,
            ),
          ],
          if (subtitle != null) ...[
            const SizedBox(height: 16),
            Text(subtitle!, style: TextStyle(color: muted(context))),
          ],
          if (hint != null) ...[
            const SizedBox(height: 28),
            Text(hint!, style: TextStyle(color: faint(context), fontSize: 13)),
          ],
        ],
      ),
    );
  }
}

/// Vier Bewertungs-Knöpfe mit Vorschau, wann die Karte wieder drankommt.
class _RatingButtons extends StatelessWidget {
  final Vocab vocab;
  final void Function(Rating) onRate;

  const _RatingButtons({super.key, required this.vocab, required this.onRate});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final now = DateTime.now();
    Widget button(Rating r, String label, Color color) {
      final next = Fsrs.previewInterval(vocab.srs, r, now);
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: color,
              foregroundColor: Colors.white,
              side: BorderSide.none,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            onPressed: () => onRate(r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(label,
                    style: const TextStyle(fontWeight: FontWeight.w800)),
                const SizedBox(height: 2),
                Text(
                  formatInterval(next),
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Row(
      children: [
        button(Rating.again, l.flashcardRateAgain, const Color(0xFFE5484D)),
        button(Rating.hard, l.flashcardRateHard, const Color(0xFFF76B15)),
        button(Rating.good, l.flashcardRateGood, const Color(0xFF30A46C)),
        button(Rating.easy, l.flashcardRateEasy, const Color(0xFF3E63DD)),
      ],
    );
  }
}
