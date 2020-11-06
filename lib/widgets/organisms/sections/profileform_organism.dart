import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';

class ProfileForm extends StatelessWidget {
  final List<dynamic> genders;
  final dynamic gender;
  final Function onGender, onDate, onSubmit;
  final String date;
  final TextEditingController firstnameController, lastnameController;

  ProfileForm({this.genders, this.gender, this.onGender, this.onDate, this.date, this.onSubmit, this.firstnameController, this.lastnameController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 32.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InputText(
            hint: 'nama depan',
            controller: firstnameController,
          ),
          SizedBox(
            height: 16.0.w,
          ),
          InputText(
            hint: 'nama belakang',
            controller: lastnameController,
          ),
          SizedBox(
            height: 16.0.w,
          ),
          InputOption(
            hint: "jenis kelamin",
            values: genders,
            value: gender,
            onChange: onGender,
          ),
          SizedBox(
            height: 16.0.w,
          ),
          SecondaryButton(
            text: date != null ? date : 'tanggal lahir',
            onTap: onDate,
          ),
          SizedBox(
            height: 16.0.w,
          ),
          PrimaryButton(
            text: 'lanjutkan',
            onTap: onSubmit,
          )
        ],
      ),
    );
  }
}
