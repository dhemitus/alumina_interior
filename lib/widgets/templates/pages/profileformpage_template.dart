import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';

class ProfileFormPage extends StatelessWidget {
  final Widget photoBox, formBox;

  ProfileFormPage({@required this.photoBox, @required this.formBox});

  @override
  Widget build(BuildContext context) {
    return Layout1(
      middle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          photoBox,
          SizedBox(
            height: 56.0.h,
          ),
          ContentHeader(
            head: 'isilah dengan data yang benar dan akurat ',
            body: 'pastikan terisi semua kolom-kolom di bawah ini',
          ),
        ],
      ),
      bottom: formBox,
    );
  }
}
