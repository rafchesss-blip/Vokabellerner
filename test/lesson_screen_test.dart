import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:vokabellerner/data/store.dart';
import 'package:vokabellerner/l10n/app_localizations.dart';
import 'package:vokabellerner/models/vocab.dart';
import 'package:vokabellerner/screens/lesson_screen.dart';
import 'package:vokabellerner/screens/lesson_setup_screen.dart';

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  testWidgets('Lektion anlegen: Sprache, Formen und Sonstiges', (tester) async {
    tester.view.physicalSize = const Size(1080, 3000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    Lesson? result;
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Builder(
        builder: (context) => TextButton(
          onPressed: () async => result = await Navigator.push<Lesson>(
            context,
            MaterialPageRoute(builder: (_) => const LessonSetupScreen()),
          ),
          child: const Text('neu'),
        ),
      ),
    ));
    await tester.tap(find.text('neu'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField).first, 'Unit 1');
    await tester.tap(find.text('Englisch'));
    await tester.tap(find.widgetWithText(CheckboxListTile, 'Formen'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(ActionChip, 'Beispielsatz'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Speichern'));
    await tester.pumpAndSettle();

    expect(result!.name, 'Unit 1');
    expect(result!.language, 'Englisch');
    expect(result!.hasForms, isTrue);
    expect(result!.allForms, isTrue);
    expect(result!.extraLabels, ['Beispielsatz']);
  });

  testWidgets('Vokabel selbst eingeben – mit allen Feldern der Lektion',
      (tester) async {
    await tester.runAsync(() => Store.instance.load());
    final lesson = Lesson(
      id: 'l',
      name: 'Unit 1',
      boxes: [],
      language: 'Englisch',
      hasForms: true,
      formKinds: {FormKind.verb},
      extraLabels: ['Beispielsatz'],
    );
    await tester.runAsync(() => Store.instance.addLesson(lesson));

    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: LessonScreen(lesson: lesson),
    ));
    await tester.tap(find.text('Selbst eingeben'));
    await tester.runAsync(() => Future<void>.delayed(Duration.zero));
    await tester.pumpAndSettle();
    // Beim ersten Mal ein kurzer Tipp.
    expect(find.text('Vokabeln eintippen'), findsOneWidget);
    await tester.tap(find.text('Weiter'));
    await tester.pumpAndSettle();

    final fields = find.descendant(
      of: find.byType(AlertDialog),
      matching: find.byType(TextField),
    );
    expect(fields, findsNWidgets(4));
    await tester.enterText(fields.at(0), 'to go');
    await tester.enterText(fields.at(1), 'gehen');
    await tester.enterText(fields.at(2), 'went, gone');
    await tester.enterText(fields.at(3), 'I go home.');
    await tester.tap(find.widgetWithText(FilledButton, 'Speichern'));
    await tester.runAsync(() => Future<void>.delayed(Duration.zero));
    await tester.pumpAndSettle();

    final v = lesson.allVocabs.single;
    expect(v.latin, 'to go');
    expect(v.middleColumn, 'went, gone');
    expect(v.extras.single.value, 'I go home.');
    expect(find.text('to go'), findsOneWidget);
  });
}
