import 'package:flutter/material.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/shared/shared.dart' as Styles;

class LoadingSign extends StatelessWidget {
  final String title;

  LoadingSign({this.title});

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
              width: 24.0,
              height: 24.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Styles.orangeFFE9E4),
              )
          ),
          Padding(
            padding: EdgeInsets.only(top:18.0),
            child: HeadlineText6(title, color: Styles.blue0B1A31,),
          ),
        ],
      ),
    );
  }
}