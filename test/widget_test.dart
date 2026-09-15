import 'package:flutter_test/flutter_test.dart';

import 'package:vokabellerner/main.dart';
import 'package:vokabellerner/services/auth.dart';

void main() {
  testWidgets('Dashboard wird angezeigt', (WidgetTester tester) async {
    // Angemeldeten Benutzer simulieren.
    AuthService.instance.token = 'test-token';
    AuthService.instance.username = 'tester';
    AuthService.instance.revision.value++;

    await tester.pumpWidget(const VokabeltrainerApp());

    expect(find.text('Willkommen!'), findsOneWidget);
    expect(find.text('Lernen starten'), findsOneWidget);
  });
}
