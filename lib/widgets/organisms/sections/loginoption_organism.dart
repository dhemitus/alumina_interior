import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/shared/shared.dart' as Iconic;
import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/shared/shared.dart' as Styles;

class LoginOption extends StatelessWidget {
  final Function onGoogle;
  final Function onEmail;
  final Function onFacebook;

  LoginOption({this.onEmail, this.onGoogle, this.onFacebook});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SubtitleText2('Pilihan untuk login atau registrasi', color: Colors.white,),
        SizedBox(height: 16.0.w,),
        BaseContainer(
          padding: EdgeInsets.only(left: 38.0.w),
          radius: BorderRadius.circular(32.0.w),
          height: 32.0.h,
          width: 148.0.w,
          color: Styles.blue0B1A31.withOpacity(0.5),
          child: Row(
            children: <Widget>[
              ClipButton(
                icon: Iconic.mailF1C3B9,
                width: 36.0.w,
                height: 36.0.h,
                onTap: (context) => onEmail(),
              ),
              ClipButton(
                icon: Iconic.googleF1C3B9,
                width: 36.0.w,
                height: 36.0.h,
                onTap: (context) => onGoogle(),
              ),
              ClipButton(
                icon: Iconic.facebookF1C3B9,
                width: 36.0.w,
                height: 36.0.h,
                onTap: (context) => onFacebook(),
              )
            ],      ),
        ),
      ],
    );
  }
}
