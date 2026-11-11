import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/changelog.dart';
import '../theme/app_theme.dart';

const _seenKey = 'changelog_seen';

/// Glocke „Neu" oben rechts – nur im Browser und nur, solange es etwas
/// Ungelesenes gibt. Nach dem Öffnen und Schließen ist sie weg.
class ChangelogButton extends StatefulWidget {
  const ChangelogButton({super.key});

  @override
  State<ChangelogButton> createState() => _ChangelogButtonState();
}

class _ChangelogButtonState extends State<ChangelogButton> {
  List<ChangelogEntry> _unseen = const [];

  @override
  void initState() {
    super.initState();
    if (kIsWeb) _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final seen = prefs.getInt(_seenKey) ?? 0;
    if (!mounted) return;
    setState(() => _unseen = [
          for (final e in changelog)
            if (e.id > seen) e,
        ]);
  }

  Future<void> _open() async {
    final entries = _unseen;
    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (ctx) => _ChangelogSheet(entries: entries),
    );
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_seenKey, changelog.first.id);
    if (mounted) setState(() => _unseen = const []);
  }

  @override
  Widget build(BuildContext context) {
    if (_unseen.isEmpty) return const SizedBox.shrink();
    return IconButton(
      tooltip: 'Was ist neu?',
      onPressed: _open,
      icon: Badge.count(
        count: _unseen.length,
        child: const Icon(Icons.campaign_outlined),
      ),
    );
  }
}

class _ChangelogSheet extends StatelessWidget {
  final List<ChangelogEntry> entries;

  const _ChangelogSheet({required this.entries});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          children: [
            Text(
              'Was ist neu?',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            for (final e in entries)
              Card(
                margin: const EdgeInsets.only(bottom: 10),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(e.text, style: TextStyle(color: muted(context))),
                      const SizedBox(height: 6),
                      Text(
                        e.date,
                        style: TextStyle(color: faint(context), fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 4),
            FilledButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Alles klar!'),
            ),
          ],
        ),
      ),
    );
  }
}
