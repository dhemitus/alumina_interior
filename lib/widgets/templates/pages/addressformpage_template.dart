import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';

class AddressFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Layout1(
      bottom: RegisterAddressForm(),
    );
  }
}
