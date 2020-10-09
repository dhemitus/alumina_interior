import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/shared/shared.dart' as Iconic;

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
        hint: 'secret key',
        suffix: BaseContainer(
          width: 100.0.w,
          height: 32.0.w,
          child: CapsuleButton(
            text: 'Selesai',
            width: 100.0.w,
            icon: Iconic.arrowight2D415F,
          ),
        ),
      ),
    );
  }
}
