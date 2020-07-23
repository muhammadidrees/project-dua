import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:duas_pwa/models/models.dart';
import 'package:duas_pwa/repository/repository.dart';
import 'package:equatable/equatable.dart';

part 'ayah_event.dart';
part 'ayah_state.dart';

class AyahBloc extends Bloc<AyahEvent, AyahState> {
  final AyahRepository ayahRepository;
  AyahBloc({this.ayahRepository}) : super(AyahLoading());

  @override
  Stream<AyahState> mapEventToState(
    AyahEvent event,
  ) async* {
    final currentState = state;
    if (event is AyahFetched) {
      try {
        if (currentState is AyahLoading) {
          final ayah = await _fetchAyah();
          yield AyahSuccess(ayah: ayah);
          return;
        }
        if (currentState is AyahSuccess) {
          final ayah = await _fetchAyah(currentAyah: currentState.ayah);
          yield AyahSuccess(ayah: ayah);
        }
      } catch (_) {
        yield AyahFailure();
      }
    }
  }

  /// Fetches a random ayah from the list of ayahs
  Future<Ayah> _fetchAyah({Ayah currentAyah}) async {
    // get data from repository
    List<Ayah> ayahList = await ayahRepository.get();
    // gererate random id to fetch a random ayah excluding the current ayah
    // between 0 to the length of list
    int randomId = generateRandom(int.parse(currentAyah?.id), ayahList.length);
    // finally return the corresponding ayah
    return ayahList[randomId];
  }

  /// generates a random number from 0 to [limit - 1]
  /// excluding [exclude]
  int generateRandom(int exclude, int limit) {
    int random;
    do {
      random = Random().nextInt(limit);
    } while (random == (exclude ?? limit));
    return random;
  }
}
