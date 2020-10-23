import 'package:alumina/modules/modules.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterRepository {
  final RegisterProvider _api = RegisterProvider();

  Future<bool> isRegistered(User user) => _api.isRegistered(user);
}