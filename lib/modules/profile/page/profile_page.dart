import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:date_format/date_format.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/models/models.dart';
import 'package:alumina/modules/modules.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<String> _listGender = gender;
  String _valGender, _date, _firstName, _lastName, _picturePath;

  TextEditingController _firstnameController = new TextEditingController();
  TextEditingController _lastnameController = new TextEditingController();

  _printFirstname() {
//    setState(() {
    _firstName = _firstnameController.text;
//    });
  }

  _printLastName() {
//    setState(() {
    _lastName = _lastnameController.text;
//    });
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

  void onSubmit() {
    _firstName = _firstnameController.text;
    _lastName = _lastnameController.text;
    final UserData _user = UserData(
        firstName: _firstName,
        lastName: _lastName,
        birthDate: _date,
        gender: _valGender);
    BlocProvider.of<RegisterBloc>(context).add(SetProfile(_user));
  }

  void onDate() {
    DatePicker.showDatePicker(context, showTitleActions: true,
        onChanged: (date) {
      print('change $date in time zone ' +
          date.timeZoneOffset.inHours.toString());
    }, onConfirm: (date) {
      print('confirm $date');
      setState(() {
        _date = formatDate(date, [yyyy, '-', mm, '-', dd]);
      });
    }, currentTime: DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
        builder: (BuildContext context, ProfileState state) {
      if (state is ProfileGeted) {
        if (state.registered != false) {
          QueryDocumentSnapshot _data = state.registered.docs.first;
          _picturePath = _data.get('picture');
          _valGender = _data.get('gender');
          _firstName = _data.get('first_name');
          _lastName = _data.get('last_name');
          _date = _data.get('birth_date');
        }
      }
      return SettingEditPage(
        onTap: (context) => Navigator.of(context).pop(),
        photoBox: RegisterPhotoPage(picture: _picturePath),
        formBox: ProfileForm(
          gender: _valGender,
          genders: _listGender,
          onGender: (val) => onGender(val),
          onDate: (context) => onDate(),
          date: _date,
          firstnameController: _firstnameController
            ..value = TextEditingValue(text: _firstName),
          lastnameController: _lastnameController..text = _lastName,
          onSubmit: (context) => onSubmit(),
        ),
      );
    });
  }
}
