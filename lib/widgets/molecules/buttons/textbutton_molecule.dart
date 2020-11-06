import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/shared/shared.dart' as Styles;

class SimpleButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final Styles.StyleType mode;

  SimpleButton({this.onTap, this.text = '', this.mode = Styles.StyleType.primary});

  @override
  Widget build(BuildContext context) {
    Color color;
    switch(mode) {
      case Styles.StyleType.primary:
        color = Styles.blue0B1A31;
        break;
      case Styles.StyleType.secondary:
        color = Styles.blue7083A0;
        break;
      case Styles.StyleType.warning:
        color = Styles.orangeE23C18;
        break;
    }
    return InkWell(
      onTap: () => onTap(context),
      child: ButtonText(text, color: color,),
    );
  }
}