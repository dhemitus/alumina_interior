import 'package:flutter/material.dart';

import 'package:alumina/widgets/widgets.dart';

class FrontPage extends StatelessWidget {
  void _onTab(String val) {
    print('tab $val');
  }

  @override
  Widget build(BuildContext context) {
    return FrontDisplayPage(onTab: _onTab);
  }
}
