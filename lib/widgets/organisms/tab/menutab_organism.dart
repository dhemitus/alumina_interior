import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/models/models.dart';

class MenuTab extends StatefulWidget {
  final Function onTap;
  final List<MenuContent> menu;

  MenuTab({this.onTap, this.menu});

  @override
  _MenuTabState createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab> {
  String _name = 'Home';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.menu.map((MenuContent item) {
        return ClipButton(
          icon: item.name == _name ? item.active : item.inactive,
          width: 36.0.w,
          height: 34.0.h,
          onTap: (context) {
            setState(() {
              _name = item.name;
            });
            if (widget.onTap != null) widget.onTap(item.name);
          },
        );
      }).toList(),
    );
  }
}
