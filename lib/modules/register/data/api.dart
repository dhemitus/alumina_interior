import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterProvider {
  Future<bool> isRegistered(User user) async {
    //user check on server
    SharedPreferences _storage = await SharedPreferences.getInstance();
    return _storage.getBool('registered') ?? false;
  }
}