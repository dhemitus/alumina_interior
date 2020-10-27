import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';

class LoginFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Layout1(
      middle: Padding(
        padding: EdgeInsets.only(top: 122.0.h),
        child: ContentHeader(
          head: 'gunakan e-mail aktif anda untuk masuk atau registrasi',
          body: 'pastikan anda mengingat kata sandi anda',
        ),
      ),
      bottom: LoginEmailForm(),
    );
  }
}
