import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:alumina/modules/modules.dart';

part './event.dart';
part './state.dart';

class InitBloc extends Bloc<InitEvent, InitState> {
  final InitRepository _repo;

  InitBloc(this._repo) : super(null);

//  @override
  InitState get initialState => InitInitial();

  @override
  Stream<InitState> mapEventToState(InitEvent event) async* {
    yield InitLoading();

    try {
      if (event is StartInit) {
        bool _init = await _repo.initialize();
        yield InitLoaded(_init);
      }
    } catch (_) {
      yield InitError('init Error!!');
    }
  }
}
