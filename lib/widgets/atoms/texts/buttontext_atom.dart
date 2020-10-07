import 'package:flutter/material.dart';
import 'package:alumina/shared/shared.dart' as Utils;
import 'package:alumina/shared/shared.dart' as Styles;

class ButtonText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color color;
  final TextAlign align;

  ButtonText(this.text, {Key key, this.style, this.color, this.align}) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: style?.copyWith(
        fontSize: Utils.setPoint(14.0),
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        letterSpacing: Utils.setPoint(1.25),
        color: color ?? Colors.black
    ) ?? Styles.buttontext.copyWith(
        color: color ?? Colors.black
    ),
    textAlign: align,
  );
}