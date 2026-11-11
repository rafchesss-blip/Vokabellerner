import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../l10n/l10n.dart';
import '../theme/app_theme.dart';

/// Kleines Tipp-Fenster mit „Nicht mehr anzeigen".
///
/// Liefert `true`, wenn es weitergehen soll (auch wenn der Tipp
/// ausgeblendet ist), `false` bei Abbruch (Tipp außerhalb des Fensters).
Future<bool> showHintOnce(
  BuildContext context, {
  required String id,
  required String emoji,
  required String title,
  required String text,
  String? button,
}) async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'hint_hidden_$id';
  if (prefs.getBool(key) ?? false) return true;
  if (!context.mounted) return false;

  final hide = await showDialog<bool>(
    context: context,
    builder: (_) => _HintDialog(
      emoji: emoji,
      title: title,
      text: text,
      button: button,
    ),
  );
  if (hide == null) return false;
  if (hide) await prefs.setBool(key, true);
  return true;
}

class _HintDialog extends StatefulWidget {
  final String emoji;
  final String title;
  final String text;
  /// Beschriftung des Knopfs, sonst „Weiter".
  final String? button;

  const _HintDialog({
    required this.emoji,
    required this.title,
    required this.text,
    required this.button,
  });

  @override
  State<_HintDialog> createState() => _HintDialogState();
}

class _HintDialogState extends State<_HintDialog> {
  bool _hide = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Text(widget.emoji, style: const TextStyle(fontSize: 36)),
      title: Text(widget.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(widget.text, style: TextStyle(color: muted(context))),
          const SizedBox(height: 12),
          CheckboxListTile(
            value: _hide,
            onChanged: (v) => setState(() => _hide = v ?? false),
            title: Text(context.l10n.hintDialogDontShowAgain),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
            dense: true,
          ),
        ],
      ),
      actions: [
        FilledButton(
          onPressed: () => Navigator.pop(context, _hide),
          child: Text(widget.button ?? context.l10n.commonNext),
        ),
      ],
    );
  }
}
