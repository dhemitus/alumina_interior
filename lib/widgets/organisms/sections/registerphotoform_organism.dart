import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/shared/shared.dart' as Iconic;

class RegisterPhotoForm extends StatelessWidget {
  final Function onTap;

  RegisterPhotoForm({this.onTap});

  @override
  Widget build(BuildContext context) {
    return CircleButton(
      icon: Iconic.imageDDE9FB,
      onTap: onTap,
    );
  }
}