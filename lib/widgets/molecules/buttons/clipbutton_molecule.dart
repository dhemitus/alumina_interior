import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';

class ClipButton extends StatelessWidget {
  final Function onTap;
  final Widget icon;
  final double width;
  final double height;

  ClipButton({this.onTap, this.icon, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(context),
      child: BaseContainer(
          width: width == null ? 48.0.w : width,
          height: height == null ? 48.0.w : height,
        child: icon ?? Container()
      ),
    );
  }
}