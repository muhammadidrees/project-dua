part of 'ayah_bloc.dart';

abstract class AyahState extends Equatable {
  const AyahState();
  @override
  List<Object> get props => [];
}

/// This is also the initial state of as we'll be fetching data
class AyahLoading extends AyahState {}

/// Represents if an error occurs while fetching the post
class AyahFailure extends AyahState {}

/// Represents the state when an ayah is successfully fetched
class AyahSuccess extends AyahState {
  final Ayah ayah;

  AyahSuccess({this.ayah});

  @override
  List<Object> get props => [ayah];
}
