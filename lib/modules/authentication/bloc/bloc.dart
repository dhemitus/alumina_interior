import 'package:alumina/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:alumina/models/models.dart';
import 'package:alumina/modules/modules.dart';

part 'event.dart';
part 'state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _repo;
  final RegisterBloc _reg;

  AuthenticationBloc(this._repo, this._reg) : super(null);

//  @override
  AuthenticationState get initialState => AuthenticationInit();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    yield AuthenticationLoading();

    if (event is GoogleAuthentication) {
      final UserCredential _user = await _repo.googleSignIn();

      if (_user != null) {
        _reg.add(AddRegister(_user.user));

        final bool _sign = await _repo.getFirstSign();
        if (_sign == false) {
          await _repo.setFirstSign(true);
        }
        print('_sign');
        print(_sign);
        yield AuthenticationSignIn(_user);
      } else {
        yield AuthenticationError('user empty');
      }
    }

    if (event is EmailSignInAuthentication) {
      final UserCredential _user = await _repo.emailSignIn(event.user);

      if (_user != null) {
        _reg.add(AddRegister(_user.user));

        final bool _sign = await _repo.getFirstSign();
        if (_sign == false) {
          await _repo.setFirstSign(true);
        }
        print(_sign);

        yield AuthenticationSignIn(_user);
      } else {
        yield AuthenticationError('user empty');
      }
    }

    if (event is EmailSignUpAuthentication) {
      final UserCredential _user = await _repo.emailSignUp(event.user);

      if (_user != null) {
        _reg.add(AddRegister(_user.user));

        final bool _sign = await _repo.getFirstSign();
        if (_sign == false) {
          await _repo.setFirstSign(true);
        }
        print(_sign);

        yield AuthenticationSignIn(_user);
      } else {
        yield AuthenticationError('user empty');
      }
    }

    if (event is SignOutAuthentication) {
      final bool _out = await _repo.signOut();

      if (_out != null) {
        yield AuthenticationSignOut(_out);
      } else {
        yield AuthenticationError('sign out fail');
      }
    }

    if (event is IsSignInAuthentication) {
      final User _user = await _repo.isSignedIn();

      if (_user != null) {
//        _reg.add(CheckRegister(user: _user));

        yield AuthenticationIsSignIn(_user);
      } else {
        yield AuthenticationError('user empty');
      }
    }

    if (event is PhoneVerifyAuthentication) {
      final AuthPhone _phone = await _repo.verifyPhone(event.phone);

      if (_phone != null) {
        print('_success ' + _phone.toString());
        yield AuthenticationPhoneVerify(_phone);
      } else {
        yield AuthenticationError('user empty');
        print('_error ' + _phone.toString());
      }
    }

    if (event is OtpVerifyAuthentication) {
      final PhoneAuthCredential _phone =
          await _repo.verifyOtp(event.phone.verId, event.phone.otp);

      print(_phone);
      if (_phone != null) {
        yield AuthenticationOtpVerify(_phone);
      } else {
        yield AuthenticationError('user empty');
      }
    }
  }
}
