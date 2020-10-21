import 'package:alumina/modules/modules.dart';

class RegisterRepository {
  final RegisterProvider _api = RegisterProvider();

  Future<bool> isRegistered() => _api.isRegistered();
}