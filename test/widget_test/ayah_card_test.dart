import 'package:duas_pwa/screens/home_screen/ayah_card/ayah_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // check if the home screen shows title
  testWidgets('AyahCard shows ayah translation and reference',
      (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(
      MaterialApp(
        home: AyahCard(
          ayah: "رَبِّ",
          translation: "master",
          reference: "abc123",
        ),
      ),
    );

    // Create the Finders.
    final ayahFinder = find.text("رَبِّ");
    final translationFinder = find.text("master");
    final referenceFinder = find.text("abc123");

    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(ayahFinder, findsOneWidget);
    expect(translationFinder, findsOneWidget);
    expect(referenceFinder, findsOneWidget);
  });
}
