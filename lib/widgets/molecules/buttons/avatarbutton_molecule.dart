import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';

class AvatarButton extends StatelessWidget {
  final Function onTap;
  final DecorationImage image;
  final double width;
  final double height;
  final bool small;

  AvatarButton({this.onTap, this.image, this.width, this.height, this.small = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(context),
      child: SizedBox(
        height: small ? 32.0.w : 96.0.w,
        width: small ? 32.0.w : 96.0.w,
        child: BaseContainer(
          image: image,
          alignment: Alignment.center,
          radius: small ? BorderRadius.circular(32.0.w) : BorderRadius.circular(96.0.w),
          child: Container(),
        ),
      ),
    );
  }
}