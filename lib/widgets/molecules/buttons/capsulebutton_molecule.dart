import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/shared/shared.dart' as Styles;

class CapsuleButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final Widget icon;
  final bool dark;

  CapsuleButton({this.onTap, this.text = '', this.icon, this.dark = true});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(context),
      child: SizedBox(
        height: 32.0.w,
        child: BaseContainer(
            radius: BorderRadius.circular(32.0.w),
            color: dark ? Styles.blue7083A0 : Colors.white,
            child: icon != null ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CaptionText(text, color: Styles.blue2D415F,),
                Padding(
                  padding: EdgeInsets.only(left: 6.0.w),
                  child: SizedBox(
                      width: 14.0.w,
                      height: 14.0.w,
                      child: icon
                  ),
                )
              ],
            ) : CaptionText(text, color: Styles.blue2D415F,),
        ),
      ),
    );
  }
}