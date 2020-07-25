import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:duas_pwa/cubit/theme_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

// mock theme cubit
class MockThemeCubit extends MockBloc<bool> implements ThemeCubit {}

void main() {
  group('whenListen', () {
    test("Let's mock the ThemeCubit's stream!", () {
      // Create Mock CounterCubit Instance
      final cubit = MockThemeCubit();

      // Stub the listen with a fake Stream
      whenListen(cubit, Stream.fromIterable([true, false, true, false]));

      // Expect that the ThemeCubit instance emitted the stubbed
      // stream of states
      expectLater(cubit, emitsInOrder(<bool>[true, false, true, false]));
    });
  });

  group("ThemeCubit initial state", () {
    test("ThemeCubit() gives a false state i.e. initial theme is light", () {
      final cubit = ThemeCubit();

      expect(false, cubit.state);
    });

    test("ThemeCubit() takes constructor value as intial theme", () {
      final cubit = ThemeCubit(initialTheme: true);

      expect(true, cubit.state);
    });
  });

  group('ThemeCubit', () {
    blocTest<ThemeCubit, bool>(
      'emits [] when nothing is called',
      build: () => ThemeCubit(),
      expect: const <bool>[],
    );

    blocTest<ThemeCubit, bool>(
      'emits [false] when toggleTheme(false) is called',
      build: () => ThemeCubit(),
      act: (cubit) async => cubit.toggleTheme(false, test: true),
      expect: const <bool>[false],
    );

    blocTest<ThemeCubit, bool>(
      'emits [true] when toggleTheme(true) is called',
      build: () => ThemeCubit(),
      act: (cubit) async => cubit.toggleTheme(true, test: true),
      expect: const <bool>[true],
    );
  });
}
