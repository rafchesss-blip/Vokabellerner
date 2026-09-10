import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/standard_app_bar.dart';

/// Eine Seite des Tutorials.
class _TutorialPage {
  final IconData icon;
  final String title;
  final String text;

  const _TutorialPage(this.icon, this.title, this.text);
}

/// Tutorial: erklärt Schritt für Schritt, wie die App funktioniert.
class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  static const _pages = [
    _TutorialPage(
      Icons.school_outlined,
      'So funktioniert der Vokabeltrainer',
      'Diese App hilft dir, lateinische Vokabeln zu lernen – mit '
          'Übungslisten, Karteikarten und Tests. Wische nach links oder '
          'tippe auf „Weiter", um alles kennenzulernen.',
    ),
    _TutorialPage(
      Icons.list_alt_outlined,
      'Übungslisten erstellen',
      'Tippe auf „Lernen starten" und dann auf „Neue Liste". Gib der Liste '
          'einen Namen und wähle die Vokabeln aus – aufgeteilt in Lektionen, '
          'Kästen und einzelne Wörter. Bestätige mit „Fertig".',
    ),
    _TutorialPage(
      Icons.style_outlined,
      'Karteikarten-Modus',
      'Ein Wort wird angezeigt. Tippe auf „Bedeutung anzeigen", um die '
          'Lösung zu sehen, und bewerte dich ehrlich mit „Richtig" oder '
          '„Falsch". Über den Filter kannst du auch nur schwache Vokabeln '
          'üben.',
    ),
    _TutorialPage(
      Icons.edit_outlined,
      'Test-Modus',
      'Hier tippst du die Übersetzung und/oder die mittlere Spalte selbst '
          'ein. Beim Prüfen wird deine Antwort automatisch verglichen – '
          'Makronen (ā = a) und Artikel (der/die/das) sind dabei egal.',
    ),
    _TutorialPage(
      Icons.insights_outlined,
      'Lernfortschritt sehen',
      'Im Tab „Analyse" siehst du jede Vokabel mit ihrer Lernstufe: '
          '5 Grüntöne (gut), Grau (neutral) und 5 Rottöne (schwach). '
          'Tippe auf eine Vokabel für die Verlaufs-Grafik und zum manuellen '
          'Verbessern oder Verschlechtern mit +/−.',
    ),
    _TutorialPage(
      Icons.settings_outlined,
      'Einstellungen',
      'Oben rechts findest du die Einstellungen. Dort stellst du die '
          'Sprachrichtung ein (Latein → Deutsch oder umgekehrt) und den '
          'Abfrage-Modus im Test: nur Übersetzung, nur mittlere Spalte '
          'oder beides.',
    ),
    _TutorialPage(
      Icons.lightbulb_outline,
      'Noch ein paar Tipps',
      '• Alles wird nur auf deinem Gerät gespeichert – kein Internet nötig.\n'
          '• Der Home-Button (Haus-Symbol) bringt dich immer zurück zum '
          'Dashboard.\n'
          '• Deine Lernstände bleiben auch nach einem Update erhalten.',
    ),
  ];

  final PageController _controller = PageController();
  int _index = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _next() {
    _controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _prev() {
    _controller.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isLast = _index == _pages.length - 1;

    return Scaffold(
      appBar: standardAppBar(context, 'So funktioniert die App', showSettings: false),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: _pages.length,
              onPageChanged: (i) => setState(() => _index = i),
              itemBuilder: (context, i) => _buildPage(context, _pages[i]),
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: _index > 0
                        ? OutlinedButton(
                            onPressed: _prev,
                            child: const Text('Zurück'),
                          )
                        : null,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var i = 0; i < _pages.length; i++)
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            width: i == _index ? 10 : 8,
                            height: i == _index ? 10 : 8,
                            decoration: BoxDecoration(
                              color: i == _index
                                  ? colorScheme.primary
                                  : faint(context),
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: FilledButton(
                      onPressed: isLast ? () => Navigator.pop(context) : _next,
                      child: Text(isLast ? 'Fertig' : 'Weiter'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(BuildContext context, _TutorialPage page) {
    final colorScheme = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight - 48),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      page.icon,
                      size: 56,
                      color: colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 28),
                  Text(
                    page.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    page.text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      color: muted(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
