import 'package:duas_pwa/bloc/dua_bloc.dart';
import 'package:duas_pwa/cubit/theme_cubit.dart';
import 'package:duas_pwa/repository/repository.dart';
import 'package:duas_pwa/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // create a basic homescreen widget for testing
  Widget homeScreen = MaterialApp(
    // as the bloc values are used in widget creation
    // wrapping with a bloc provider is essential
    home: MultiBlocProvider(
      providers: [
        // theme bloc
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(initialTheme: false),
        ),
        // Dua bloc
        BlocProvider<DuaBloc>(
          create: (context) =>
              DuaBloc(duaRepository: DuaRepository())..add(DuaFetched()),
        ),
      ],
      child: HomeScreen(title: 'T'),
    ),
  );
  // check if the home screen shows title
  testWidgets('HomeScreen has a title', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(homeScreen);

    // Create the Finders.
    final titleFinder = find.text('T');

    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
  });
}
