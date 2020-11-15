import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Layout4 extends StatelessWidget {
  final Widget left;
  final Widget top;
  final Widget middle;
  final Widget bottom;

  Layout4({this.left, this.top, this.middle, this.bottom});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 52.0.w,
                child: left,
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.bottomLeft,
                      height: 120.0.w,
                      child: top,
                    ),
                    Container(
                      height: 206.0.w,
                      child: middle,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: bottom,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
