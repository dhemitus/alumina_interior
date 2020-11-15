import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:alumina/modules/modules.dart';

part './event.dart';
part './state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _repo;

  ProfileBloc(this._repo) : super(null);

//  @override
  RegisterState get initialState => RegisterInitial();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    yield ProfileLoading();

    try {
      if (event is GetProfile) {
        print('profile seted');
        dynamic _reg = await _repo.getProfile();
        print(_reg);
        yield ProfileGeted(_reg);
      }
    } catch (_) {
      yield ProfileError('register Error!!');
    }
  }
}
