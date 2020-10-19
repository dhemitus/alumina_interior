import 'package:flutter/material.dart';

import 'package:alumina/widgets/widgets.dart';
class AuthenticationPage extends StatelessWidget {

  onEmail() {
    print('email');
  }

  onGoogle() {
    print('google');
  }

  onFacebook() {
    print('facebook');
  }

  @override
  Widget build(BuildContext context) {
    return WelcomePage(onEmail: onEmail, onGoogle: onGoogle, onFacebook: onFacebook,);
  }
}
