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

//  @override
  RegisterState get initialState => RegisterInitial();

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    yield RegisterLoading();

    try {
      if (event is AddRegister) {
        print('register added');
        bool _reg = await _repo.addRegister(event.user);
        print(_reg);
        yield RegisterAdded(_reg);
      }

      if (event is GetProfile) {
        print('register seted');
        dynamic _reg = await _repo.getProfile();
        print(_reg);
        yield ProfileGeted(_reg);
      }

      if (event is SetPicture) {
        print('register picture seted');
        dynamic _reg = await _repo.setPicture(event.user);
        print(_reg);
        yield RegisterPictureSet(_reg);
      }

      if (event is SetProfile) {
        print('register profile seted');
        bool _reg = await _repo.setProfile(event.user);
        print(_reg);
        yield RegisterProfileSet(_reg);
      }

      if (event is SetAddress) {
        print('register address seted');
        bool _reg = await _repo.setAddress(event.user);
        print(_reg);
        yield RegisterAddressSet(_reg);
      }

      if (event is SetPhone) {
        print('register phone seted');
        bool _reg = await _repo.setPhone(event.user);
        await _repo.setRegister();
        print(_reg);
        yield RegisterPhoneSet(_reg);
      }

      if (event is IsRegisterd) {
        bool _reg = await _repo.isRegistered();
        yield RegisterCheck(_reg);
      }
    } catch (_) {
      yield RegisterError('register Error!!');
    }
  }
}
