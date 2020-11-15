import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//import 'package:otw/shared/shared.dart' as Styles;

double setPoint(double i) {
  return ScreenUtil().setSp(i, allowFontScalingSelf: true);
}

num setMaxDim(double i) {
  return max(ScreenUtil().scaleHeight, ScreenUtil().scaleWidth) * i;
}

num setMinDim(double i) {
  return min(ScreenUtil().scaleHeight, ScreenUtil().scaleWidth) * i;
}

num getWidth() {
  return ScreenUtil().screenWidth;
}

num getHeight() {
  return ScreenUtil().screenHeight;
}

void initScreen(BuildContext context) {
  ScreenUtil.init(context, designSize: Size(360, 640), allowFontScaling: true);
}

void initSystem() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // status bar color
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.white));
}

DecorationImage imageContainer(String image) {
  return DecorationImage(fit: BoxFit.cover, image: NetworkImage(image));
}

DecorationImage imageLocal(String image, ColorFilter filter) {
  return DecorationImage(
      fit: BoxFit.cover, image: AssetImage(image), colorFilter: filter);
}
