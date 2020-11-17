import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/shared/shared.dart' as Iconic;
import 'package:alumina/shared/shared.dart' as Utils;

class SettingEditPage extends StatelessWidget {
  final Widget photoBox, formBox;
  final Function onTap;

  SettingEditPage({this.photoBox, @required this.formBox, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Layout1(
      middle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          photoBox == null ? Container() : photoBox,
          SizedBox(
            height: 56.0.h,
            width: Utils.getWidth(),
          ),
        ],
      ),
      left: Padding(
        padding: EdgeInsets.only(top: 28.0.h),
        child: Center(
            child: ClipButton(
          icon: Iconic.arrowleft2D415F,
          width: 36.0.w,
          height: 34.0.h,
          onTap: onTap,
        )),
      ),
      bottom: formBox,
    );
  }
}
