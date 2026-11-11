import 'package:flutter/material.dart';

import '../l10n/l10n.dart';
import '../theme/app_theme.dart';

/// Fragt (optional) nach dem Namen. Liefert den Namen, `''` für „ohne
/// Namen" oder `null` bei Abbruch.
Future<String?> showNameDialog(
  BuildContext context, {
  String initial = '',
  bool firstStart = false,
}) =>
    showDialog<String>(
      context: context,
      barrierDismissible: !firstStart,
      builder: (_) => _NameDialog(initial: initial, firstStart: firstStart),
    );

class _NameDialog extends StatefulWidget {
  final String initial;
  final bool firstStart;

  const _NameDialog({required this.initial, required this.firstStart});

  @override
  State<_NameDialog> createState() => _NameDialogState();
}

class _NameDialogState extends State<_NameDialog> {
  late final _controller = TextEditingController(text: widget.initial);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _save() => Navigator.pop(context, _controller.text.trim());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Text('👋', style: TextStyle(fontSize: 36)),
      title: Text(widget.firstStart
          ? context.l10n.nameDialogWelcome
          : context.l10n.nameDialogTitle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.firstStart)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                context.l10n.nameDialogIntro,
                style: TextStyle(color: muted(context)),
              ),
            ),
          TextField(
            controller: _controller,
            autofocus: true,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _save(),
            decoration: InputDecoration(
              labelText: context.l10n.nameDialogLabel,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.lock_outline, size: 16, color: faint(context)),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  context.l10n.nameDialogLocalOnly,
                  style: TextStyle(color: faint(context), fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, widget.firstStart ? '' : null),
          child: Text(widget.firstStart
              ? context.l10n.commonSkip
              : context.l10n.commonCancel),
        ),
        FilledButton(
          onPressed: _save,
          child: Text(context.l10n.commonSave),
        ),
      ],
    );
  }
}
