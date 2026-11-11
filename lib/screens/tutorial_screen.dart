import 'package:flutter/material.dart';

import '../l10n/l10n.dart';
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
  static List<_TutorialPage> _pages(AppLocalizations l) => [
        _TutorialPage(Icons.school_outlined, l.tutorialPage1Title, l.tutorialPage1Text),
        _TutorialPage(Icons.menu_book_outlined, l.tutorialPage2Title, l.tutorialPage2Text),
        _TutorialPage(Icons.document_scanner_outlined, l.tutorialPage3Title, l.tutorialPage3Text),
        _TutorialPage(Icons.list_alt_outlined, l.tutorialPage4Title, l.tutorialPage4Text),
        _TutorialPage(Icons.play_circle_outline, l.tutorialPage5Title, l.tutorialPage5Text),
        _TutorialPage(Icons.style_outlined, l.tutorialPage6Title, l.tutorialPage6Text),
        _TutorialPage(Icons.auto_awesome, l.tutorialPage7Title, l.tutorialPage7Text),
        _TutorialPage(Icons.event_outlined, l.tutorialPage8Title, l.tutorialPage8Text),
        _TutorialPage(Icons.notifications_active_outlined, l.tutorialPage9Title, l.tutorialPage9Text),
        _TutorialPage(Icons.edit_outlined, l.tutorialPage10Title, l.tutorialPage10Text),
        _TutorialPage(Icons.insights_outlined, l.tutorialPage11Title, l.tutorialPage11Text),
        _TutorialPage(Icons.save_outlined, l.tutorialPage12Title, l.tutorialPage12Text),
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
    final l10n = context.l10n;
    final pages = _pages(l10n);
    final isLast = _index == pages.length - 1;

    return Scaffold(
      appBar: standardAppBar(context, l10n.tutorialTitle, showSettings: false),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: pages.length,
              onPageChanged: (i) => setState(() => _index = i),
              itemBuilder: (context, i) => _buildPage(context, pages[i]),
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
                            child: Text(l10n.commonBack),
                          )
                        : null,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var i = 0; i < pages.length; i++)
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
                      child: Text(isLast ? l10n.commonDone : l10n.commonNext),
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
