import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';

class RegisterAddressForm extends StatefulWidget {
  @override
  _RegisterAddressFormState createState() => _RegisterAddressFormState();
}

class _RegisterAddressFormState extends State<RegisterAddressForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32.0.w, bottom: 30.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InputText(
            hint: 'alamat',
          ),
          SizedBox(
            height: 16.0.w,
          ),
          InputText(
            hint: 'kota/kabupaten',
          ),
          SizedBox(
            height: 16.0.w,
          ),
          InputText(
            hint: 'propinsi',
          ),
          SizedBox(
            height: 16.0.w,
          ),
          InputText(
            hint: 'kodepos',
          ),
          SizedBox(
            height: 16.0.w,
          ),
          PrimaryButton(
            text: 'lanjutkan',
          )
        ],
      ),
    );  }
}
