part of 'bloc.dart';

abstract class AuthenticationState extends Equatable {
  AuthenticationState();
  @override
  List<Object> get props => [];
}

class AuthenticationInit extends AuthenticationState {}

class AuthenticationSignIn extends AuthenticationState {
  final UserCredential user;
  AuthenticationSignIn(this.user);

  @override
  List<UserCredential> get props => [user];
}

/*class AuthenticationGoogle extends AuthenticationState {
  final UserCredential user;
  AuthenticationGoogle(this.user);

  @override
  List<UserCredential> get props => [user];
}

class AuthenticationSignInEmail extends AuthenticationState {
  final UserCredential user;
  AuthenticationSignInEmail(this.user);

  @override
  List<UserCredential> get props => [user];
}

class AuthenticationRegInEmail extends AuthenticationState {
  final UserCredential user;
  AuthenticationRegInEmail(this.user);

  @override
  List<UserCredential> get props => [user];
}*/

class AuthenticationSignOut extends AuthenticationState {
  final bool out;
  AuthenticationSignOut(this.out);

  @override
  List<bool> get props => [out];
}

class AuthenticationError extends AuthenticationState {
  final String message;
  AuthenticationError(this.message);

  @override
  List<String>  get props => [message];
}

class AuthenticationLoading extends AuthenticationState {
  @override
  List<Object> get props => [];
}