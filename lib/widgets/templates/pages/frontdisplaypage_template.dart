import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/models/models.dart';

class FrontDisplayPage extends StatelessWidget {
  final Function onTab;
  final Widget content;
  final List<MenuContent> menu;

  FrontDisplayPage({this.onTab, this.content, this.menu});

  @override
  Widget build(BuildContext context) {
    return Layout4(
      left: Padding(
        padding: EdgeInsets.only(top: 28.0.h),
        child: Center(
          child: MenuTab(
          onTap: onTab,
          menu: menu,
        )),
      ),
      right: content,
    );
  }
}
