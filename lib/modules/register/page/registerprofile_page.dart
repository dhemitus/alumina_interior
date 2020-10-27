import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:alumina/widgets/widgets.dart';

class RegisterProfilePage extends StatefulWidget {
  @override
  _RegisterProfilePageState createState() => _RegisterProfilePageState();
}

class _RegisterProfilePageState extends State<RegisterProfilePage> {
  File _picture;
  ImagePicker _picker = ImagePicker();
  List _listGender = ["Laki-laki", "Perempuan"];
  String _valGender, _date, _firstName, _lastName;

  TextEditingController _firstnameController = new TextEditingController();
  TextEditingController _lastnameController = new TextEditingController();

  _getImage() async {
    final _file = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      _file != null ? _picture = File(_file.path) : print('no pic');
      print(_file.path);
    });
  }

  _printFirstname() {
    setState(() {
      _firstName = _firstnameController.text;
      print(_firstName);
    });
  }

  _printLastName() {
    setState(() {
      _lastName = _lastnameController.text;
      print(_lastName);
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
            _date = date.toString();
          });
        }, currentTime: DateTime.now())
      },
      date: _date,
      firstnameController: _firstnameController,
      lastnameController: _lastnameController,
      onSubmit: (context) {
        print(_firstName);
        print(_lastName);
      },
    );
  }
}