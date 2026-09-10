import 'package:flutter_test/flutter_test.dart';

import 'package:vokabellerner/main.dart';

void main() {
  testWidgets('Dashboard wird angezeigt', (WidgetTester tester) async {
    await tester.pumpWidget(const VokabeltrainerApp());

    expect(find.text('Willkommen!'), findsOneWidget);
    expect(find.text('Lernen starten'), findsOneWidget);
  });
}
