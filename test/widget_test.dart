import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:vokabellerner/data/builtin_lessons.dart';
import 'package:vokabellerner/data/store.dart';
import 'package:vokabellerner/main.dart';

void main() {
  testWidgets('Startseite zeigt „Heute" mit neuen Vokabeln', (tester) async {
    SharedPreferences.setMockInitialValues({});
    await tester.runAsync(() => Store.instance.load(builtIn: [
          builtInLessonFromText(
            'Lektion 1\n\nKasten 1\nservus | m | der Sklave\nibi | dort\n',
            'lektion-01',
          ),
        ]));

    await tester.pumpWidget(const VokabeltrainerApp());
    await tester.pumpAndSettle();

    expect(find.text('Heute'), findsOneWidget);
    expect(find.text("Los geht's"), findsOneWidget);
    expect(find.text('Aus allen Lektionen'), findsOneWidget);
  });
}
