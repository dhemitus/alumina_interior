import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';

class CircleImage extends StatelessWidget {
  final String icon;

  CircleImage({this.icon});

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      image: DecorationImage(
        image: NetworkImage(icon),
        fit: BoxFit.cover,
      ),
      width: 72.0.w,
      height: 72.0.w,
      radius: BorderRadius.circular(72.0.w),
    );
  }
}
