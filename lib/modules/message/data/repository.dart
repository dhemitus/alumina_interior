import 'package:alumina/modules/modules.dart';

class MessageRepository {
  final MessageProvider _api = MessageProvider();

  Future initialize() => _api.initialize();
}