import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/shared/shared.dart' as Iconic;
import 'package:alumina/shared/shared.dart' as Styles;

class RegisterKeyForm extends StatelessWidget {
  final Function onSubmit;
  final TextEditingController keyController;

  RegisterKeyForm({this.keyController, this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      padding: EdgeInsets.only(top: 32.0.w, bottom: 30.0.w),
      child: InputText(
        mode: Styles.StyleType.warning,
        hint: 'secret key',
        controller: keyController,
        suffix: BaseContainer(
          width: 100.0.w,
          height: 32.0.w,
          child: CapsuleButton(
            mode: Styles.StyleType.warning,
            text: 'Selesai',
            width: 100.0.w,
            icon: Iconic.arrowrightF1C3B9,
            onTap: onSubmit,
          ),
        ),
      ),
    );
  }
}
