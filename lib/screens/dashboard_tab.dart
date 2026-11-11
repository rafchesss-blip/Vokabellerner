import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../data/store.dart';
import '../l10n/l10n.dart';
import '../models/settings.dart';
import '../models/vocab.dart';
import '../platform/platform.dart';
import '../theme/app_theme.dart';
import '../utils/goals.dart';
import '../utils/review_queue.dart';
import 'lessons_tab.dart';
import 'practice_lists_screen.dart';
import 'practice_screen.dart';
import 'tutorial_screen.dart';

/// Start-Tab: Begrüßung, Lernserie, „Heute" und Schnellzugriffe.
class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  /// Vokabeln für „Heute": alle aus den Übungslisten, deren Test noch
  /// nicht vorbei ist (ohne Doppelte).
  static List<Vocab> todayPool() {
    final store = Store.instance;
    return store.resolveVocabs(
      {for (final l in activeLists(store.practiceLists)) ...l.vocabIds},
    );
  }

  static String _greeting(AppLocalizations l) {
    final h = DateTime.now().hour;
    final name = Settings.instance.userName;
    final named = name.isNotEmpty;
    if (h < 5) {
      return named
          ? l.dashboardGreetingNightName(name)
          : l.dashboardGreetingNight;
    }
    if (h < 11) {
      return named
          ? l.dashboardGreetingMorningName(name)
          : l.dashboardGreetingMorning;
    }
    if (h < 18) {
      return named ? l.dashboardGreetingDayName(name) : l.dashboardGreetingDay;
    }
    return named
        ? l.dashboardGreetingEveningName(name)
        : l.dashboardGreetingEvening;
  }

  /// Lädt die APK herunter und erklärt, wie man sie installiert.
  static void _downloadApk(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        icon: const Text('📱', style: TextStyle(fontSize: 36)),
        title: const Text('Android-App installieren'),
        content: const Text(
          '1. Auf „Herunterladen" tippen.\n'
          '2. Die heruntergeladene Datei öffnen.\n'
          '3. Falls gefragt: Installieren aus dieser Quelle erlauben.\n\n'
          'Dein Lernstand aus dem Browser kommt nicht automatisch mit – '
          'übertrage ihn unter Einstellungen → Daten & Sicherung.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Abbrechen'),
          ),
          FilledButton.icon(
            onPressed: () {
              Navigator.pop(ctx);
              openUrl(apkUrl);
            },
            icon: const Icon(Icons.download),
            label: const Text('Herunterladen'),
          ),
        ],
      ),
    );
  }

  void _open(BuildContext context, Widget screen) =>
      Navigator.push(context, MaterialPageRoute(builder: (_) => screen));

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      // Auch bei neuen Einstellungen (z. B. Name in der Begrüßung).
      listenable: Listenable.merge([Store.instance.revision, Settings.revision]),
      builder: (context, _) {
        final l = context.l10n;
        final store = Store.instance;
        final pool = todayPool();
        final plan = planReview(pool, store.practiceLists);
        final streak = store.streak();
        final allVocabs = [for (final l in store.lessons) ...l.allVocabs];
        final known = allVocabs.where(isKnown).length;
        final exam = nextExamList(store.practiceLists);

        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          children: [
            _HeroCard(greeting: _greeting(l), streak: streak),
            if (exam != null) ...[
              const SizedBox(height: 16),
              _ExamCard(
                name: exam.name,
                exam: exam.dueDate!,
                onTap: () => _open(context, const PracticeListsScreen()),
              ),
            ],
            const SizedBox(height: 16),
            _TodayCard(
              plan: plan,
              reviewedToday: store.reviewsToday,
              hasLessons: store.lessons.isNotEmpty,
              hasLists: store.practiceLists.isNotEmpty,
              onStart: () => _open(context, PracticeScreen(vocabs: pool)),
              onCreateLesson: () => LessonsTab.createLesson(context),
              onCreateList: () => _open(context, const PracticeListsScreen()),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _StatTile(
                  icon: Icons.local_fire_department,
                  color: const Color(0xFFFB923C),
                  value: '$streak',
                  label: l.dashboardStreakLabel(streak),
                ),
                const SizedBox(width: 12),
                _StatTile(
                  icon: Icons.bolt,
                  color: Theme.of(context).colorScheme.primary,
                  value: '${store.reviewsToday}',
                  label: l.dashboardPracticedToday,
                ),
                const SizedBox(width: 12),
                _StatTile(
                  icon: Icons.check_circle,
                  color: const Color(0xFF34D399),
                  value: '$known',
                  label: l.dashboardKnownOf(allVocabs.length),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _NavTile(
              icon: Icons.list_alt,
              title: l.dashboardPracticeLists,
              subtitle: store.practiceLists.isEmpty
                  ? l.dashboardPracticeListsEmpty
                  : l.dashboardListCount(store.practiceLists.length),
              onTap: () => _open(context, const PracticeListsScreen()),
            ),
            if (kIsWeb)
              _NavTile(
                icon: Icons.android,
                title: 'Android-App herunterladen',
                subtitle: 'Mit Erinnerungen ans Lernen',
                onTap: () => _downloadApk(context),
              ),
            _NavTile(
              icon: Icons.help_outline,
              title: l.dashboardHelpTitle,
              subtitle: l.dashboardHelpSubtitle,
              onTap: () => _open(context, const TutorialScreen()),
            ),
          ],
        );
      },
    );
  }
}

