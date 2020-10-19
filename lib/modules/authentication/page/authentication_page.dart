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

    return WelcomePage(onEmail: onEmail, onGoogle: onGoogle, onFacebook: onFacebook,);
  }
}
