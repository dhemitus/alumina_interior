part of 'bloc.dart';

abstract class AuthenticationEvent extends Equatable {
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

class PhoneVerifyAuthentication extends AuthenticationEvent {
  final String phone;
  PhoneVerifyAuthentication({@required this.phone});

  @override
  List<String> get props => [phone];
}

class OtpVerifyAuthentication extends AuthenticationEvent {
  final AuthPhone phone;
  OtpVerifyAuthentication({@required this.phone});

  @override
  List<AuthPhone> get props => [phone];
}

class SignOutAuthentication extends AuthenticationEvent {}

class IsSignInAuthentication extends AuthenticationEvent {}
