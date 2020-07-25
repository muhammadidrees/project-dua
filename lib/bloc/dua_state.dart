part of 'dua_bloc.dart';

abstract class DuaState extends Equatable {
  const DuaState();
  @override
  List<Object> get props => [];
}

/// This is also the initial state of as we'll be fetching data
class DuaLoading extends DuaState {}

/// Represents if an error occurs while fetching the post
class DuaFailure extends DuaState {}

/// Represents the state when an Dua is successfully fetched
class DuaSuccess extends DuaState {
  final Dua dua;

  DuaSuccess({this.dua});

  @override
  List<Object> get props => [dua];
}
