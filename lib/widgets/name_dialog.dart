import 'package:flutter/material.dart';

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
      title: Text(widget.firstStart ? 'Willkommen!' : 'Dein Name'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.firstStart)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                'Wie heißt du? Dann begrüßt dich die App mit Namen – auch in '
                'den Erinnerungen. Das ist freiwillig.',
                style: TextStyle(color: muted(context)),
              ),
            ),
          TextField(
            controller: _controller,
            autofocus: true,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _save(),
            decoration: const InputDecoration(
              labelText: 'Dein Name (optional)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.lock_outline, size: 16, color: faint(context)),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  'Dein Name wird nur auf diesem Handy gespeichert.',
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
          child: Text(widget.firstStart ? 'Überspringen' : 'Abbrechen'),
        ),
        FilledButton(
          onPressed: _save,
          child: const Text('Speichern'),
        ),
      ],
    );
  }
}
