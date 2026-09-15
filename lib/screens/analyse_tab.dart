import 'package:flutter/material.dart';

import '../data/store.dart';
import '../models/practice_list.dart';
import '../models/vocab.dart';
import '../theme/app_theme.dart';
import '../utils/goals.dart';
import '../utils/levels.dart';
import 'vocab_detail_sheet.dart';

/// Analyse-Tab: Übungsliste auswählen und die Lernstufen der Vokabeln sehen.
class AnalyseTab extends StatefulWidget {
  const AnalyseTab({super.key});

  @override
  State<AnalyseTab> createState() => _AnalyseTabState();
}

class _AnalyseTabState extends State<AnalyseTab> {
  PracticeList? _selected;

  @override
  void initState() {
    super.initState();
    final lists = Store.instance.practiceLists;
    if (lists.isNotEmpty) _selected = lists.first;
  }

  Future<void> _openDetail(Vocab vocab) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => VocabDetailSheet(vocab: vocab),
    );
    if (mounted) setState(() {}); // Sortierung nach Änderung aktualisieren
  }

  @override
  Widget build(BuildContext context) {
    final lists = Store.instance.practiceLists;

    if (lists.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.insights, size: 64, color: faint(context)),
              const SizedBox(height: 12),
              Text(
                'Noch keine Übungslisten',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 4),
              Text(
                'Erstelle eine Übungsliste, um hier deine Fortschritte zu sehen.',
                textAlign: TextAlign.center,
                style: TextStyle(color: muted(context)),
              ),
            ],
          ),
        ),
      );
    }

    final selected =
        lists.any((l) => l.id == _selected?.id) ? _selected! : lists.first;

    final vocabs = Store.instance.resolveVocabs(selected.vocabIds)
      ..sort((a, b) => b.level.compareTo(a.level));

    final good = vocabs.where((v) => v.level > 0).length;
    final neutral = vocabs.where((v) => v.level == 0).length;
    final weak = vocabs.where((v) => v.level < 0).length;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final l in lists)
              ChoiceChip(
                label: Text(l.name),
                selected: selected.id == l.id,
                onSelected: (_) => setState(() => _selected = l),
              ),
          ],
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 0,
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              '${vocabs.length} Vokabeln · $good gut · $neutral neutral · '
              '$weak schwach',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        if (selected.dueDate != null) ...[
          const SizedBox(height: 16),
          _GoalCard(vocabs: vocabs, dueDate: selected.dueDate!),
        ],
        const SizedBox(height: 16),
        for (final v in vocabs)
          _VocabTile(vocab: v, onTap: () => _openDetail(v)),
      ],
    );
  }
}

String _formatDate(DateTime d) =>
    '${d.day.toString().padLeft(2, '0')}.'
    '${d.month.toString().padLeft(2, '0')}.${d.year}';

/// Zeigt das Tages- und Gesamtziel einer Übungsliste an.
class _GoalCard extends StatelessWidget {
  final List<Vocab> vocabs;
  final DateTime dueDate;

  const _GoalCard({required this.vocabs, required this.dueDate});

  @override
  Widget build(BuildContext context) {
    final g = computeGoal(vocabs, dueDate);

    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.flag_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Ziel bis ${_formatDate(dueDate)}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _ProgressRow(
              label: 'Gesamtziel',
              valueText: '${g.known}/${g.total} Vokabeln gewusst',
              percent: g.overallPercent,
            ),
            const SizedBox(height: 12),
            _ProgressRow(
              label: 'Tagesziel',
              valueText: g.remaining == 0
                  ? 'alles geschafft'
                  : '${g.learnedToday}/${g.dailyTarget} heute gelernt',
              percent: g.remaining == 0 ? 100 : g.dailyPercent,
            ),
            const SizedBox(height: 8),
            Text(
              g.remaining == 0
                  ? 'Alle Vokabeln gewusst! 🎉'
                  : 'Noch ${g.daysRemaining} Tag(e) · ${g.remaining} Vokabeln offen.',
              style: TextStyle(color: muted(context), fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProgressRow extends StatelessWidget {
  final String label;
  final String valueText;
  final double percent;

  const _ProgressRow({
    required this.label,
    required this.valueText,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
            Text(
              valueText,
              style: TextStyle(color: muted(context), fontSize: 13),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: percent.clamp(0.0, 100.0) / 100,
            minHeight: 8,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          '${percent.toStringAsFixed(0)} %',
          style: TextStyle(color: muted(context), fontSize: 12),
        ),
      ],
    );
  }
}

class _VocabTile extends StatelessWidget {
  final Vocab vocab;
  final VoidCallback onTap;

  const _VocabTile({required this.vocab, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final color = levelColor(vocab.level);

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Text(
            levelText(vocab.level),
            style: TextStyle(
              color: onLevelColor(vocab.level),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          vocab.latin,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          vocab.hasMiddle
              ? '${vocab.german} · ${vocab.middleColumn}'
              : vocab.german,
        ),
        onTap: onTap,
      ),
    );
  }
}
