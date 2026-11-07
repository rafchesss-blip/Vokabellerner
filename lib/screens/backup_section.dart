import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/store.dart';
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
      if (context.mounted) _snack(context, 'Sicherung wird heruntergeladen.');
      return;
    }
    await Clipboard.setData(ClipboardData(text: json));
    if (context.mounted) {
      _snack(context,
          'Sicherung in die Zwischenablage kopiert – z. B. in eine Notiz einfügen.');
    }
  }

  Future<void> _import(BuildContext context) async {
    final text = supportsFiles ? await pickTextFile() : await _askPaste(context);
    if (text == null || text.trim().isEmpty || !context.mounted) return;

    final ok = await _confirm(
      context,
      title: 'Sicherung wiederherstellen?',
      message: 'Dein aktueller Lernfortschritt, eigene Lektionen und '
          'Übungslisten werden durch die Sicherung ersetzt.',
      action: 'Wiederherstellen',
    );
    if (!ok || !context.mounted) return;

    try {
      await Store.instance.restoreBackup(text);
      if (context.mounted) _snack(context, 'Sicherung wiederhergestellt. ✅');
    } on FormatException catch (e) {
      if (context.mounted) _snack(context, e.message);
    }
  }

  Future<void> _reset(BuildContext context) async {
    final ok = await _confirm(
      context,
      title: 'Lernfortschritt zurücksetzen?',
      message: 'Alle Lernstufen und Wiederholungstermine werden gelöscht. '
          'Lektionen und Übungslisten bleiben erhalten.',
      action: 'Zurücksetzen',
      destructive: true,
    );
    if (!ok || !context.mounted) return;
    await Store.instance.resetProgress();
    if (context.mounted) _snack(context, 'Lernfortschritt zurückgesetzt.');
  }

  Future<String?> _askPaste(BuildContext context) {
    final controller = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Sicherung einfügen'),
        content: TextField(
          controller: controller,
          maxLines: 8,
          decoration: const InputDecoration(hintText: '{ "app": "vokabellerner", … }'),
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
            child: const Text('Abbrechen'),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Daten & Sicherung',
            style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 4),
        Text(
          'Dein Fortschritt wird nur in diesem Browser gespeichert. Mach ab '
          'und zu eine Sicherung – damit kannst du auch auf ein anderes '
          'Gerät umziehen.',
          style: TextStyle(color: muted(context)),
        ),
        const SizedBox(height: 12),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.download_outlined),
                title: const Text('Sicherung exportieren'),
                subtitle: const Text(supportsFiles
                    ? 'Als Datei herunterladen'
                    : 'In die Zwischenablage kopieren'),
                onTap: () => _export(context),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.upload_outlined),
                title: const Text('Sicherung importieren'),
                subtitle: const Text(supportsFiles
                    ? 'Sicherungsdatei auswählen'
                    : 'Gesicherten Text einfügen'),
                onTap: () => _import(context),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.restart_alt, color: Colors.red),
                title: const Text('Lernfortschritt zurücksetzen'),
                onTap: () => _reset(context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
