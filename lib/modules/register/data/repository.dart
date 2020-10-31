import 'package:alumina/modules/modules.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:alumina/models/models.dart';

class RegisterRepository {
  final RegisterProvider _api = RegisterProvider();

  Future<bool> isRegistered({User user}) => _api.isRegistered(user: user);
  Future<bool> addRegister(User user) => _api.addRegister(user);
  Future<bool> setPicture(UserData user) => _api.setPicture(user);
  Future<bool> setProfile(UserData user) => _api.setProfile(user);
  Future<bool> setRegister(UserData user) => _api.setRegister(user);
  Future<bool> setAddress(UserData user) => _api.setAddress(user);
}