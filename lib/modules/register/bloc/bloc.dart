import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:alumina/modules/modules.dart';

part './event.dart';
part './state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterRepository _repo;

  RegisterBloc(this._repo) : super(null);

  @override
  RegisterState get initialState => RegisterInitial();

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    yield RegisterLoading();

    try {
      if(event is CheckRegister) {
        bool _reg = await _repo.isRegistered(user: event.user);
        yield RegisterCheck(_reg);
      }

      if(event is IsRegisterd) {
        bool _reg = await _repo.isRegistered();
        yield RegisterCheck(_reg);
      }

    } catch (_) {
      yield RegisterError('register Error!!');
    }
  }
}