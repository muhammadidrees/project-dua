import 'package:duas_pwa/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // check if the home screen shows title
  testWidgets('HomeScreen has a title', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(MaterialApp(home: HomeScreen(title: 'T')));

    // Create the Finders.
    final titleFinder = find.text('T');

    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
  });
}
