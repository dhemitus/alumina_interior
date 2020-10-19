import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Layout1 extends StatelessWidget {
  final Widget left;
  final Widget top;
  final Widget middle;
  final Widget bottom;
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  Layout1({this.left, this.top, this.middle, this.bottom});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Row(
          children: <Widget>[
            Container(
              width: 42.0.w,
              color: Colors.red,
              child: left,
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.bottomLeft,
                    height: 52.0.w,
                    child: top,
                  ),
                  Container(
                    height: 266.0.w,
                    child: middle,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: bottom,
                  ),
                ],
              ),
            ),
            Container(
              width: 42.0.w,
              color: Colors.orange,
            ),
          ],
        ),
      )
    );
  }
}