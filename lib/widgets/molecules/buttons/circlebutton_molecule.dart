import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/shared/shared.dart' as Styles;

class CircleButton extends StatelessWidget {
  final Function onTap;
  final Widget icon;
  final Widget label;
  final Color color;
  final bool small;

  CircleButton({this.onTap, this.icon, this.label, this.color, this.small = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(context),
      child: label != null ? Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10.0.w),
            child: label,
          ),
          SizedBox(
            height: small ? 32.0.w : 96.0.w,
            width: small ? 32.0.w : 96.0.w,
            child: BaseContainer(
              alignment: Alignment.center,
              radius: small ? BorderRadius.circular(32.0.w) : BorderRadius.circular(96.0.w),
              border: Border.all(
                  color: color != null ? color : Styles.blueAEC0DB,
                  width: 1.0.w
              ),
//              color: color != null ? color : Styles.blue7083A0,
              child: (icon != null) ? SizedBox(
                  width: 18.0.w,
                  height: 18.0.w,
                  child: icon
              ) : Container(),
            ),
          )
        ],
      ) : SizedBox(
        height: small ? 32.0.w : 96.0.w,
        width: small ? 32.0.w : 96.0.w,
        child: BaseContainer(
          alignment: Alignment.center,
          radius: small ? BorderRadius.circular(32.0.w) : BorderRadius.circular(96.0.w),
          border: Border.all(
              color: color != null ? color : Styles.blueAEC0DB,
              width: 1.0.w
          ),
//          color: color != null ? color : Styles.blue7083A0,
          child: (icon != null) ?  SizedBox(
              width: 24.0.w,
              height: 24.0.w,
              child: icon
          ) :Container(),
        ),
      ),
    );
  }
}