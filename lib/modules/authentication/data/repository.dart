import 'package:firebase_auth/firebase_auth.dart';

import 'package:alumina/models/models.dart';
import 'package:alumina/modules/modules.dart';

class AuthenticationRepository {
  AuthenticationProvider _api = AuthenticationProvider();

  Future<UserCredential> googleSignIn() => _api.googleSignIn();
  Future<UserCredential> emailSignIn(AuthUser user) => _api.emailSignIn(user);
  Future<UserCredential> emailSignUp(AuthUser user) => _api.emailSignUp(user);
  Future<bool> signOut() => _api.signOut();
  Future<User> isSignedIn() => _api.isSignedIn();
  Future<bool> setFirstSign(bool value) => _api.setFirstSign(value);
  Future<bool> getFirstSign() => _api.getFirstSign();
  Future<AuthPhone> verifyPhone(String phone) => _api.verifyPhone(phone);
}
