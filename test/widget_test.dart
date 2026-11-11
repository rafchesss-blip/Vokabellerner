import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:vokabellerner/data/store.dart';
import 'package:vokabellerner/main.dart';

void main() {
  testWidgets('Ohne Lektion fordert die Startseite zum Anlegen auf',
      (tester) async {
    SharedPreferences.setMockInitialValues({});
    await tester.runAsync(() => Store.instance.load());

    await tester.pumpWidget(const VokabeltrainerApp());
    await tester.pumpAndSettle();

    expect(find.text('Lektion anlegen'), findsOneWidget);
    expect(find.text("Los geht's"), findsNothing);
  });
}
