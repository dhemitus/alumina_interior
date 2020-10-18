import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/shared/shared.dart' as Iconic;
import 'package:alumina/shared/shared.dart' as Utils;

class WelcomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        BaseContainer(
          width: 56.0.h,
          height: 56.0.h,
          image: Utils.imageLocal('assets/images/logo1.png', null),
        ),
        SizedBox(height: 92.0.w,),
        HeadlineText5('Welcome To', color: Colors.white,),
        HeadlineText4('Alumina Interior', color: Colors.white,)
      ],
    );
  }
}
