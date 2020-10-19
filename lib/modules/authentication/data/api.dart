import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:alumina/models/models.dart';

class AuthenticationProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserCredential> googleSignIn () async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    print(googleAuth);
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final UserCredential _rest = await _auth.signInWithCredential(credential);
    return _rest;
  }

  Future<UserCredential> emailSignIn (AuthUser user) async {
//    print(user);
    try {
      final UserCredential _rest = await _auth.signInWithEmailAndPassword(
        email: user.username,
        password: user.password,
      );
  //    print(rest.user);
      return _rest;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<UserCredential> emailSignUp (AuthUser user) async {
    try {
      final UserCredential rest = await _auth.createUserWithEmailAndPassword(
          email: user.username, password: user.password);
      return rest;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {

    }
  }

  Future<bool> signOut() async {
    bool _google = await _googleSignIn.isSignedIn();
    if(_google) await _googleSignIn.signOut();

    //    bool _facebook = await _facebookSignIn.isLoggedIn;
    //    if(_facebook) await _facebookSignIn.logOut();

    await _auth.signOut();
    return true;
  }

  Future<User> isSignedIn() async {
    User _user = await _auth.currentUser;
    return _user;
//    await FirebaseAuth.instance.signOut();
//    return currentUser != null;
  }
}