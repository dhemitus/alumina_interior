import 'package:flutter/material.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/models/models.dart';

class SettingPage extends StatelessWidget {
  List<Widget> _list() {
    List<Widget> _items = [];

    return _items;
  }

  @override
  Widget build(BuildContext context) {
    void _onPage(String val) {
      print(val);
      switch (val) {
        case 'profile':
          Navigator.of(context).pushNamed('/profile');
          break;
        case 'address':
          Navigator.of(context).pushNamed('/address');
          break;
        case 'phone number':
          Navigator.of(context).pushNamed('/phone');
          break;
      }
    }

    return SettingMenu(
      onTap: _onPage,
      menu: menuSetting,
    );
  }
}
