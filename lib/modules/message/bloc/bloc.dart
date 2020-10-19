import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:alumina/modules/modules.dart';

part './event.dart';
part './state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final MessageRepository _repo;

  MessageBloc(this._repo) : super(null);

  @override
  MessageState get initialState => MessageInitial();

  @override
  Stream<MessageState> mapEventToState(MessageEvent event) async* {
    yield MessageLoading();

    try {
      if(event is StartMessage) {
        await _repo.initialize();
        yield MessageLoaded();
      }

    } catch (_) {
      yield MessageError('init message Error!!');
    }
  }
}