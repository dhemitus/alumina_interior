import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/models/models.dart';
import 'package:alumina/shared/shared.dart' as Styles;

class MenuSetting extends StatelessWidget {
  final Function onTap;

  MenuSetting({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: menuSetting.map((MenuContent item) {
        return Padding(
          padding: EdgeInsets.only(top: 8.0.h),
          child: LineButton(
            icon: item.isactive ? item.active : item.inactive,
            text: item.name,
            mode: item.isactive
                ? Styles.StyleType.warning
                : Styles.StyleType.primary,
            onTap: onTap,
          ),
        );
      }).toList(),
    );
  }
}
