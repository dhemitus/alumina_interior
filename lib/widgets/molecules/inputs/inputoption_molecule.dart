import 'package:flutter/material.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alumina/shared/shared.dart' as Styles;

class InputOption extends StatelessWidget {
  final Styles.StyleType mode;
  final dynamic value;
  final List<dynamic> values;
  final Function onChange;
  final String hint;

  InputOption({@required this.values, this.hint = '', this.mode = Styles.StyleType.primary, this.value = null, this.onChange});

  @override
  Widget build(BuildContext context) {
    Color border;

    switch(mode) {
      case Styles.StyleType.primary:
        border = Styles.blueDDE9FB;
        break;
      case Styles.StyleType.secondary:
        border = Styles.blue2D415F;
        break;
      case Styles.StyleType.warning:
        border = Styles.orangeFFE9E4;
        break;
    }

    return BaseContainer(
      padding: EdgeInsets.only(left: 10.0.w, right: 3.0.w),
      alignment: Alignment.centerLeft,
      border: Border.all(
          color: border,
          width: 1.0.w
      ),
      child: DropdownButtonHideUnderline(
          child: DropdownButton(
            hint: BodyText2(hint, color: Styles.blueAEC0DB,),
            value: value,
            items: values.map((value) {
              return DropdownMenuItem(
                child: BodyText2(value, color: Styles.blue2D415F),
                value: value,
              );
            }).toList(),
            onChanged: onChange,
          )
      ),
    );
  }
}
