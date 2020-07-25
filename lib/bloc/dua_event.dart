part of 'dua_bloc.dart';

abstract class DuaEvent extends Equatable {
  const DuaEvent();
  @override
  List<Object> get props => [];
}

/// The only event our bloc will be looking is fetching of an
/// Dua when we need one therefore we only have a single event
class DuaFetched extends DuaEvent {}
