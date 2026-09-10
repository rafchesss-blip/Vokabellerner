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

    final ids = await Navigator.push<Set<String>>(
      context,
      MaterialPageRoute(
        builder: (_) => const SelectionScreen(confirmLabel: 'Fertig'),
      ),
    );
    if (ids == null || !mounted) return; // abgebrochen

    final list = PracticeList(id: newId(), name: name.trim(), vocabIds: ids.toList());
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
                    subtitle: Text('${list.vocabIds.length} Vokabeln'),
                    trailing: PopupMenuButton<String>(
                      tooltip: 'Optionen',
                      onSelected: (v) {
                        if (v == 'edit') _edit(list);
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
