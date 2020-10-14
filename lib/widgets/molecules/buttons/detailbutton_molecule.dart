import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/shared/shared.dart' as Styles;
import 'package:alumina/shared/shared.dart' as Utils;
import 'package:alumina/shared/shared.dart' as Iconic;

class DetailButton extends StatelessWidget {
  final Function onTap;
  final String body, head, foot;

  DetailButton({this.onTap, this.body = '', this.head = '', this.foot = ''});

  @override
  Widget build(BuildContext context) {

    return BaseContainer(
      padding: EdgeInsets.symmetric(vertical: 8.0.h),
      alignment: Alignment.topLeft,
      border: Border(
          bottom: BorderSide(
              width: 1.0.h,
              color: Styles.blueDDE9FB
          )
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseContainer(
                width: 64.0.w,
                height: 64.0.w,
                image: Utils.imageContainer(head),
              ),
              SizedBox(
                width: 6.0.w,
              ),
              Expanded(
                  child: BodyText2(body, color: Styles.blue0B1A31)
              ),
              ClipButton(
                width: 22.0.w,
                height: 22.0.w,
                icon: Iconic.imageDDE9FB,
              )
            ],
          ),
          Container(
              alignment: Alignment.bottomRight,
              child: CaptionText(foot, color: Styles.blue0B1A31)
          )
        ],
      ),
    );
  }
}