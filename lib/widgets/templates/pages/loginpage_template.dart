import 'package:flutter/material.dart';

import 'package:alumina/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Layout1(
      middle: ContentHeader(
        head: 'gunakan e-mail aktif anda untuk masuk atau registrasi',
        body: 'pastikan anda mengingat kata sandi anda',
      ),
      bottom: LoginEmailForm(),
    );
  }
}
