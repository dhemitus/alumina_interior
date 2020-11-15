import 'package:alumina/modules/modules.dart';

class ProfileRepository {
  final ProfileProvider _api = ProfileProvider();

  Future<dynamic> getProfile() => _api.getProfile();
}
