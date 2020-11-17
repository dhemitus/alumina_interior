import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/shared/shared.dart' as Iconic;

class RegisterPhoneForm extends StatelessWidget {
  final Function onSubmit;
  final TextEditingController phoneController;

  RegisterPhoneForm({this.phoneController, this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      padding: EdgeInsets.only(top: 32.0.w, bottom: 30.0.w),
      child: InputText(
        controller: phoneController,
        preffix: BaseContainer(
            width: 16.0.w, height: 16.0.w, child: Iconic.smartphoneDDE9FB),
        hint: 'phone number',
        suffix: BaseContainer(
          width: 82.0.w,
          height: 32.0.w,
          child: CapsuleButton(
            text: 'Kirim',
            width: 82.0.w,
            icon: Iconic.arrowrightFFFFFF,
            onTap: onSubmit,
          ),
        ),
      ),
    );
  }
}
