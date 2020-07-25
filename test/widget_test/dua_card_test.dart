import 'package:duas_pwa/models/models.dart';
import 'package:duas_pwa/screens/home_screen/dua_card/dua_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // check if the home screen shows title
  testWidgets('DuaCard shows Dua translation and reference',
      (WidgetTester tester) async {
    Dua dua = Dua(
      dua: "رَبِّ",
      translation: "master",
      reference: "abc123",
    );

    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(
      MaterialApp(
        home: DuaCard(
          dua: dua,
        ),
      ),
    );

    // Create the Finders.
    final duaFinder = find.text("رَبِّ");
    final translationFinder = find.text("master");
    final referenceFinder = find.text("abc123");

    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(duaFinder, findsOneWidget);
    expect(translationFinder, findsOneWidget);
    expect(referenceFinder, findsOneWidget);
  });
}
