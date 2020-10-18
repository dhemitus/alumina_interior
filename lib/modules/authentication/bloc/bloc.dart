import 'package:alumina/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:alumina/models/models.dart';
import 'package:alumina/modules/modules.dart';

part 'event.dart';
part 'state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _repo;

  AuthenticationBloc(this._repo) : super(null);

  @override
  AuthenticationState get initialState => AuthenticationInit();

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    yield AuthenticationLoading();

    if(event is GoogleAuthentication) {
      final UserCredential _user = await _repo.googleSignIn();

      if(_user != null) {
        yield AuthenticationSignIn(_user);
      } else {
        yield AuthenticationError('user empty');
      }
    }

    if(event is EmailSignInAuthentication) {
      final UserCredential _user = await _repo.emailSignIn(event.user);

      if(_user != null) {
        yield AuthenticationSignIn(_user);
      } else {
        yield AuthenticationError('user empty');
      }
    }

    if(event is SignOutAuthentication) {
      final bool _out = await _repo.signOut();

      if(_out != null) {
        yield AuthenticationSignOut(_out);
      } else {
        yield AuthenticationError('sign out fail');
      }
    }

    if(event is IsSignInAuthentication) {
      final User _user = await _repo.isSignedIn();

      if(_user != null) {
        yield AuthenticationIsSignIn(_user);
      } else {
        yield AuthenticationError('user empty');
      }
    }

  }
}