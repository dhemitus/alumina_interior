import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/shared/shared.dart' as Utils;

class SettingMenu extends StatelessWidget {
  final Function onTap;
  SettingMenu({this.onTap});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Utils.getHeight() - 242.0.h,
        ),
        MenuSetting(
          onTap: onTap,
        )
      ],
    );
  }
}
