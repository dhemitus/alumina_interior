import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/shared/shared.dart' as Styles;

class ListButton extends StatelessWidget {
  final Function onTap;
  final String body, head, foot, side;
  final Styles.StyleType mode;

  ListButton({this.onTap, this.body = '', this.head = '', this.foot = '', this.side = '', this.mode = Styles.StyleType.primary});

  @override
  Widget build(BuildContext context) {
    Color color, font;
    switch(mode) {
      case Styles.StyleType.primary:
        color = Styles.blueDDE9FB;
        font = Styles.blueAEC0DB;
        break;
      case Styles.StyleType.secondary:
        color = Styles.blueDDE9FB;
        font = Styles.blueAEC0DB;
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CaptionText('20 September 2020', color: Styles.orangeF1C3B9),
              BodyText2(body, color: Styles.blue0B1A31,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SubtitleText2(foot, color: Styles.blue0B1A31,),
                  CaptionText(side, color: font)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}