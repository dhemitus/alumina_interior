import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/shared/shared.dart' as Iconic;
import 'package:alumina/shared/shared.dart' as Styles;

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Layout1(
      bottom: DetailButton(
        head: 'https://images.unsplash.com/photo-1600421857374-6afb9d5c8615?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
        body: 'gunakan e-mail aktif anda untuk masuk atau registrasi',
        foot: 'Rp. 20.000.000',
      ),
    );
  }
}
