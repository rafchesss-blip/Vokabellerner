import 'package:flutter/material.dart';

import '../data/store.dart';
import '../models/practice_list.dart';
import '../models/vocab.dart';
import '../theme/app_theme.dart';
import '../widgets/standard_app_bar.dart';
import 'practice_screen.dart';
import 'selection_screen.dart';

/// „Deine Übungslisten": Listen erstellen, üben, bearbeiten und löschen.
class PracticeListsScreen extends StatefulWidget {
  const PracticeListsScreen({super.key});

  @override
  State<PracticeListsScreen> createState() => _PracticeListsScreenState();
}

class _PracticeListsScreenState extends State<PracticeListsScreen> {
  Future<void> _createList() async {
    final name = await _askName();
    if (name == null || name.trim().isEmpty) return;
    if (!mounted) return;

    final dueDate = await _askDueDate();
    if (!mounted) return;

    final ids = await Navigator.push<Set<String>>(
      context,
      MaterialPageRoute(
        builder: (_) => const SelectionScreen(confirmLabel: 'Fertig'),
      ),
    );
    if (ids == null || !mounted) return; // abgebrochen

    final list = PracticeList(
      id: newId(),
      name: name.trim(),
      vocabIds: ids.toList(),
      dueDate: dueDate,
    );
    Store.instance.practiceLists.add(list);
    await Store.instance.save();
    if (mounted) setState(() {});
  }

  Future<String?> _askName() async {
    final controller = TextEditingController();
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Neue Übungsliste'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(
            labelText: 'Name der Liste',
            hintText: 'z. B. Vokabeltest 1',
          ),
          onSubmitted: (s) => Navigator.pop(ctx, s),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Abbrechen'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, controller.text),
            child: const Text('Weiter'),
          ),
        ],
      ),
    );
    controller.dispose();
    return result;
  }

  String _formatDate(DateTime d) =>
      '${d.day.toString().padLeft(2, '0')}.'
      '${d.month.toString().padLeft(2, '0')}.${d.year}';

  /// Fragt ein optionales Zieldatum ab.
  ///
  /// Liefert `null`, wenn kein Datum gewählt wurde (übersprungen bzw.
  /// entfernt). [initial] wird beim Ändern eines bestehenden Datums gesetzt.
  Future<DateTime?> _askDueDate({DateTime? initial}) async {
    DateTime? picked = initial;
    final result = await showDialog<DateTime?>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: Text(
            initial == null
                ? 'Bis wann musst du sie können?'
                : 'Zieldatum ändern',
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Lege ein Zieldatum fest (optional). In der Analyse siehst '
                'du dann dein Tages- und Gesamtziel.',
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  OutlinedButton.icon(
                    icon: const Icon(Icons.event),
                    label: const Text('Datum wählen'),
                    onPressed: () async {
                      final now = DateTime.now();
                      final date = await showDatePicker(
                        context: ctx,
                        initialDate:
                            picked ?? now.add(const Duration(days: 7)),
                        firstDate: now.subtract(const Duration(days: 1)),
                        lastDate: now.add(const Duration(days: 3650)),
                      );
                      if (date != null) {
                        setDialogState(() => picked = date);
                      }
                    },
                  ),
                  if (picked != null) ...[
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        _formatDate(picked!),
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text(initial == null ? 'Überspringen' : 'Entfernen'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(ctx, picked),
              child: const Text('Fertig'),
            ),
          ],
        ),
      ),
    );
    return result;
  }

  Future<void> _editDueDate(PracticeList list) async {
    final dueDate = await _askDueDate(initial: list.dueDate);
    if (!mounted) return;
    list.dueDate = dueDate;
    await Store.instance.save();
    if (mounted) setState(() {});
  }

  Future<void> _edit(PracticeList list) async {
    final ids = await Navigator.push<Set<String>>(
      context,
      MaterialPageRoute(
        builder: (_) => SelectionScreen(
          initialSelectedIds: list.vocabIds.toSet(),
          confirmLabel: 'Fertig',
        ),
      ),
    );
    if (ids == null || !mounted) return;

    list.vocabIds = ids.toList();
    await Store.instance.save();
    if (mounted) setState(() {});
  }

  Future<void> _delete(PracticeList list) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('„${list.name}" löschen?'),
        content: const Text('Die Übungsliste wird entfernt.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Abbrechen'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Löschen'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    Store.instance.practiceLists.removeWhere((l) => l.id == list.id);
    await Store.instance.save();
    if (mounted) setState(() {});
  }

  void _practice(PracticeList list) {
    final vocabs = Store.instance.resolveVocabs(list.vocabIds);
    if (vocabs.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Diese Liste enthält keine Vokabeln.')),
      );
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => PracticeScreen(vocabs: vocabs)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lists = Store.instance.practiceLists;

    return Scaffold(
      appBar: standardAppBar(context, 'Deine Übungslisten'),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _createList,
        icon: const Icon(Icons.add),
        label: const Text('Neue Liste'),
      ),
      body: lists.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.folder_open,
                      size: 64, color: faint(context)),
                  const SizedBox(height: 12),
                  Text(
                    'Noch keine Übungslisten',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Erstelle deine erste Liste über den Button unten.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: muted(context)),
                  ),
                ],
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 88),
              itemCount: lists.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, i) {
                final list = lists[i];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      child: const Icon(Icons.book_outlined),
                    ),
                    title: Text(
                      list.name,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      list.dueDate == null
                          ? '${list.vocabIds.length} Vokabeln'
                          : '${list.vocabIds.length} Vokabeln · Ziel: '
                              '${_formatDate(list.dueDate!)}',
                    ),
                    trailing: PopupMenuButton<String>(
                      tooltip: 'Optionen',
                      onSelected: (v) {
                        if (v == 'edit') _edit(list);
                        if (v == 'dueDate') _editDueDate(list);
                        if (v == 'delete') _delete(list);
                      },
                      itemBuilder: (_) => const [
                        PopupMenuItem(
                          value: 'edit',
                          child: Row(
                            children: [
                              Icon(Icons.edit_outlined, size: 20),
                              SizedBox(width: 12),
                              Text('Bearbeiten'),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 'dueDate',
                          child: Row(
                            children: [
                              Icon(Icons.event_outlined, size: 20),
                              SizedBox(width: 12),
                              Text('Zieldatum ändern'),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 'delete',
                          child: Row(
                            children: [
                              Icon(Icons.delete_outline, size: 20),
                              SizedBox(width: 12),
                              Text('Löschen'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    onTap: () => _practice(list),
                  ),
                );
              },
            ),
    );
  }
}
