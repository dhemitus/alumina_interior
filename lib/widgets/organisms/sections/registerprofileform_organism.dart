import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/shared/shared.dart' as Iconic;

class RegisterProfileForm extends StatefulWidget {
  @override
  _RegisterProfileFormState createState() => _RegisterProfileFormState();
}

class _RegisterProfileFormState extends State<RegisterProfileForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32.0.w, bottom: 30.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleButton(
            icon: Iconic.imageDDE9FB,
          ),
          SizedBox(height: 68.0.w,),
          ContentHeader(
            head: 'isilah dengan data yang benar dan akurat ',
            body: 'pastikan terisi semua kolom-kolom di bawah ini',
          ),
          SizedBox(height: 16.0.w,),
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
            text: 'masuk',
          )
        ],
      ),
    );
  }
}
