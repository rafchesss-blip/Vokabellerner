import 'package:flutter/material.dart';

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
  static const _pages = [
    _IntroPage(
      '👋',
      'Willkommen beim Vokabeltrainer',
      'Lerne Vokabeln in jeder Sprache – mit Karteikarten, Tests und '
          'cleverer Wiederholung. Jede Vokabel kommt genau dann wieder, '
          'kurz bevor du sie vergessen würdest.',
    ),
    _IntroPage(
      '📷',
      'Eintippen oder scannen',
      'Leg Lektionen an und tippe die Vokabeln ein. Oder fotografiere die '
          'Liste aus deinem Buch: Eine KI-App wie ChatGPT oder Gemini liest '
          'sie für dich ab.',
    ),
    _IntroPage(
      '🎯',
      'Bereit für den Test',
      'Gib das Datum deines Vokabeltests an. Die App verteilt die Vokabeln '
          'auf die Tage davor und erinnert dich ans Lernen – nie nach '
          '21 Uhr.',
    ),
    _IntroPage(
      '🔒',
      'Alles bleibt auf deinem Handy',
      'Kein Konto, keine Cloud: Deine Lektionen und dein Lernstand werden '
          'nirgends im Internet gespeichert. Nur wenn du scannst, geht das '
          'Foto an die KI-App, die du selbst auswählst.',
    ),
    _IntroPage(
      '💚',
      'Komplett kostenlos',
      'Ich verdiene mit dieser App nichts: keine Werbung, keine '
          'In-App-Käufe, kein Abo. Sie ist einfach zum Lernen da.',
    ),
  ];

  final _controller = PageController();
  int _index = 0;

  bool get _last => _index == _pages.length - 1;

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
                    child: const Text('Überspringen'),
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _controller,
                  onPageChanged: (i) => setState(() => _index = i),
                  children: [
                    for (final p in _pages)
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
                  for (var i = 0; i < _pages.length; i++)
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
                        _last ? "Los geht's" : 'Weiter',
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
