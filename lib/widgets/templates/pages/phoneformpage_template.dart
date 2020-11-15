import 'package:flutter/material.dart';

import 'package:alumina/widgets/widgets.dart';

class PhoneFormPage extends StatelessWidget {
  final Widget formBox, confirmBox;

  PhoneFormPage({this.formBox, this.confirmBox});

  @override
  Widget build(BuildContext context) {
    return Layout2(
      middle: Container(
        alignment: Alignment.bottomLeft,
        child: ContentHeader(
          head: '\n\n\n',
          body: 'nomor telepon diawali dengan +62',
        ),
      ),
      bottom: Column(
        children: [
          formBox,
          confirmBox,
        ],
      ),
    );
  }
}
