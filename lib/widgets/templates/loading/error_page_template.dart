import 'package:flutter/material.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/shared/shared.dart' as Styles;

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.blue0B1A31,
      body: BaseContainer(
        child: HeadlineText3('ouch...', color: Styles.orangeF1C3B9),
      )
    );
  }
}
