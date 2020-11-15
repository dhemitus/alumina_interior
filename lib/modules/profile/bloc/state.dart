part of './bloc.dart';

abstract class ProfileState extends Equatable {
  ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);

  @override
  List<String> get props => [message];
}

class ProfileGeted extends ProfileState {
  final dynamic registered;
  ProfileGeted(this.registered);

  @override
  List<dynamic> get props => [registered];
}
