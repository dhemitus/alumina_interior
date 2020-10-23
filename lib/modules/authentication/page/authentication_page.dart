import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/modules/modules.dart';

class AuthenticationPage extends StatelessWidget {

  onEmail() {
    print('email');
  }


  onFacebook() {
    print('facebook');
  }

  @override
  Widget build(BuildContext context) {
    onGoogle() {
      print('google');
      BlocProvider.of<AuthenticationBloc>(context).add(GoogleAuthentication());
    }

    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (BuildContext context, AuthenticationState state) {
          if (state is AuthenticationIsSignIn) {
            print(state.user);
            return RegisterProfile();
            //frontpage
          } else {
            return WelcomePage(onEmail: onEmail, onGoogle: onGoogle, onFacebook: onFacebook,);
          }
        }
    );
  }
}
