import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/main.dart';

void main() {
  testWidgets("When clicking once, the text will be hidden", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ToggleScreen(title: "Text that should be hidden")
      )
    );
    expect(find.text("Text that should be hidden"), findsOneWidget);

    await tester.tap(find.byType(FloatingActionButton));

    await tester.pump();

    expect(find.text("Text that should be hidden"), findsNothing);
  });
}