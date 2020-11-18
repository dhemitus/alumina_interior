import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/modules/modules.dart';
import 'package:alumina/models/models.dart';

class PhonePage extends StatefulWidget {
  @override
  _PhonePageState createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  String _phone, _key;
  AuthPhone _result;

  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _keyController = new TextEditingController();

  _printPhone() {
//    setState(() {
    _phone = _phoneController.text;
//    });
  }

  _printKey() {
//    setState(() {
    _key = _keyController.text;
//    });
  }

  @override
  void initState() {
    _phoneController.addListener(_printPhone);
    _keyController.addListener(_printKey);
    super.initState();
  }

  @override
  void dispose() {
    _phoneController.removeListener(_printPhone);
    _keyController.removeListener(_printKey);

    _phoneController.dispose();
    _keyController.dispose();
    super.dispose();
  }

  void onVerify() {
    setState(() {
      _phone = _phoneController.text;
    });
    BlocProvider.of<AuthenticationBloc>(context)
        .add(PhoneVerifyAuthentication(phone: _phone));
  }

  void onSubmit() {
    _key = _keyController.text;
    print('set key $_key');
    print(_result.message);
    if (_result.message == 'codeSent') {
      BlocProvider.of<AuthenticationBloc>(context).add(OtpVerifyAuthentication(
          phone: AuthPhone(phone: _phone, verId: _result.verId, otp: _key)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
        builder: (BuildContext context, ProfileState state) {
      if (state is ProfileGeted) {
        if (state.registered != false) {
          QueryDocumentSnapshot _data = state.registered.docs.first;
          _phone = _data.get('phone');
        }
      }
      return SettingEditPage(
          onTap: (context) => Navigator.of(context).pop(),
          formBox: Column(
            children: [
              RegisterPhoneForm(
                phoneController: _phoneController..text = _phone,
                onSubmit: (context) => onVerify(),
              ),
              RegisterKeyForm(
                keyController: _keyController,
                onSubmit: (context) => onSubmit(),
              ),
            ],
          ));
    });
  }
}
