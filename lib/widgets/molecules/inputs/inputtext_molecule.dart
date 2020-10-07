import 'package:flutter/material.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alumina/shared/shared.dart' as Styles;

class InputText extends StatelessWidget {
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

  InputText({
    this.listener,
    this.label,
    this.hint,
    this.error,
    this.controller,
    this.line = 1,
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
        color = Styles.blueDDE9FB;
        border = Styles.blueDDE9FB;
        break;
      case Styles.StyleType.secondary:
        color = Styles.blue2D415F;
        border = Styles.blue2D415F;
        break;
      case Styles.StyleType.warning:
        color = Styles.orangeFFE9E4;
        border = Styles.orangeFFE9E4;
        break;
    }

    return SizedBox(
      height: line * 46.0.w,
      child: BaseContainer(
          padding: EdgeInsets.only(left: 10.0.w, right: 3.0.w),
          border: Border.all(
            color: border,
            width: 1.0.w
          ),
          child: BaseInput(
            line: line,
            listener: listener,
            label: label,
            hint: hint,
            error: error,
            controller: controller,
            suffix: suffix,
            preffix: preffix,
            password: password,
            enable: enable,
            mode: mode,
            inputType: inputType,
            onTap: onTap,
            onChange: onChange,
            onSubmit: onSubmit,
            inputAction: inputAction,
          )
      ),
    );
  }
}