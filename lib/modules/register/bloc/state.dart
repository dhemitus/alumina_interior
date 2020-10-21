part of './bloc.dart';

abstract class RegisterState extends Equatable {
  RegisterState();

  @override
  List<Object>  get props => [];
}

class RegisterInitial extends RegisterState {
}

class RegisterLoading extends RegisterState {
}

class RegisterCheck extends RegisterState {
  final bool registered;
  RegisterCheck(this.registered);

  @override
  List<bool>  get props => [registered];
}

class RegisterError extends RegisterState {
  final String message;
  RegisterError(this.message);

  @override
  List<String>  get props => [message];
}