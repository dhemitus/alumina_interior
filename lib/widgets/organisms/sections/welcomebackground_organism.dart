import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/shared/shared.dart' as Utils;
import 'package:alumina/shared/shared.dart' as Styles;

import '../../atoms/atoms.dart';

class WelcomeBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BaseContainer(
          width: 1.wp,
          height: 1.hp,
          color: Styles.blue0B1A31.withOpacity(0.5),
        ),
        BaseContainer(
          width: 1.wp,
          height: 1.hp,
          image: Utils.imageLocal('assets/images/background1.jpg'),
        ),
      ],
    );
  }
}
