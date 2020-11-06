import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/modules/modules.dart';

class AuthenticationPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    onEmail() {
      Navigator.of(context).pushNamed('/loginEmail');
    }

    onFacebook() {
      print('facebook');
    }

    onGoogle() {
      print('google');
      BlocProvider.of<AuthenticationBloc>(context).add(GoogleAuthentication());
    }

    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (BuildContext context, AuthenticationState state) {
          if (state is AuthenticationIsSignIn) {
            print(state.user);
            return CheckingPage();
//            return RegisterProfilePage();
            //frontpage
          } else if(state is AuthenticationSignIn) {
            return CheckingPage();
//            return RegisterProfilePage();
            //frontpage
          } else {
            return WelcomePage(onEmail: onEmail, onGoogle: onGoogle, onFacebook: onFacebook,);
          }
        }
    );
  }
}
