import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/shared/shared.dart' as Styles;
import 'package:alumina/shared/shared.dart' as Iconic;

class LoginEmailForm extends StatefulWidget {
  @override
  _LoginEmailFormState createState() => _LoginEmailFormState();
}

class _LoginEmailFormState extends State<LoginEmailForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32.0.w, bottom: 30.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ContentHeader(
            head: 'gunakan e-mail aktif anda untuk masuk atau registrasi',
            body: 'pastikan anda mengingat kata sandi anda',
          ),
          SizedBox(height: 142.0.w,),
          InputText(
            mode: Styles.StyleType.warning,
            hint: 'e-mail',
            suffix: BaseContainer(
                width: 8.0.w,
                height: 8.0.w,
                child: Iconic.mailFFE9E4
            ),
          ),
          SizedBox(
            height: 16.0.w,
          ),
          InputText(
            mode: Styles.StyleType.warning,
            hint: 'password',
            password: true,
            suffix: ClipButton(
              width: 8.0.w,
              height: 8.0.w,
              icon: Iconic.eyeoffFFE9E4,
            ),
          ),
          SizedBox(
            height: 16.0.w,
          ),
          PrimaryButton(
            mode: Styles.StyleType.warning,
            text: 'masuk',
          )
        ],
      ),
    );
  }
}
