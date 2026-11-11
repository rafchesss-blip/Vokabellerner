import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/store.dart';
import '../l10n/l10n.dart';
import '../platform/platform.dart';
import '../theme/app_theme.dart';

/// Einstellungen → „Daten & Sicherung": Export, Import, Zurücksetzen.
///
/// Alles liegt nur in diesem Browser bzw. auf diesem Gerät. Wer den
/// Browser-Speicher löscht oder das Gerät wechselt, braucht eine Sicherung.
class BackupSection extends StatelessWidget {
  const BackupSection({super.key});

  void _snack(BuildContext context, String text) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));

  Future<void> _export(BuildContext context) async {
    final json = Store.instance.toBackupJson();
    final now = DateTime.now();
    final date = '${now.year}-${now.month.toString().padLeft(2, '0')}-'
        '${now.day.toString().padLeft(2, '0')}';

    if (await saveTextFile('vokabellerner-sicherung-$date.json', json)) {
      if (context.mounted) _snack(context, context.l10n.backupExported);
      return;
    }
    await Clipboard.setData(ClipboardData(text: json));
    if (context.mounted) {
      _snack(context, context.l10n.backupCopied);
    }
  }

  Future<void> _import(BuildContext context) async {
    final text = supportsFiles ? await pickTextFile() : await _askPaste(context);
    if (text == null || text.trim().isEmpty || !context.mounted) return;

    final ok = await _confirm(
      context,
      title: context.l10n.backupRestoreTitle,
      message: context.l10n.backupRestoreMessage,
      action: context.l10n.backupRestoreAction,
    );
    if (!ok || !context.mounted) return;

    try {
      await Store.instance.restoreBackup(text);
      if (context.mounted) _snack(context, context.l10n.backupRestored);
    } on FormatException catch (e) {
      if (context.mounted) _snack(context, e.message);
    }
  }

  Future<void> _reset(BuildContext context) async {
    final ok = await _confirm(
      context,
      title: context.l10n.backupResetTitle,
      message: context.l10n.backupResetMessage,
      action: context.l10n.backupResetAction,
      destructive: true,
    );
    if (!ok || !context.mounted) return;
    await Store.instance.resetProgress();
    if (context.mounted) _snack(context, context.l10n.backupResetDone);
  }

  Future<String?> _askPaste(BuildContext context) {
    final controller = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(context.l10n.backupPasteTitle),
        content: TextField(
          controller: controller,
          maxLines: 8,
          decoration: const InputDecoration(hintText: '{ "app": "vokabellerner", … }'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(context.l10n.commonCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, controller.text),
            child: Text(context.l10n.commonNext),
          ),
        ],
      ),
    ).whenComplete(() {
      // Erst nach der Schließ-Animation freigeben.
      Future.delayed(const Duration(seconds: 1), controller.dispose);
    });
  }

  Future<bool> _confirm(
    BuildContext context, {
    required String title,
    required String message,
    required String action,
    bool destructive = false,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(context.l10n.commonCancel),
          ),
          FilledButton(
            style: destructive
                ? FilledButton.styleFrom(backgroundColor: Colors.red)
                : null,
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(action),
          ),
        ],
      ),
    );
    return result == true;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(l10n.backupTitle,
            style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 4),
        Text(
          l10n.backupHint,
          style: TextStyle(color: muted(context)),
        ),
        const SizedBox(height: 12),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.download_outlined),
                title: Text(l10n.backupExportTitle),
                subtitle: Text(supportsFiles
                    ? l10n.backupExportFile
                    : l10n.backupExportClipboard),
                onTap: () => _export(context),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.upload_outlined),
                title: Text(l10n.backupImportTitle),
                subtitle: Text(supportsFiles
                    ? l10n.backupImportFile
                    : l10n.backupImportPaste),
                onTap: () => _import(context),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.restart_alt, color: Colors.red),
                title: Text(l10n.backupResetTile),
                onTap: () => _reset(context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
