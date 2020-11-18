import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';

class AddressForm extends StatelessWidget {
  final TextEditingController addressController,
      cityController,
      provinceController,
      postcodeController;
  final Function onSubmit;

  AddressForm(
      {this.addressController,
      this.cityController,
      this.provinceController,
      this.postcodeController,
      this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32.0.w, bottom: 30.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InputText(
            hint: 'alamat',
            controller: addressController,
          ),
          SizedBox(
            height: 16.0.w,
          ),
          InputText(
            hint: 'kota/kabupaten',
            controller: cityController,
          ),
          SizedBox(
            height: 16.0.w,
          ),
          InputText(
            hint: 'propinsi',
            controller: provinceController,
          ),
          SizedBox(
            height: 16.0.w,
          ),
          InputText(
            hint: 'kodepos',
            controller: postcodeController,
          ),
          SizedBox(
            height: 16.0.w,
          ),
          PrimaryButton(
            text: 'lanjutkan',
            onTap: onSubmit,
          )
        ],
      ),
    );
  }
}
