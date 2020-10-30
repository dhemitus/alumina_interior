import 'dart:io';
import 'package:alumina/modules/modules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:date_format/date_format.dart';
import 'package:path/path.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/models/models.dart';

class RegisterProfilePage extends StatefulWidget {
  @override
  _RegisterProfilePageState createState() => _RegisterProfilePageState();
}

class _RegisterProfilePageState extends State<RegisterProfilePage> {
  File _picture;
  String _picture_name;
  PickedFile _file;
  ImagePicker _picker = ImagePicker();
  List _listGender = ["Laki-laki", "Perempuan"];
  String _valGender, _date, _firstName, _lastName;

  TextEditingController _firstnameController = new TextEditingController();
  TextEditingController _lastnameController = new TextEditingController();

  _getImage() async {
    _file = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      _file != null ? _picture = File(_file.path) : print('no pic');
      _picture_name = basename(_file.path);
      print(_picture_name);
    });
  }

  _printFirstname() {
    setState(() {
      _firstName = _firstnameController.text;
    });
  }

  _printLastName() {
    setState(() {
      _lastName = _lastnameController.text;
    });
  }

  @override
  void initState() {
    _firstnameController.addListener(_printFirstname);
    _lastnameController.addListener(_printLastName);
    super.initState();
  }

  @override
  void dispose() {
    _firstnameController.removeListener(_printFirstname);
    _lastnameController.removeListener(_printLastName);

    _firstnameController.dispose();
    _lastnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileFormPage(
      getPhoto: (context) => _getImage(),
      picture: _file != null ? _file.path : null,
      gender: _valGender,
      genders: _listGender,
      onGender: (val) => {
        setState(() {
          _valGender = val;
        })
      },
      onDate: (context) =>{
        DatePicker.showDatePicker(context, showTitleActions: true, onChanged: (date) {
          print('change $date in time zone ' + date.timeZoneOffset.inHours.toString());
        }, onConfirm: (date) {
          print('confirm $date');
          setState(() {
            _date = formatDate(date, [yyyy, '-', mm, '-', dd]);
          });
         }, currentTime: DateTime.now())
      },
      date: _date,
      firstnameController: _firstnameController,
      lastnameController: _lastnameController,
      onSubmit: (context) {
        final UserData _user = UserData(
          first_name: _firstName,
          last_name: _lastName,
          picture: _picture,
          picture_name: _picture_name,
          birth_date: _date,
          gender: _valGender
        );
        BlocProvider.of<RegisterBloc>(context).add(SetRegister(_user));
      },
    );
  }
}