import 'package:flutter/material.dart';

import '../l10n/l10n.dart';
import '../theme/app_theme.dart';

/// Einführung beim ersten Öffnen: was die App kann, dass alles auf dem
/// Handy bleibt und dass sie kostenlos ist. Lässt sich später unter
/// Einstellungen → „Einführung ansehen" wieder öffnen.
class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroPage {
  final String emoji;
  final String title;
  final String text;

  const _IntroPage(this.emoji, this.title, this.text);
}

class _IntroScreenState extends State<IntroScreen> {
  static List<_IntroPage> _pages(AppLocalizations l) => [
        _IntroPage('👋', l.introWelcomeTitle, l.introWelcomeText),
        _IntroPage('📷', l.introScanTitle, l.introScanText),
        _IntroPage('🎯', l.introTestTitle, l.introTestText),
        _IntroPage('🔒', l.introPrivacyTitle, l.introPrivacyText),
        _IntroPage('💚', l.introFreeTitle, l.introFreeText),
      ];

  final _controller = PageController();
  int _index = 0;

  bool get _last => _index == _pages(context.l10n).length - 1;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _next() {
    if (_last) {
      Navigator.pop(context);
      return;
    }
    _controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final pages = _pages(context.l10n);

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: AnimatedOpacity(
                  opacity: _last ? 0 : 1,
                  duration: const Duration(milliseconds: 200),
                  child: TextButton(
                    onPressed: _last ? null : () => Navigator.pop(context),
                    child: Text(context.l10n.commonSkip),
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _controller,
                  onPageChanged: (i) => setState(() => _index = i),
                  children: [
                    for (final p in pages)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(p.emoji, style: const TextStyle(fontSize: 72)),
                            const SizedBox(height: 24),
                            Text(
                              p.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              p.text,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                height: 1.4,
                                color: muted(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0; i < pages.length; i++)
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: i == _index ? 22 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: i == _index
                            ? scheme.primary
                            : scheme.outlineVariant,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _next,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Text(
                        _last
                            ? context.l10n.commonLetsGo
                            : context.l10n.commonNext,
                        style: const TextStyle(fontSize: 17),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
