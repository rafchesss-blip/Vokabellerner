import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:vokabellerner/data/store.dart';
import 'package:vokabellerner/models/settings.dart';
import 'package:vokabellerner/main.dart';

void main() {
  testWidgets('Ohne Lektion fordert die Startseite zum Anlegen auf',
      (tester) async {
    SharedPreferences.setMockInitialValues({});
    await tester.runAsync(() => Store.instance.load());
    await tester.runAsync(() => Settings.instance.load());

    await tester.pumpWidget(const VokabeltrainerApp());
    await tester.pumpAndSettle();

    // Beim ersten Start: Sprache …
    await tester.tap(find.text('Deutsch'));
    await tester.pumpAndSettle();

    // … Einführung …
    expect(find.text('Willkommen beim Vokabeltrainer'), findsOneWidget);
    for (var i = 0; i < 4; i++) {
      await tester.tap(find.text('Weiter'));
      await tester.pumpAndSettle();
    }
    expect(find.text('Komplett kostenlos'), findsOneWidget);
    expect(find.textContaining('keine Werbung'), findsOneWidget);
    await tester.tap(find.text("Los geht's"));
    await tester.pumpAndSettle();

    // … dann der Name (freiwillig).
    expect(find.text('Willkommen!'), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'Rafael');
    await tester.tap(find.text('Speichern'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Rafael'), findsOneWidget);

    expect(find.text('Lektion anlegen'), findsOneWidget);
    expect(find.text("Los geht's"), findsNothing);
  });
}
