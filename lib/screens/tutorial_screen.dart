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
      'Diese App hilft dir, Vokabeln in jeder Sprache zu lernen – mit '
          'Karteikarten, Tests und cleverer Wiederholung. Wische nach links '
          'oder tippe auf „Weiter", um alles kennenzulernen.',
    ),
    _TutorialPage(
      Icons.menu_book_outlined,
      'Lektion anlegen',
      'Im Tab „Lektionen" legst du eine Lektion an: Name, Sprache und was '
          'du lernen willst – Wort und Übersetzung, auf Wunsch Formen und '
          'bis zu drei eigene Felder wie Beispielsatz oder Merkhilfe.',
    ),
    _TutorialPage(
      Icons.document_scanner_outlined,
      'Vokabeln scannen',
      'Tippe die Vokabeln selbst ein – oder tippe auf „Scannen" und '
          'fotografiere die Liste aus deinem Buch. Eine KI-App wie ChatGPT '
          'oder Gemini liest sie ab. Kopiere ihre Antwort, komm zurück, '
          'fertig.',
    ),
    _TutorialPage(
      Icons.list_alt_outlined,
      'Übungslisten erstellen',
      'Tippe auf der Startseite auf „Übungslisten" und dann auf „Neue '
          'Liste". Gib der Liste einen Namen, optional das Datum deines '
          'Vokabeltests, und wähle die Vokabeln aus deinen Lektionen aus.',
    ),
    _TutorialPage(
      Icons.play_circle_outline,
      'Jeden Tag lernen',
      'Auf der Startseite steht unter „Heute", was aus deinen Listen '
          'gerade dran ist: fällige Wiederholungen zuerst, dazu bis zu 15 '
          "neue Vokabeln. Tippe auf „Los geht's\" zum Starten.",
    ),
    _TutorialPage(
      Icons.style_outlined,
      'Karteikarten',
      'Tippe auf die Karte, um sie umzudrehen, und bewerte dich ehrlich: '
          '„Nochmal", „Schwer", „Gut" oder „Leicht". Unter jedem Knopf '
          'steht, wann die Karte wiederkommt. Am PC: Leertaste zum '
          'Umdrehen, 1–4 zum Bewerten.',
    ),
    _TutorialPage(
      Icons.auto_awesome,
      'Clever wiederholen',
      'Die App fragt jede Vokabel genau dann ab, kurz bevor du sie '
          'vergessen würdest (Spaced Repetition mit FSRS, wie bei Anki). Gut '
          'gekonnte Wörter kommen seltener, schwierige öfter. Lerne jeden '
          'Tag ein bisschen – das hält deine 🔥 Lernserie am Leben.',
    ),
    _TutorialPage(
      Icons.event_outlined,
      'Vokabeltest im Blick',
      'Gib beim Erstellen einer Liste das Datum deines Tests an. Die App '
          'verteilt die neuen Vokabeln so auf die Tage, dass du am Tag VOR '
          'dem Test fertig bist – dort wird alles noch einmal wiederholt. '
          'Je näher der Test, desto öfter kommen die Vokabeln dran.',
    ),
    _TutorialPage(
      Icons.notifications_active_outlined,
      'Erinnerungen',
      'Die App erinnert dich bis zu 3-mal am '
          'Tag – mit den aktuellen Zahlen und nie nach 21 Uhr. Hast du für '
          'heute alles gelernt, ist Ruhe. Einstellen kannst du das unter '
          'Einstellungen → Erinnerungen.',
    ),
    _TutorialPage(
      Icons.edit_outlined,
      'Test-Modus',
      'Hier tippst du die Übersetzung und/oder die Formen selbst ein – auf '
          'Wunsch auch die eigenen Felder (Einstellungen). Beim Prüfen sind '
          'Groß-/Kleinschreibung und Artikel (der/die/das) egal.',
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
      Icons.save_outlined,
      'Deine Daten',
      'Alles wird nur auf diesem Gerät gespeichert – '
          'ohne Konto, ohne Internet. Mach in den Einstellungen ab und zu '
          'eine Sicherung. Damit kannst du auch auf ein anderes Gerät '
          'umziehen.',
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
