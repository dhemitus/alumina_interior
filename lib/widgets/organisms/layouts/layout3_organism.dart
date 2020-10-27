import 'package:flutter/material.dart';

class Layout3 extends StatelessWidget {
  final Widget back;
  final Widget front;

  Layout3({@required this.back, @required this.front});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          back,
          front
        ],
      )
    );
  }
}
