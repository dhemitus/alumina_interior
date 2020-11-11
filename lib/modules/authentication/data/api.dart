import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:alumina/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  String _verify;
  AuthPhone _result;

  Future<UserCredential> googleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    print(googleAuth);
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final UserCredential _rest = await _auth.signInWithCredential(credential);
    return _rest;
  }

  Future<UserCredential> emailSignIn(AuthUser user) async {
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
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<UserCredential> emailSignUp(AuthUser user) async {
    try {
      final UserCredential rest = await _auth.createUserWithEmailAndPassword(
          email: user.username, password: user.password);
      print(rest);
      return rest;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<bool> signOut() async {
    bool _google = await _googleSignIn.isSignedIn();
    if (_google) await _googleSignIn.signOut();

    //    bool _facebook = await _facebookSignIn.isLoggedIn;
    //    if(_facebook) await _facebookSignIn.logOut();

    await _auth.signOut();
    return true;
  }

  Future<AuthPhone> verifyPhone(String phone) async {
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: phone,
          timeout: Duration(seconds: 60),
          verificationCompleted: (PhoneAuthCredential cred) => {
                _result = new AuthPhone(
                    message: 'verificationCompleted',
                    phone: phone,
                    result: true)
//            print('complete');
//                this._verify = 'verificationCompleted $phone'
              },
          verificationFailed: (FirebaseAuthException authException) => {
                _result = new AuthPhone(
                    message: 'verificationFailed', phone: phone, result: false)
//            print('failed');
//                this._verify = 'verificationFailed $phone'
              },
          codeSent: (String verId, int forceCodeResend) => {
//            print('sms sent $verId');
                _result = new AuthPhone(
                    message: 'codeSent',
                    phone: phone,
                    result: true,
                    verId: verId)

//                this._verify = 'codeSent $verId'
              },
          codeAutoRetrievalTimeout: (String verId) => {
                _result = new AuthPhone(
                    message: 'codeAutoRetrievalTimeout',
                    phone: phone,
                    result: false,
                    verId: verId)
//                this._verify = 'codeAutoRetrievalTimeout $verId'
              });
//      print(this._verify);

      return this._result;
    } catch (e) {
      print(e.toString());
      _result =
          new AuthPhone(message: e.toString(), phone: phone, result: false);
      this._verify = e.toString();
      return this._result;
    }
  }

  Future<PhoneAuthCredential> verifyOtp(
      String verificationId, String smsCode) async {
    return PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
  }

  Future<User> isSignedIn() async {
    User _user = await _auth.currentUser;
    return _user;
//    await FirebaseAuth.instance.signOut();
//    return currentUser != null;
  }

  Future<bool> setFirstSign(bool value) async {
    SharedPreferences _storage = await SharedPreferences.getInstance();
    return _storage.setBool('firstsign', value);
  }

  Future<bool> getFirstSign() async {
    SharedPreferences _storage = await SharedPreferences.getInstance();
    return _storage.getBool('firstsign') ?? false;
  }
}
