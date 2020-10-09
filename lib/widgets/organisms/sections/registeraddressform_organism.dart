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
            label: 'alamat',
          ),
          SizedBox(
            height: 16.0.w,
          ),
          InputText(
            label: 'kota/kabupaten',
          ),
          SizedBox(
            height: 16.0.w,
          ),
          InputText(
            label: 'propinsi',
          ),
          SizedBox(
            height: 16.0.w,
          ),
          InputText(
            label: 'kodepos',
          ),
          SizedBox(
            height: 16.0.w,
          ),
          PrimaryButton(
            text: 'masuk',
          )
        ],
      ),
    );  }
}
