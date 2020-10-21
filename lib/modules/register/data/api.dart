import 'package:shared_preferences/shared_preferences.dart';

class RegisterProvider {
  Future<bool> isRegistered() async {
    SharedPreferences _storage = await SharedPreferences.getInstance();
    return _storage.getBool('registered') ?? false;
  }
}