import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/shared/shared.dart' as Styles;

class CapsuleButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final Widget icon;
  final bool dark;
  final double width, height;
  final Styles.StyleType mode;

  CapsuleButton({this.onTap, this.text = '', this.icon, this.width, this.height, this.dark = true, this.mode = Styles.StyleType.primary});

  @override
  Widget build(BuildContext context) {
    Color body, font;
    switch(mode) {
      case Styles.StyleType.primary:
        body = Styles.blue0B1A31;
        font = Colors.white;
        break;
      case Styles.StyleType.secondary:
        body = Styles.blue7083A0;
        font = Colors.white;
        break;
      case Styles.StyleType.warning:
        body = Styles.orangeE23C18;
        font = Colors.white;
        break;
    }

    return InkWell(
      onTap: () => onTap(context),
      child: SizedBox(
        height: height != null ? height : 32.0.w,
        width: width,
        child: BaseContainer(
            radius: BorderRadius.circular(32.0.w),
            color: body,
            padding: EdgeInsets.symmetric(horizontal: 14.0.w),
            child: icon != null ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CaptionText(text, color: font,),
                Padding(
                  padding: EdgeInsets.only(left: 6.0.w),
                  child: SizedBox(
                      width: 14.0.w,
                      height: 14.0.w,
                      child: icon
                  ),
                )
              ],
            ) : CaptionText(text, color: font,),
        ),
      ),
    );
  }
}