import 'package:flutter/material.dart';
import 'package:alumina/shared/shared.dart' as Utils;
import 'package:alumina/shared/shared.dart' as Styles;

class HeadlineText5 extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color color;
  final TextAlign align;
  final bool selectable;

  HeadlineText5(this.text, {Key key, this.style, this.color, this.align, this.selectable = false}) : super(key: key);

  @override
  Widget build(BuildContext context) => selectable ? SelectableText(
    text,
    style: style?.copyWith(
        fontSize: Utils.setPoint(24.0),
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
        letterSpacing: Utils.setPoint(0.0),
        color: color ?? Colors.black
    ) ?? Styles.bodytext1.copyWith(
        color: color ?? Colors.black
    ),
    textAlign: align,
  ) : Text(
    text,
    style: style?.copyWith(
      fontSize: Utils.setPoint(24.0),
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal,
      letterSpacing: Utils.setPoint(0.0),
      color: color ?? Colors.black
    ) ?? Styles.headlinetext5.copyWith(
      color: color ?? Colors.black
    ),
    textAlign: align,
  );
}