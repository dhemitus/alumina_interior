import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  final BorderRadius radius;
  final Border border;
  final double width;
  final double height;
  final EdgeInsets padding;
  final Alignment alignment;
  final List<BoxShadow> shadow;
  final LinearGradient gradient;
  final DecorationImage image;

  BaseContainer({this.alignment = Alignment.center, this.padding, this.width, this.height, this.child, this.color, this.image, this.gradient, this.radius, this.shadow, this.border});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width != null ? width.w : null,
      height: height != null ? height.h : null,
      alignment: alignment,
      child: child,
      decoration: BoxDecoration(
          image: image,
          gradient: gradient,
          border: border,
          color: color,
          shape: BoxShape.rectangle,
          borderRadius: radius,
          boxShadow: shadow
      ),
    );
  }
}