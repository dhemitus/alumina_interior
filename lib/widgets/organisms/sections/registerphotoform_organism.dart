import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/shared/shared.dart' as Iconic;

class RegisterPhotoForm extends StatefulWidget {
  @override
  _RegisterPhotoFormState createState() => _RegisterPhotoFormState();
}

class _RegisterPhotoFormState extends State<RegisterPhotoForm> {
  @override
  Widget build(BuildContext context) {
    return CircleButton(
      icon: Iconic.imageDDE9FB,
    );
  }
}
