import 'package:alumina/modules/modules.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:alumina/models/models.dart';

class RegisterRepository {
  final RegisterProvider _api = RegisterProvider();

  Future<bool> isRegistered({User user}) => _api.isRegistered(user: user);
  Future<bool> setRegister() => _api.setRegister();
  Future<bool> addRegister(User user) => _api.addRegister(user);
  Future<dynamic> setPicture(UserData user) => _api.setPicture(user);
  Future<bool> setProfile(UserData user) => _api.setProfile(user);
//  Future<dynamic> getProfile() => _api.getProfile();
  Future<bool> setAddress(UserData user) => _api.setAddress(user);
  Future<bool> setPhone(UserData user) => _api.setPhone(user);
}
