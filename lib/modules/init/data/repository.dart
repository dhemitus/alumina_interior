import 'package:alumina/modules/modules.dart';

class InitRepository {
  final InitProvider _api = InitProvider();

  Future<bool> initialize() => _api.initialize();
}