import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/modules/modules.dart';

class PhoneVerifyPage extends StatefulWidget {
  @override
  _PhoneVerifyPageState createState() => _PhoneVerifyPageState();
}

class _PhoneVerifyPageState extends State<PhoneVerifyPage> {
  String _phone, _key;

  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _keyController = new TextEditingController();

  _printPhone() {
    setState(() {
      _phone = _phoneController.text;
    });
  }

  _printKey() {
    setState(() {
      _key = _keyController.text;
    });
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
    BlocProvider.of<AuthenticationBloc>(context)
        .add(PhoneVerifyAuthentication(phone: _phone));
  }

  void onSubmit() {}

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (BuildContext context, AuthenticationState state) {
      if (state is AuthenticationPhoneVerify) {
        print(state.phone);
      }
      return PhoneFormPage(
        formBox: RegisterPhoneForm(
          phoneController: _phoneController,
          onSubmit: (context) => onVerify(),
        ),
        confirmBox: RegisterKeyForm(
          keyController: _keyController,
          onSubmit: (context) => onSubmit(),
        ),
      );
    });
  }
}
