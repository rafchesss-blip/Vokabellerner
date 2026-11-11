import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../data/store.dart';
import '../l10n/l10n.dart';
import '../models/practice_list.dart';
import '../models/vocab.dart';
import '../platform/platform.dart';
import '../services/notifications.dart';
import '../theme/app_theme.dart';
import '../utils/reminders.dart';
import '../utils/review_queue.dart';
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
  static const int _maxLists = 10;

  Future<void> _createList() async {
    if (Store.instance.lessons.every((l) => l.allVocabs.isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.l10n.practiceListsNeedLesson),
        ),
      );
      return;
    }
    if (Store.instance.practiceLists.length >= _maxLists) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.l10n.practiceListsLimit(_maxLists)),
        ),
      );
      return;
    }

    final name = await _askName();
    if (name == null || name.trim().isEmpty) return;
    if (!mounted) return;

    final dueDate = await _askDueDate();
    if (!mounted) return;

    final ids = await Navigator.push<Set<String>>(
      context,
      MaterialPageRoute(
        builder: (_) => SelectionScreen(confirmLabel: context.l10n.commonDone),
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
    if (!mounted) return;
    setState(() {});
    if (list.dueDate != null) await _offerReminders(list);
  }

  /// Fragt nach dem Anlegen, ob Erinnerungen eingetragen werden sollen.
  Future<void> _offerReminders(PracticeList list) async {
    if (!supportsFiles) return;
    final yes = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        icon: const Text('🔔', style: TextStyle(fontSize: 36)),
        title: const Text('Erinnerungen einrichten?'),
        content: const Text(
          'Ich trage dir für jeden Lerntag bis zum Test eine Erinnerung in '
          'deinen Kalender ein – mit Countdown, damit du nichts verpasst.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Nein, danke'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Ja, gerne!'),
          ),
        ],
      ),
    );
    if (yes == true && mounted) await _addReminders(list);
  }

  /// Erzeugt eine Kalenderdatei mit Erinnerungen für alle Lerntage.
  Future<void> _addReminders(PracticeList list) async {
    void snack(String text) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(text), duration: const Duration(seconds: 6)),
        );

    if (!supportsFiles) {
      snack('Erinnerungen gibt es nur in der Browser-Version.');
      return;
    }
    final time = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 16, minute: 0),
      helpText: 'Wann willst du jeden Tag lernen?',
    );
    if (time == null || !mounted) return;

    final newVocabs =
        Store.instance.resolveVocabs(list.vocabIds).where((v) => v.isNew);
    final reminders = planReminders(
      list,
      newVocabs: newVocabs.length,
      hour: time.hour,
      minute: time.minute,
    );
    if (reminders.isEmpty) {
      snack('Bis zum Test sind keine Lerntage mehr übrig.');
      return;
    }

    final ics = buildIcs(reminders, uidPrefix: list.id, url: appUrl());
    final safeName =
        list.name.replaceAll(RegExp(r'[^\w\-äöüÄÖÜß ]'), '').trim();
    await saveTextFile(
      'lernplan-${safeName.isEmpty ? 'vokabeln' : safeName}.ics',
      ics,
      mimeType: 'text/calendar',
    );
    if (mounted) {
      snack('Kalenderdatei geladen – öffne sie, um ${reminders.length} '
          'Erinnerungen einzutragen. 🔔');
    }
  }

  Future<String?> _askName() => showDialog<String>(
        context: context,
        builder: (_) => const _NameDialog(),
      );

  /// „ · noch 5 Tage", „ · morgen!", „ · heute!" oder „ · vorbei".
  String _countdown(AppLocalizations l, DateTime exam) {
    final now = DateTime.now();
    final days = DateTime(exam.year, exam.month, exam.day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;
    if (days < 0) return l.practiceListsCountdownPast;
    if (days == 0) return l.practiceListsCountdownToday;
    if (days == 1) return l.practiceListsCountdownTomorrow;
    return l.practiceListsCountdownDays(days);
  }

  String _formatDate(DateTime d) => DateFormat.yMd(appLanguageCode).format(d);

  /// Fragt ein optionales Zieldatum ab.
  ///
  /// Liefert `null`, wenn kein Datum gewählt wurde (übersprungen bzw.
  /// entfernt). [initial] wird beim Ändern eines bestehenden Datums gesetzt.
  Future<DateTime?> _askDueDate({DateTime? initial}) async {
    final l = context.l10n;
    DateTime? picked = initial;
    final result = await showDialog<DateTime?>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: Text(
            initial == null
                ? l.practiceListsDueDateTitle
                : l.practiceListsChangeDueDate,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l.practiceListsDueDateHint),
              const SizedBox(height: 16),
              Row(
                children: [
                  OutlinedButton.icon(
                    icon: const Icon(Icons.event),
                    label: Text(l.practiceListsPickDate),
                    onPressed: () async {
                      final now = DateTime.now();
                      // Frühestens morgen – dann ist heute der Lerntag.
                      final first = DateTime(now.year, now.month, now.day + 1);
                      final current = picked;
                      final date = await showDatePicker(
                        context: ctx,
                        initialDate: current != null && !current.isBefore(first)
                            ? current
                            : now.add(const Duration(days: 7)),
                        firstDate: first,
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
              child: Text(
                  initial == null ? l.commonSkip : l.practiceListsRemoveDate),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(ctx, picked),
              child: Text(l.commonDone),
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

  Future<void> _toggleNotify(PracticeList list) async {
    list.notify = !list.notify;
    await Store.instance.save();
    if (!mounted) return;
    setState(() {});
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(list.notify
          ? context.l10n.practiceListsNotifyOnSnack(list.name)
          : context.l10n.practiceListsNotifyOffSnack(list.name)),
    ));
  }

  Future<void> _edit(PracticeList list) async {
    final ids = await Navigator.push<Set<String>>(
      context,
      MaterialPageRoute(
        builder: (_) => SelectionScreen(
          initialSelectedIds: list.vocabIds.toSet(),
          confirmLabel: context.l10n.commonDone,
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
        title: Text(ctx.l10n.practiceListsDeleteTitle(list.name)),
        content: Text(ctx.l10n.practiceListsDeleteText),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(ctx.l10n.commonCancel),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(ctx.l10n.commonDelete),
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
        SnackBar(content: Text(context.l10n.practiceListsNoVocabs)),
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
    final l = context.l10n;
    final lists = Store.instance.practiceLists;

    return Scaffold(
      appBar: standardAppBar(context, l.practiceListsTitle),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _createList,
        icon: const Icon(Icons.add),
        label: Text(l.practiceListsNew),
      ),
      body: lists.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.folder_open, size: 64, color: faint(context)),
                  const SizedBox(height: 12),
                  Text(
                    l.practiceListsEmptyTitle,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    l.practiceListsEmptyText,
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
                      (list.dueDate == null
                              ? l.vocabCount(list.vocabIds.length)
                              : l.practiceListsSubtitleTest(
                                      l.vocabCount(list.vocabIds.length),
                                      _formatDate(list.dueDate!)) +
                                  _countdown(l, list.dueDate!)) +
                          (notificationsSupported && !list.notify
                              ? ' · 🔕'
                              : ''),
                    ),
                    trailing: PopupMenuButton<String>(
                      tooltip: l.commonOptions,
                      onSelected: (v) {
                        if (v == 'edit') _edit(list);
                        if (v == 'dueDate') _editDueDate(list);
                        if (v == 'remind') _addReminders(list);
                        if (v == 'notify') _toggleNotify(list);
                        if (v == 'delete') _delete(list);
                      },
                      itemBuilder: (_) => [
                        PopupMenuItem(
                          value: 'edit',
                          child: Row(
                            children: [
                              const Icon(Icons.edit_outlined, size: 20),
                              const SizedBox(width: 12),
                              Text(l.commonEdit),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 'dueDate',
                          child: Row(
                            children: [
                              const Icon(Icons.event_outlined, size: 20),
                              const SizedBox(width: 12),
                              Text(l.practiceListsChangeDueDate),
                            ],
                          ),
                        ),
                        if (list.dueDate != null &&
                            supportsFiles &&
                            !studyDeadline(list.dueDate!).isBefore(
                                DateTime.now()
                                    .subtract(const Duration(days: 1))))
                          const PopupMenuItem(
                            value: 'remind',
                            child: Row(
                              children: [
                                Icon(Icons.notifications_active_outlined,
                                    size: 20),
                                SizedBox(width: 12),
                                Text('Erinnerungen in Kalender'),
                              ],
                            ),
                          ),
                        if (notificationsSupported)
                          PopupMenuItem(
                            value: 'notify',
                            child: Row(
                              children: [
                                Icon(
                                    list.notify
                                        ? Icons.notifications_off_outlined
                                        : Icons.notifications_active_outlined,
                                    size: 20),
                                const SizedBox(width: 12),
                                Text(list.notify
                                    ? l.practiceListsNotifyDisable
                                    : l.practiceListsNotifyEnable),
                              ],
                            ),
                          ),
                        PopupMenuItem(
                          value: 'delete',
                          child: Row(
                            children: [
                              const Icon(Icons.delete_outline, size: 20),
                              const SizedBox(width: 12),
                              Text(l.commonDelete),
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

/// Dialog „Neue Übungsliste“ – besitzt seinen eigenen Controller, damit
/// dieser erst nach der Schließ-Animation freigegeben wird.
class _NameDialog extends StatefulWidget {
  const _NameDialog();

  @override
  State<_NameDialog> createState() => _NameDialogState();
}

class _NameDialogState extends State<_NameDialog> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return AlertDialog(
      title: Text(l.practiceListsNameDialogTitle),
      content: TextField(
        controller: _controller,
        autofocus: true,
        decoration: InputDecoration(
          labelText: l.practiceListsNameLabel,
          hintText: l.practiceListsNameHint,
        ),
        onSubmitted: (s) => Navigator.pop(context, s),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l.commonCancel),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(context, _controller.text),
          child: Text(l.commonNext),
        ),
      ],
    );
  }
}
