import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/shared/shared.dart' as Styles;

class SecondaryButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final Styles.StyleType mode;

  SecondaryButton({this.onTap, this.text = '', this.mode = Styles.StyleType.primary});

  @override
  Widget build(BuildContext context) {
    Color color, border;
    switch(mode) {
      case Styles.StyleType.primary:
        color = Styles.blue0B1A31;
        border = Styles.blueDDE9FB;
        break;
      case Styles.StyleType.secondary:
        color = Styles.blue7083A0;
        border = Styles.blue2D415F;
        break;
      case Styles.StyleType.warning:
        color = Styles.orangeE23C18;
        border = Styles.orangeFFE9E4;
        break;
    }
    return InkWell(
      onTap: () => onTap(context),
      child: SizedBox(
        height: 46.0.w,
        child: BaseContainer(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 10.0.w, right: 3.0.w),
          border: Border.all(
              color: border,
              width: 1.0.w
          ),
          child: ButtonText(text, color: color,),
        ),
      ),
    );
  }
}