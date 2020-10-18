import 'package:flutter/material.dart';

import 'package:alumina/widgets/widgets.dart';

import '../../widgets.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Layout3(
      back: WelcomeBackground(),
      front: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          WelcomeHeader(),
          LoginOption(),
        ],
      ),
    );
  }
}
