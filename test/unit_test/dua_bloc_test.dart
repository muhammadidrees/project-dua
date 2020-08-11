import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:duas_pwa/bloc/dua_bloc.dart';
import 'package:duas_pwa/repository/repository.dart';
import 'package:flutter_test/flutter_test.dart';

class MockDuaBloc extends MockBloc<DuaState> implements DuaBloc {}

void main() {
  group('whenListen', () {
    test("Let's mock the DuaBloc stream!", () async {
      // Create a mock instance
      final duaBloc = MockDuaBloc();

      // Stub the listen with a fake Stream
      whenListen(duaBloc,
          Stream.fromIterable([DuaLoading(), DuaSuccess(), DuaFailure()]));

      // Expect that the ThemeCubit instance emitted the stubbed
      // stream of states
      await expectLater(duaBloc,
          emitsInOrder(<DuaState>[DuaLoading(), DuaSuccess(), DuaFailure()]));

      // Assert that the current state is in sync with the stubbed stream.
      expect(duaBloc.state, equals(DuaFailure()));
    });
  });

  group('DuaBloc', () {
    blocTest(
      'emits [] when nothing is added',
      build: () => DuaBloc(),
      expect: [],
    );

    blocTest(
      'emits [DuaFailure] when fetched is called with no repository provided',
      build: () => DuaBloc()..add(DuaFetched()),
      expect: [DuaFailure()],
    );

    blocTest(
      'emits [DuaSuccess] when fetched is called with repository provided',
      build: () => DuaBloc(duaRepository: DuaRepository())..add(DuaFetched()),
      expect: [DuaFailure()],
    );
  });
}
