import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/models/models.dart';
import 'package:alumina/modules/modules.dart';

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  String _address, _city, _province, _postcode;

  TextEditingController _addressController = new TextEditingController();
  TextEditingController _cityController = new TextEditingController();
  TextEditingController _provinceController = new TextEditingController();
  TextEditingController _postcodeController = new TextEditingController();

  _printAddress() {
    setState(() {
      _address = _addressController.text;
    });
  }

  _printCity() {
    setState(() {
      _city = _cityController.text;
    });
  }

  _printProvince() {
    setState(() {
      _province = _provinceController.text;
    });
  }

  _printPostCode() {
    setState(() {
      _postcode = _postcodeController.text;
    });
  }

  @override
  void initState() {
    _addressController.addListener(_printAddress);
    _cityController.addListener(_printCity);
    _provinceController.addListener(_printProvince);
    _postcodeController.addListener(_printPostCode);
    super.initState();
  }

  @override
  void dispose() {
    _addressController.removeListener(_printAddress);
    _cityController.removeListener(_printCity);
    _provinceController.removeListener(_printProvince);
    _postcodeController.removeListener(_printPostCode);

    _addressController.dispose();
    _cityController.dispose();
    _provinceController.dispose();
    _postcodeController.dispose();
    super.dispose();
  }

  void onSubmit() {
    final UserData _user = UserData(
        address: _address,
        city: _city,
        province: _province,
        postcode: _postcode);
    BlocProvider.of<RegisterBloc>(context).add(SetAddress(_user));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
        builder: (BuildContext context, ProfileState state) {
      if (state is ProfileGeted) {
        if (state.registered != false) {
          QueryDocumentSnapshot _data = state.registered.docs.first;
          _address = _data.get('address');
          _city = _data.get('city');
          _province = _data.get('province');
          _postcode = _data.get('postcode');
        }
      }
      return SettingEditPage(
        onTap: (context) => Navigator.of(context).pop(),
        formBox: AddressForm(
          addressController: _addressController,
          cityController: _cityController,
          provinceController: _provinceController,
          postcodeController: _postcodeController,
          onSubmit: (context) => onSubmit(),
        ),
      );
    });
  }
}
