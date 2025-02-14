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

class AuthenticationIsSignIn extends AuthenticationState {
  final User user;
  AuthenticationIsSignIn(this.user);

  @override
  List<User> get props => [user];
}

class AuthenticationPhoneVerify extends AuthenticationState {
  final AuthPhone phone;
  AuthenticationPhoneVerify(this.phone);

  @override
  List<AuthPhone> get props => [phone];
}

class AuthenticationOtpVerify extends AuthenticationState {
  final PhoneAuthCredential phone;
  AuthenticationOtpVerify(this.phone);

  @override
  List<PhoneAuthCredential> get props => [phone];
}

class AuthenticationError extends AuthenticationState {
  final String message;
  AuthenticationError(this.message);

  @override
  List<String> get props => [message];
}

class AuthenticationLoading extends AuthenticationState {
  @override
  List<Object> get props => [];
}
