import 'package:flutter/material.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/modules/modules.dart';

class FrontPage extends StatefulWidget {
  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  String _menu = 'Home';

  void _onTab(String val) {
    setState(() {
      _menu = val;
    });
  }

  Widget _content() {
    switch (_menu) {
      case "Setting":
        return SettingPage();
        break;
      case "archive":
        return Container();
        break;
      default:
        return Container();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FrontDisplayPage(
      onTab: _onTab,
      content: _content(),
    );
  }
}
