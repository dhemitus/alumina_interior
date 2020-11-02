import 'package:flutter/material.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/shared/shared.dart' as Iconic;
import 'package:alumina/shared/shared.dart' as Utils;

class RegisterPhotoForm extends StatelessWidget {
  final Function onTap;
  final String picture;

  RegisterPhotoForm({this.onTap, this.picture});

  @override
  Widget build(BuildContext context) {
    if(picture == null) {
      return CircleButton(
        icon: Iconic.imageDDE9FB,
        onTap: onTap,
      );
    } else {
     return AvatarButton(
       image: Utils.imageContainer(picture),
       onTap: onTap,
     );
    }
  }
}