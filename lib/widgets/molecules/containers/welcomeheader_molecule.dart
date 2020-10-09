import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/shared/shared.dart' as Iconic;

class WelcomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Iconic.logo,
        SizedBox(height: 112.0.w,),
        HeadlineText5('Welcome To'),
        HeadlineText4('Alumina Interior')
      ],
    );
  }
}
