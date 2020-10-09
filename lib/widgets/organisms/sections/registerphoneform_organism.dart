import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/shared/shared.dart' as Styles;
import 'package:alumina/shared/shared.dart' as Iconic;

class RegisterPhoneForm extends StatefulWidget {
  @override
  _RegisterPhoneFormState createState() => _RegisterPhoneFormState();
}

class _RegisterPhoneFormState extends State<RegisterPhoneForm> {
  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      padding: EdgeInsets.only(top: 32.0.w, bottom: 30.0.w),
      child: InputText(
        preffix: BaseContainer(
            width: 16.0.w,
            height: 16.0.w,
            child: Iconic.smartphoneDDE9FB
        ),
        hint: 'phone number',
        suffix: BaseContainer(
          width: 100.0.w,
          height: 32.0.w,
          child: CapsuleButton(
            text: 'Kirim',
            width: 100.0.w,
            icon: Iconic.arrowight2D415F,
          ),
        ),
      ),
    );
  }
}
