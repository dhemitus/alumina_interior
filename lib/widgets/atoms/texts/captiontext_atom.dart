import 'package:flutter/material.dart';
import 'package:alumina/shared/shared.dart' as Utils;
import 'package:alumina/shared/shared.dart' as Styles;

class CaptionText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color color;
  final TextAlign align;
  final bool selectable;

  CaptionText(this.text, {Key key, this.style, this.color, this.align, this.selectable = false}) : super(key: key);

  @override
  Widget build(BuildContext context) => selectable ? SelectableText(
    text,
    style: style?.copyWith(
        fontSize: Utils.setPoint(12.0),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        letterSpacing: Utils.setPoint(0.4),
        color: color ?? Colors.black
    ) ?? Styles.bodytext1.copyWith(
        color: color ?? Colors.black
    ),
    textAlign: align,
    ) : Text(
    text,
    style: style?.copyWith(
        fontSize: Utils.setPoint(12.0),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        letterSpacing: Utils.setPoint(0.4),
        color: color ?? Colors.black
    ) ?? Styles.captiontext.copyWith(
        color: color ?? Colors.black
    ),
    textAlign: align,
  );
}