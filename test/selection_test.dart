import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:vokabellerner/data/store.dart';
import 'package:vokabellerner/models/vocab.dart';
import 'package:vokabellerner/screens/selection_screen.dart';

void main() {
  void setup() {
    Store.instance.lessons = [
      Lesson(id: 'l1', name: 'Lektion 18', boxes: [
        Box(id: 'b1', name: 'Kasten 1', vocabs: [
          Vocab(id: 'v1', latin: 'a', german: 'a'),
          Vocab(id: 'v2', latin: 'b', german: 'b'),
        ]),
        Box(id: 'b2', name: 'Kasten 2', vocabs: [
          Vocab(id: 'v3', latin: 'c', german: 'c'),
        ]),
      ]),
    ];
  }

  Future<void> openPicker(WidgetTester tester, Set<String> Function() read) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => Center(
            child: ElevatedButton(
              onPressed: () async {
                final r = await Navigator.push<Set<String>>(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SelectionScreen(confirmLabel: 'Fertig'),
                  ),
                );
                // Ergebnis in die Testvariable schreiben
                read().clear();
                read().addAll(r ?? const {});
              },
              child: const Text('öffnen'),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('öffnen'));
    await tester.pumpAndSettle();
  }

  testWidgets('Nur einen Kasten auswählen liefert nur dessen Vokabeln',
      (tester) async {
    setup();
    Set<String> result = {};
    await openPicker(tester, () => result);

    await tester.tap(find.text('Lektion 18'));
    await tester.pumpAndSettle();

    // Checkbox von Kasten 1 (2. Checkbox im Baum)
    await tester.tap(find.byType(Checkbox).at(1));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Fertig (2 Vokabeln)'));
    await tester.pumpAndSettle();

    expect(result, {'v1', 'v2'});
  });

  testWidgets('Nur eine Vokabel auswählen liefert nur diese',
      (tester) async {
    setup();
    Set<String> result = {};
    await openPicker(tester, () => result);

    await tester.tap(find.text('Lektion 18'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Kasten 1'));
    await tester.pumpAndSettle();

    // Erste Vokabel-Checkbox (3. Checkbox im Baum)
    await tester.tap(find.byType(Checkbox).at(2));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Fertig (1 Vokabeln)'));
    await tester.pumpAndSettle();

    expect(result, {'v1'});
  });
}
