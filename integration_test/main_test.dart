import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_tests/main.dart' as app;

void main() {

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("When clicking once, the text will be hidden", (WidgetTester tester) async {
    app.main();

    await tester.pumpAndSettle();

    expect(find.text("Text that should be hidden"), findsOneWidget);

    await tester.tap(find.byType(FloatingActionButton));

    await tester.pump();

    expect(find.text("Text that should be hidden"), findsNothing);
  });
}