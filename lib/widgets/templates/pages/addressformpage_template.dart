import 'package:flutter/material.dart';

import 'package:alumina/widgets/widgets.dart';

class AddressFormPage extends StatelessWidget {
  final Widget formBox;

  AddressFormPage({@required this.formBox});

  @override
  Widget build(BuildContext context) {
    return Layout1(
      bottom: formBox,
    );
  }
}
