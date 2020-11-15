import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Layout4 extends StatelessWidget {
  final Widget left;
  final Widget right;

  Layout4({this.left, this.right});

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
                child: Container(
                  alignment: Alignment.topLeft,
                  child: right,
                ),
              ),
            ],
          ),
        ));
  }
}
