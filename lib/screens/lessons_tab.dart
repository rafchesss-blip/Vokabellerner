import 'package:flutter/material.dart';

import '../data/store.dart';
import '../models/vocab.dart';
import '../theme/app_theme.dart';
import '../utils/goals.dart';
import '../widgets/standard_app_bar.dart';

/// Tab „Lektionen": Übersicht aller Lektionen mit Fortschritt.
///
/// Geübt wird über Übungslisten (Start → Übungslisten).
class LessonsTab extends StatelessWidget {
  const LessonsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: Store.instance.revision,
      builder: (context, _, __) {
        final lessons = Store.instance.lessons;
        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          children: [
            for (final lesson in lessons) _LessonCard(lesson: lesson),
            if (lessons.isEmpty)
              Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  'Noch keine Lektionen.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: muted(context)),
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
    final scheme = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => LessonDetailScreen(lesson: lesson)),
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
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            lesson.name,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        if (!lesson.isBuiltIn) ...[
                          const SizedBox(width: 8),
                          Icon(Icons.person_outline,
                              size: 16, color: scheme.primary),
                        ],
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${lesson.boxes.length} Kästen · ${vocabs.length} Vokabeln'
                      ' · $known gewusst',
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

/// Inhalt einer Lektion (nur ansehen).
class LessonDetailScreen extends StatelessWidget {
  final Lesson lesson;

  const LessonDetailScreen({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: Store.instance.revision,
      builder: (context, _, __) {
        // Nach dem Bearbeiten ist die Lektion ein neues Objekt.
        final current = Store.instance.lessons
                .where((l) => l.id == lesson.id)
                .firstOrNull ??
            lesson;

        return Scaffold(
          appBar: standardAppBar(context, current.name),
          body: ListView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            children: [
              if (current.isBuiltIn)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'Eingebaute Lektion – sie wird auf GitHub im Ordner '
                    '„lektionen“ gepflegt.',
                    style: TextStyle(color: muted(context), fontSize: 13),
                  ),
                ),
              for (final box in current.boxes) ...[
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 16, 4, 8),
                  child: Text(
                    box.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      for (final v in box.vocabs)
                        ListTile(
                          dense: true,
                          title: Text(
                            v.latin,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            v.hasMiddle
                                ? '${v.middleColumn} · ${v.german}'
                                : v.german,
                          ),
                          trailing: v.isNew
                              ? null
                              : Icon(
                                  isKnown(v)
                                      ? Icons.check_circle
                                      : Icons.radio_button_unchecked,
                                  size: 18,
                                  color: isKnown(v)
                                      ? Colors.green
                                      : faint(context),
                                ),
                        ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
