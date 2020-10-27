import 'package:flutter/material.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/shared/shared.dart' as Styles;

class LoadPage extends StatelessWidget {
  final String title;

  LoadPage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.blue0B1A31,
      body: LoadingSign(title: title != null ? title : 'loading...', color: Colors.white,)
    );
  }
}
