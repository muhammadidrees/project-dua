import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:duas_pwa/models/models.dart';
import 'package:duas_pwa/repository/repository.dart';
import 'package:equatable/equatable.dart';

part 'dua_event.dart';
part 'dua_state.dart';

class DuaBloc extends Bloc<DuaEvent, DuaState> {
  final DuaRepository duaRepository;
  DuaBloc({this.duaRepository}) : super(DuaLoading());

  @override
  Stream<DuaState> mapEventToState(
    DuaEvent event,
  ) async* {
    final currentState = state;
    if (event is DuaFetched) {
      try {
        if (currentState is DuaLoading) {
          final dua = await _fetchDua();
          yield DuaSuccess(dua: dua);
          return;
        }
        if (currentState is DuaSuccess) {
          final dua = await _fetchDua(currentDua: currentState.dua);
          yield DuaSuccess(dua: dua);
          return;
        }
      } catch (_) {
        yield DuaFailure();
        return;
      }
    }
  }

  /// Fetches a random Dua from the list of Duas
  Future<Dua> _fetchDua({Dua currentDua}) async {
    // get data from repository
    List<Dua> duaList = await duaRepository.get();
    // gererate random id to fetch a random Dua excluding the current Dua
    // between 0 to the length of list if current Dua is not provided use
    // the lenght of list as aurgument so Dua can be taken from the list
    // without exclusion
    int randomId = generateRandom(
        int.parse(currentDua?.id ?? duaList.length.toString()), duaList.length);
    // finally return the corresponding Dua
    return duaList[randomId];
  }

  /// generates a random number from 0 to [limit - 1]
  /// excluding [exclude]
  int generateRandom(int exclude, int limit) {
    int random;
    do {
      random = Random().nextInt(limit);
    } while (random == (exclude));
    return random;
  }
}
