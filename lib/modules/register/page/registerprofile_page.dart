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
  ImagePicker _picker = ImagePicker();
  List<String> _listGender = gender;
  String _valGender, _date, _firstName, _lastName, _picture_path;

  TextEditingController _firstnameController = new TextEditingController();
  TextEditingController _lastnameController = new TextEditingController();

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

  void onGender(String val) {
    setState(() {
      _valGender = val;
    });
  }
  @override
  Widget build(BuildContext context) {

    void onImage() async {
      File _picture;

      PickedFile _file = await _picker.getImage(source: ImageSource.gallery);
      _file != null ? _picture = File(_file.path) : print('no pic');
      final String _picture_name = basename(_file.path);
      setState(() {
        _picture_path = _file.path;
      });
      final UserData _user = UserData(
          picture: _picture,
          picture_name: _picture_name,
      );
      BlocProvider.of<RegisterBloc>(context).add(SetPicture(_user));
    }

    void onSubmit() {
      final UserData _user = UserData(
          first_name: _firstName,
          last_name: _lastName,
          birth_date: _date,
          gender: _valGender
      );
      BlocProvider.of<RegisterBloc>(context).add(SetProfile(_user));
    }

    void onDate() {
      DatePicker.showDatePicker(context, showTitleActions: true, onChanged: (date) {
        print('change $date in time zone ' + date.timeZoneOffset.inHours.toString());
      }, onConfirm: (date) {
        print('confirm $date');
        setState(() {
          _date = formatDate(date, [yyyy, '-', mm, '-', dd]);
        });
      }, currentTime: DateTime.now());
    }

    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (BuildContext context, RegisterState state){
        if(state is RegisterProfileSet) {
          if(state.registered) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushReplacementNamed('/registerAddress');
            });
          }
        }

        return ProfileFormPage(
          getPhoto: (context) => onImage(),
          picture: _picture_path,
          gender: _valGender,
          genders: _listGender,
          onGender: (val) => onGender(val),
          onDate: (context) => onDate(),
          date: _date,
          firstnameController: _firstnameController,
          lastnameController: _lastnameController,
          onSubmit: (context) => onSubmit(),
        );
      },
    );

  }
}