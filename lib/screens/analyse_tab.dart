import 'package:flutter/material.dart';

import '../data/store.dart';
import '../models/practice_list.dart';
import '../models/vocab.dart';
import '../theme/app_theme.dart';
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
        const SizedBox(height: 16),
        for (final v in vocabs)
          _VocabTile(vocab: v, onTap: () => _openDetail(v)),
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
