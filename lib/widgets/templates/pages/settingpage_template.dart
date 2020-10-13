import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/shared/shared.dart' as Iconic;
import 'package:alumina/shared/shared.dart' as Styles;

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Layout1(
      bottom: LineButton(
        mode: Styles.StyleType.warning,
        icon: Iconic.smartphone,
        text: 'Setup',
      ),
    );
  }
}
