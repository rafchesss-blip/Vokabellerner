import 'package:flutter/material.dart';

import '../data/store.dart';
import '../models/vocab.dart';
import '../theme/app_theme.dart';
import '../utils/goals.dart';
import 'lesson_screen.dart';
import 'lesson_setup_screen.dart';

/// Tab „Lektionen": eigene Lektionen mit Fortschritt, neue anlegen.
///
/// Geübt wird über Übungslisten (Start → Übungslisten).
class LessonsTab extends StatelessWidget {
  const LessonsTab({super.key});

  static Future<void> createLesson(BuildContext context) async {
    final lesson = await Navigator.push<Lesson>(
      context,
      MaterialPageRoute(builder: (_) => const LessonSetupScreen()),
    );
    if (lesson == null) return;
    await Store.instance.addLesson(lesson);
    if (!context.mounted) return;
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => LessonScreen(lesson: lesson)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: Store.instance.revision,
      builder: (context, _, __) {
        final lessons = Store.instance.lessons;
        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          children: [
            if (lessons.isEmpty)
              Card(
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Text('📚', style: TextStyle(fontSize: 40)),
                      const SizedBox(height: 8),
                      const Text(
                        'Noch keine Lektionen',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Leg deine erste Lektion an. Die Vokabeln tippst du '
                        'selbst ein – oder du fotografierst die Seite aus '
                        'deinem Buch und lässt eine KI-App wie ChatGPT oder '
                        'Gemini sie ablesen.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: muted(context)),
                      ),
                    ],
                  ),
                ),
              ),
            for (final lesson in lessons) _LessonCard(lesson: lesson),
            const SizedBox(height: 4),
            FilledButton.icon(
              onPressed: () => createLesson(context),
              icon: const Icon(Icons.add),
              label: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text('Neue Lektion', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _LessonCard extends StatelessWidget {
  final Lesson lesson;

  const _LessonCard({required this.lesson});

  @override
  Widget build(BuildContext context) {
    final vocabs = lesson.allVocabs;
    final known = vocabs.where(isKnown).length;
    final share = vocabs.isEmpty ? 0.0 : known / vocabs.length;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => LessonScreen(lesson: lesson)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              _ProgressBadge(share: share),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lesson.name,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${lesson.language.isEmpty ? '' : '${lesson.language} · '}'
                      '${vocabs.length} Vokabeln · $known gewusst',
                      style: TextStyle(color: muted(context), fontSize: 13),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: faint(context)),
            ],
          ),
        ),
      ),
    );
  }
}

/// Kreis mit Prozentanzeige.
class _ProgressBadge extends StatelessWidget {
  final double share;

  const _ProgressBadge({required this.share});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: 48,
      height: 48,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: share,
            strokeWidth: 5,
            backgroundColor: scheme.surfaceContainerHighest,
            strokeCap: StrokeCap.round,
          ),
          Center(
            child: Text(
              '${(share * 100).round()}%',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
