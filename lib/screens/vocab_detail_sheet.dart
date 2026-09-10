import 'package:flutter/material.dart';

import '../data/store.dart';
import '../models/vocab.dart';
import '../theme/app_theme.dart';
import '../utils/levels.dart';

/// Detail-Ansicht einer Vokabel: Lernstufe, Verlauf-Grafik und +/−.
class VocabDetailSheet extends StatefulWidget {
  final Vocab vocab;

  const VocabDetailSheet({super.key, required this.vocab});

  @override
  State<VocabDetailSheet> createState() => _VocabDetailSheetState();
}

class _VocabDetailSheetState extends State<VocabDetailSheet> {
  void _adjust(int delta) {
    setState(() => widget.vocab.adjustLevel(delta));
    Store.instance.save();
  }

  @override
  Widget build(BuildContext context) {
    final vocab = widget.vocab;
    final color = levelColor(vocab.level);
    final levels = [for (final e in vocab.history) e.level];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: faint(context),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              vocab.latin,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              vocab.hasMiddle
                  ? '${vocab.german} · ${vocab.middleColumn}'
                  : vocab.german,
              textAlign: TextAlign.center,
              style: TextStyle(color: muted(context)),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: color,
                  child: Text(
                    levelText(vocab.level),
                    style: TextStyle(
                      color: onLevelColor(vocab.level),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  levelLabel(vocab.level),
                  style: TextStyle(color: color, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (levels.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Noch keine Verläufe vorhanden.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: muted(context)),
                ),
              )
            else
              SizedBox(height: 140, child: _LevelChart(levels: levels)),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red,
                      side: const BorderSide(color: Colors.red),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () => _adjust(-1),
                    icon: const Icon(Icons.remove),
                    label: const Text('Schlechter'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () => _adjust(1),
                    icon: const Icon(Icons.add),
                    label: const Text('Besser'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Einfache Liniengrafik des Stufen-Verlaufs.
class _LevelChart extends StatelessWidget {
  final List<int> levels;

  const _LevelChart({required this.levels});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(double.infinity, 140),
      painter: _LevelChartPainter(
        levels,
        Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

class _LevelChartPainter extends CustomPainter {
  final List<int> levels;
  final Color lineColor;

  _LevelChartPainter(this.levels, this.lineColor);

  @override
  void paint(Canvas canvas, Size size) {
    // Nulllinie (neutral)
    final zeroY = _yFor(0, size);
    canvas.drawLine(
      Offset(0, zeroY),
      Offset(size.width, zeroY),
      Paint()
        ..color = Colors.grey.shade400
        ..strokeWidth = 1,
    );

    if (levels.isEmpty) return;

    final points = <Offset>[];
    for (var i = 0; i < levels.length; i++) {
      final x = levels.length == 1
          ? size.width / 2
          : i / (levels.length - 1) * size.width;
      points.add(Offset(x, _yFor(levels[i], size)));
    }

    final linePaint = Paint()
      ..color = lineColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    if (points.length > 1) {
      final path = Path()..moveTo(points.first.dx, points.first.dy);
      for (final p in points.skip(1)) {
        path.lineTo(p.dx, p.dy);
      }
      canvas.drawPath(path, linePaint);
    }

    final dotPaint = Paint()..color = lineColor;
    for (final p in points) {
      canvas.drawCircle(p, 4, dotPaint);
    }
  }

  double _yFor(int level, Size size) {
    const min = -5.0;
    const max = 5.0;
    final t = (level - min) / (max - min); // 0..1
    const pad = 10.0;
    return pad + (1 - t) * (size.height - 2 * pad);
  }

  @override
  bool shouldRepaint(covariant _LevelChartPainter oldDelegate) =>
      oldDelegate.levels != levels || oldDelegate.lineColor != lineColor;
}
