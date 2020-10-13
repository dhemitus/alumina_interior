import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/shared/shared.dart' as Iconic;
import 'package:alumina/shared/shared.dart' as Styles;

class RegisterKeyForm extends StatefulWidget {
  @override
  _RegisterKeyFormState createState() => _RegisterKeyFormState();
}

class _RegisterKeyFormState extends State<RegisterKeyForm> {
  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      padding: EdgeInsets.only(top: 32.0.w, bottom: 30.0.w),
      child: InputText(
        mode: Styles.StyleType.warning,
        hint: 'secret key',
        suffix: BaseContainer(
          width: 100.0.w,
          height: 32.0.w,
          child: CapsuleButton(
            mode: Styles.StyleType.warning,
            text: 'Selesai',
            width: 100.0.w,
            icon: Iconic.arrowightF1C3B9,
          ),
        ),
      ),
    );
  }
}
