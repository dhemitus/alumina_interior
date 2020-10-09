import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';

class RegisterProfileForm extends StatefulWidget {
  @override
  _RegisterProfileFormState createState() => _RegisterProfileFormState();
}

class _RegisterProfileFormState extends State<RegisterProfileForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 32.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InputText(
            label: 'nama depan',
          ),
          SizedBox(
            height: 16.0.w,
          ),
          InputText(
            label: 'nama belakang',
          ),
          SizedBox(
            height: 16.0.w,
          ),
          InputText(
            label: 'jenis kelamin',
          ),
          SizedBox(
            height: 16.0.w,
          ),
          InputText(
            label: 'tanggal lahir',
          ),
          SizedBox(
            height: 16.0.w,
          ),
          PrimaryButton(
            text: 'lanjutkan',
          )
        ],
      ),
    );
  }
}
