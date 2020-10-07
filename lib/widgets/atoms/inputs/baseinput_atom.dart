import 'package:flutter/material.dart';
import 'package:alumina/shared/shared.dart' as Styles;

class BaseInput extends StatelessWidget {
  final Function listener;
  final String label;
  final String hint;
  final String error;
  final TextEditingController controller;
  final bool password, enable;
  final Styles.StyleType mode;
  final Widget suffix, preffix;
  final int line;
  final TextInputType inputType;
  final VoidCallback onTap;
  final ValueChanged<String> onChange, onSubmit;
  final TextInputAction inputAction;

  BaseInput({
    this.listener,
    this.label,
    this.hint,
    this.error,
    this.controller,
    this.line,
    this.suffix,
    this.preffix,
    this.password = false,
    this.enable = true,
    this.inputType,
    this.onChange,
    this.onSubmit,
    this.inputAction,
    this.onTap,
    this.mode = Styles.StyleType.primary
  });

  @override
  Widget build(BuildContext context) {
    Color color, border;
    switch(mode) {
      case Styles.StyleType.primary:
        color = Styles.blue2D415F;
        border = Styles.blueAEC0DB;
        break;
      case Styles.StyleType.secondary:
        color = Styles.blue7083A0;
        border = Styles.blue2D415F;
        break;
      case Styles.StyleType.warning:
        color = Styles.orangeE9755C;
        border = Styles.orangeF1C3B9;
        break;
    }

    return TextFormField(
      cursorColor: border,
      controller: controller,
      maxLines: line,
      style: Styles.bodytext2.copyWith(
          color: color
      ),
      obscureText: password,
      enabled: enable,
      onTap: onTap,
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      textInputAction: inputAction ?? TextInputAction.done,
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: Styles.bodytext2.copyWith(
          color: border
        ),
        border: InputBorder.none,
        prefixIcon: preffix,
        suffixIcon: suffix,
        hintText: hint,
        hintStyle: Styles.bodytext2.copyWith(
          color: border
        ),
        errorText: error,
      ),
    );
  }
}