class _HeroCard extends StatelessWidget {
  final String greeting;
  final int streak;

  const _HeroCard({required this.greeting, required this.streak});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l = context.l10n;
    final text = switch (streak) {
      0 => l.dashboardStreakNone,
      1 => l.dashboardStreakFirstDay,
      _ => l.dashboardStreakRun(streak),
    };

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 22, 20, 22),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [scheme.primary, scheme.tertiary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: scheme.primary.withValues(alpha: 0.35),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            greeting,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: scheme.onPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            text,
            style: TextStyle(
              fontSize: 15,
              color: scheme.onPrimary.withValues(alpha: 0.9),
            ),
          ),
        ],
      ),
    );
  }
}

/// „Heute": fällige und neue Vokabeln, großer Start-Knopf.
class _TodayCard extends StatelessWidget {
  final ReviewPlan plan;
  final int reviewedToday;
  final bool hasLessons;
  final bool hasLists;
  final VoidCallback onStart;
  final VoidCallback onCreateLesson;
  final VoidCallback onCreateList;

  const _TodayCard({
    required this.plan,
    required this.reviewedToday,
    required this.hasLessons,
    required this.hasLists,
    required this.onStart,
    required this.onCreateLesson,
    required this.onCreateList,
  });

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final scheme = Theme.of(context).colorScheme;
    final done = plan.isEmpty;

    if (!hasLists) {
      return Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Icon(Icons.list_alt, color: scheme.primary),
                  const SizedBox(width: 8),
                  Text(
                    l.dashboardGetStarted,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                hasLessons
                    ? l.dashboardNoListsHint
                    : l.dashboardNoLessonsHint,
                style: TextStyle(color: muted(context)),
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: hasLessons ? onCreateList : onCreateLesson,
                icon: const Icon(Icons.add),
                label: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Text(
                      hasLessons
                          ? l.dashboardCreateList
                          : l.dashboardCreateLesson,
                      style: const TextStyle(fontSize: 17)),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Icon(
                  done ? Icons.celebration : Icons.auto_awesome,
                  color: done ? const Color(0xFF34D399) : scheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  done ? l.dashboardAllDone : l.dashboardToday,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (done)
              Text(
                reviewedToday > 0
                    ? l.dashboardDoneReviewed(reviewedToday)
                    : l.dashboardNothingDue,
                style: TextStyle(color: muted(context)),
              )
            else ...[
              Row(
                children: [
                  _BigNumber(
                    value: plan.due.length,
                    label: l.dashboardDueLabel,
                    color: scheme.primary,
                  ),
                  _BigNumber(
                    value: plan.fresh.length,
                    label: l.dashboardNewLabel,
                    color: scheme.tertiary,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: onStart,
                icon: const Icon(Icons.play_arrow_rounded, size: 28),
                label: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Text(l.commonLetsGo,
                      style: const TextStyle(fontSize: 18)),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                l.dashboardFromLists,
                textAlign: TextAlign.center,
                style: TextStyle(color: faint(context), fontSize: 12),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _BigNumber extends StatelessWidget {
  final int value;
  final String label;
  final Color color;

  const _BigNumber({
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            '$value',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w800,
              color: color,
              height: 1.1,
            ),
          ),
          Text(label, style: TextStyle(color: muted(context))),
        ],
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String value;
  final String label;

  const _StatTile({
    required this.icon,
    required this.color,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
          child: Column(
            children: [
              Icon(icon, color: color),
              const SizedBox(height: 4),
              Text(
                value,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
              ),
              Text(
                label,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(color: muted(context), fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _NavTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.chevron_right, color: faint(context)),
        onTap: onTap,
      ),
    );
  }
}

/// Countdown zum nächsten Vokabeltest.
class _ExamCard extends StatelessWidget {
  final String name;
  final DateTime exam;
  final VoidCallback onTap;

  const _ExamCard({
    required this.name,
    required this.exam,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final days = DateTime(exam.year, exam.month, exam.day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;

    final l = context.l10n;
    final (emoji, title, text, color) = switch (days) {
      0 => (
          '🍀',
          l.dashboardExamToday(name),
          l.dashboardExamTodayText,
          const Color(0xFF34D399),
        ),
      1 => (
          '🚨',
          l.dashboardExamTomorrow(name),
          l.dashboardExamTomorrowText,
          const Color(0xFFE5484D),
        ),
      _ => (
          '🎯',
          l.dashboardExamInDays(name, days),
          days <= 3
              ? l.dashboardExamFinalSpurt(days - 1)
              : l.dashboardExamDaysLeft(days - 1),
          const Color(0xFFFB923C),
        ),
    };

    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border(left: BorderSide(color: color, width: 5)),
          ),
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
          child: Row(
            children: [
              Text(emoji, style: const TextStyle(fontSize: 30)),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(text, style: TextStyle(color: muted(context))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
