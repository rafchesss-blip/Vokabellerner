import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/app_theme.dart';
import '../widgets/standard_app_bar.dart';

/// Zeigt die Datenschutzerklärung (`DATENSCHUTZ.md`) in der App.
class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: standardAppBar(context, 'Datenschutz', showSettings: false),
      body: FutureBuilder<String>(
        future: rootBundle.loadString('DATENSCHUTZ.md'),
        builder: (context, snap) {
          if (!snap.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              for (final line in snap.data!.split(RegExp(r'\r?\n\r?\n')))
                _block(context, line.trim()),
            ],
          );
        },
      ),
    );
  }

  /// Sehr einfaches Markdown: Überschriften, Aufzählungen, **fett**.
  Widget _block(BuildContext context, String block) {
    if (block.isEmpty) return const SizedBox.shrink();
    if (block.startsWith('# ')) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Text(block.substring(2),
            style: Theme.of(context).textTheme.headlineSmall),
      );
    }
    if (block.startsWith('## ')) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 12, 0, 8),
        child: Text(block.substring(3),
            style: Theme.of(context).textTheme.titleMedium),
      );
    }
    final items = block.startsWith('- ')
        ? block.split(RegExp(r'\n- ')).map((s) => s.replaceFirst('- ', ''))
        : [block];
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final item in items)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text.rich(
                TextSpan(children: [
                  if (block.startsWith('- ')) const TextSpan(text: '•  '),
                  ..._bold(item.replaceAll(RegExp(r'\s*\n\s*'), ' ')),
                ]),
                style: TextStyle(color: muted(context), height: 1.4),
              ),
            ),
        ],
      ),
    );
  }

  List<TextSpan> _bold(String text) {
    final parts = text.split('**');
    return [
      for (var i = 0; i < parts.length; i++)
        TextSpan(
          text: parts[i],
          style: i.isOdd ? const TextStyle(fontWeight: FontWeight.w700) : null,
        ),
    ];
  }
}
