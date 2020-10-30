import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:alumina/modules/modules.dart';
import 'package:alumina/models/models.dart';

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
      if(event is AddRegister) {
        print('register added');
        bool _reg = await _repo.addRegister(event.user);
        print(_reg);
        yield RegisterAdded(_reg);
      }

      if(event is SetRegister) {
        print('register seted');
        bool _reg = await _repo.setRegister(event.user);
        print(_reg);
        yield RegisterSeted(_reg);
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