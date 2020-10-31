import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';

class AddressFormPage extends StatelessWidget {
  final TextEditingController addressController, cityController, provinceController, postcodeController;
  final Function onSubmit;

  AddressFormPage({this.addressController, this.cityController, this.provinceController, this.postcodeController, this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Layout1(
      bottom: RegisterAddressForm(
        addressController: addressController,
        cityController: cityController,
        provinceController: provinceController,
        postcodeController: postcodeController,
        onSubmit: onSubmit,
     ),
    );
  }
}
