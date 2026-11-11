import 'package:flutter/material.dart';

import '../l10n/l10n.dart';
import '../theme/app_theme.dart';

/// Auswertung am Ende einer Lern-Runde (Karteikarten oder Test).
///
/// [onRestart] startet die Runde neu; „Fertig" schließt die Lern-Ansicht.
Future<void> showSessionSummary(
  BuildContext context, {
  required int correct,
  required int total,
  required VoidCallback onRestart,
}) {
  final share = total == 0 ? 0.0 : correct / total;

  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (ctx) {
      final l = ctx.l10n;
      final (emoji, title) = switch (share) {
        >= 0.9 => ('🏆', l.sessionSummaryExcellent),
        >= 0.7 => ('🎉', l.sessionSummaryGreat),
        >= 0.4 => ('💪', l.sessionSummaryGood),
        _ => ('🌱', l.sessionSummaryKeepGoing),
      };
      final scheme = Theme.of(ctx).colorScheme;
      return AlertDialog(
        contentPadding: const EdgeInsets.fromLTRB(24, 28, 24, 8),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 48)),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 120,
              height: 120,
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: share),
                duration: const Duration(milliseconds: 900),
                curve: Curves.easeOutCubic,
                builder: (context, value, _) => Stack(
                  fit: StackFit.expand,
                  children: [
                    CircularProgressIndicator(
                      value: value,
                      strokeWidth: 10,
                      strokeCap: StrokeCap.round,
                      backgroundColor: scheme.surfaceContainerHighest,
                    ),
                    Center(
                      child: Text(
                        '${(value * 100).round()}%',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              l.sessionSummaryScore(correct, total),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Text(
              l.sessionSummaryScheduled,
              textAlign: TextAlign.center,
              style: TextStyle(color: muted(ctx), fontSize: 13),
            ),
          ],
        ),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              onRestart();
            },
            child: Text(l.sessionSummaryRestart),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pop(context);
            },
            child: Text(l.commonDone),
          ),
        ],
      );
    },
  );
}
