part of 'ayah_bloc.dart';

abstract class AyahEvent extends Equatable {
  const AyahEvent();
  @override
  List<Object> get props => [];
}

/// The only event our bloc will be looking is fetching of an
/// Ayah when we need one therefore we only have a single event
class AyahFetched extends AyahEvent {}
