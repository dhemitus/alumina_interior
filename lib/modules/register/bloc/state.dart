part of './bloc.dart';

abstract class RegisterState extends Equatable {
  RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterCheck extends RegisterState {
  final bool registered;
  RegisterCheck(this.registered);

  @override
  List<bool> get props => [registered];
}

class RegisterAdded extends RegisterState {
  final bool registered;
  RegisterAdded(this.registered);

  @override
  List<bool> get props => [registered];
}

/*class ProfileGeted extends RegisterState {
  final dynamic registered;
  ProfileGeted(this.registered);

  @override
  List<dynamic> get props => [registered];
}*/

class RegisterPictureSet extends RegisterState {
  final dynamic registered;
  RegisterPictureSet(this.registered);

  @override
  List<dynamic> get props => [registered];
}

class RegisterProfileSet extends RegisterState {
  final bool registered;
  RegisterProfileSet(this.registered);

  @override
  List<bool> get props => [registered];
}

class RegisterAddressSet extends RegisterState {
  final bool registered;
  RegisterAddressSet(this.registered);

  @override
  List<bool> get props => [registered];
}

class RegisterPhoneSet extends RegisterState {
  final bool registered;
  RegisterPhoneSet(this.registered);

  @override
  List<bool> get props => [registered];
}

class RegisterError extends RegisterState {
  final String message;
  RegisterError(this.message);

  @override
  List<String> get props => [message];
}
