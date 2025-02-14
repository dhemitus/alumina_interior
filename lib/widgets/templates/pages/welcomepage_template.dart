import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';

class WelcomePage extends StatelessWidget {
  final Function onGoogle;
  final Function onEmail;
  final Function onFacebook;

  WelcomePage({this.onEmail, this.onGoogle, this.onFacebook});

  @override
  Widget build(BuildContext context) {
    return Layout3(
        back: WelcomeBackground(),
        front: BaseContainer(
          padding: EdgeInsets.only(top: 142.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              WelcomeHeader(),
              LoginOption(
                  onEmail: onEmail, onGoogle: onGoogle, onFacebook: onFacebook),
            ],
          ),
        ));
  }
}
