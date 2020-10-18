part of 'bloc.dart';


abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class GoogleAuthentication extends AuthenticationEvent {}

class EmailSignInAuthentication extends AuthenticationEvent {
  final AuthUser user;
  EmailSignInAuthentication({@required this.user});

  @override
  List<AuthUser> get props => [user];
}

class EmailSignUpAuthentication extends AuthenticationEvent {
  final AuthUser user;
  EmailSignUpAuthentication({@required this.user});

  @override
  List<AuthUser> get props => [user];
}

class SignOutAuthentication extends AuthenticationEvent {
  final bool out;
  SignOutAuthentication({@required this.out});

  @override
  List<bool> get props => [out];
}