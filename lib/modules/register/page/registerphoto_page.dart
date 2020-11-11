import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/models/models.dart';
import 'package:alumina/modules/modules.dart';

class RegisterPhotoPage extends StatelessWidget {
  final String picture;

  RegisterPhotoPage({this.picture});

  @override
  Widget build(BuildContext context) {
    void onImage() async {
      ImagePicker _picker = ImagePicker();
      File _picture;

      PickedFile _file = await _picker.getImage(source: ImageSource.gallery);
      _file != null ? _picture = File(_file.path) : print('no pic');
      final String _pictureName = basename(_file.path);
      final UserData _user = UserData(
        picture: _picture,
        pictureName: _pictureName,
      );
      BlocProvider.of<RegisterBloc>(context).add(SetPicture(_user));
    }

    return RegisterPhotoForm(
      onTap: (context) => onImage(),
      picture: picture,
    );
  }
}
