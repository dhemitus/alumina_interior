import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/shared/shared.dart' as Styles;

class LineButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final Widget icon;
  final Styles.StyleType mode;

  LineButton({this.onTap, this.text = '', this.icon, this.mode = Styles.StyleType.primary});

  @override
  Widget build(BuildContext context) {
    Color color, font;
    switch(mode) {
      case Styles.StyleType.primary:
        color = Styles.blueDDE9FB;
        font = Styles.blue2D415F;
        break;
      case Styles.StyleType.secondary:
        color = Styles.blueDDE9FB;
        font = Styles.blue2D415F;
        break;
      case Styles.StyleType.warning:
        color = Styles.orangeFFE9E4;
        font = Styles.orangeE23C18;
        break;
    }
    return InkWell(
      onTap: () => onTap(context),
      child: SizedBox(
        child: BaseContainer(
          padding: EdgeInsets.symmetric(vertical: 8.0.h),
          alignment: Alignment.topLeft,
          border: Border(
            bottom: BorderSide(
              width: 1.0.h,
              color: color
            )
          ),
          child: icon != null ?
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: icon,
                ),
                ButtonText(text, color: font,),
              ],
            )
          :
            ButtonText(text, color: font,),
        ),
      ),
    );
  }
}