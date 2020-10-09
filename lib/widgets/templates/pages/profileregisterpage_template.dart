import 'package:flutter/material.dart';

import 'package:alumina/widgets/widgets.dart';

class ProfileRegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Layout1(
      top: RegisterPhotoForm(),
      middle: ContentHeader(
        head: 'isilah dengan data yang benar dan akurat ',
        body: 'pastikan terisi semua kolom-kolom di bawah ini',
      ),
      bottom: RegisterProfileForm(),
    );
  }
}
