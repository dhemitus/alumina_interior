import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/shared/shared.dart' as Styles;
import 'package:alumina/shared/shared.dart' as Iconic;

class LoginEmailForm extends StatelessWidget {

  final TextEditingController emailController, passwordController;
  final Function onSubmit, onLink;
  final String link;

  LoginEmailForm({this.emailController, this.passwordController, this.link, this.onSubmit, this.onLink});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 32.0.w),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InputText(
              mode: Styles.StyleType.warning,
              hint: 'e-mail',
              controller: emailController,
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
              controller: passwordController,
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
              onTap: onSubmit,
            ),
            SizedBox(
              height: 6.0.w,
            ),
            Center(
              child: SimpleButton(
                text: link,
                mode: Styles.StyleType.warning,
                onTap: onLink,
              ),
            )
          ],
        ),
      ),
    );
  }
}
