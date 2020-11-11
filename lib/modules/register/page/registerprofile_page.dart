import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:date_format/date_format.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/models/models.dart';
import 'package:alumina/modules/modules.dart';

class RegisterProfilePage extends StatefulWidget {
  @override
  _RegisterProfilePageState createState() => _RegisterProfilePageState();
}

class _RegisterProfilePageState extends State<RegisterProfilePage> {
  List<String> _listGender = gender;
  String _valGender, _date, _firstName, _lastName;
  String _picturePath;

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
    print('cuk');
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
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (BuildContext context, RegisterState state) {
        if (state is RegisterProfileSet) {
          if (state.registered) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushReplacementNamed('/registerAddress');
            });
          }
        }

        if (state is ProfileGeted) {
          if (state.registered != false) {
            QueryDocumentSnapshot _data = state.registered.docs.first;
            _picturePath = _data.get('picture');
          }
        }

        if (state is RegisterPictureSet) {
          if (state.registered != false) {
            QueryDocumentSnapshot _data = state.registered.docs.first;
            _picturePath = _data.get('picture');
          }
        }

        return ProfileFormPage(
          photoBox: RegisterPhotoPage(picture: _picturePath),
          formBox: ProfileForm(
            gender: _valGender,
            genders: _listGender,
            onGender: (val) => onGender(val),
            onDate: (context) => onDate(),
            date: _date,
            firstnameController: _firstnameController,
            lastnameController: _lastnameController,
            onSubmit: (context) => onSubmit(),
          ),
        );
      },
    );
  }
}
