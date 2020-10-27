import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alumina/widgets/widgets.dart';

class ProfileFormPage extends StatelessWidget {
  final Function getPhoto;
  final List<dynamic> genders;
  final dynamic gender;
  final Function onGender, onDate, onSubmit;
  final String date;
  final TextEditingController firstnameController, lastnameController;

  ProfileFormPage({this.getPhoto, this.genders, this.gender, this.onGender, this.onDate, this.date, this.onSubmit, this.firstnameController, this.lastnameController});

  @override
  Widget build(BuildContext context) {
    return Layout1(
      middle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RegisterPhotoForm(onTap: getPhoto,),
          SizedBox(height: 56.0.h,),
          ContentHeader(
            head: 'isilah dengan data yang benar dan akurat ',
            body: 'pastikan terisi semua kolom-kolom di bawah ini',
          ),
        ],
      ),
      bottom: RegisterProfileForm(
        genders: genders,
        gender: gender,
        onGender: onGender,
        date: date,
        onDate: onDate,
        firstnameController: firstnameController,
        lastnameController: lastnameController,
        onSubmit: onSubmit,
      ),
    );
  }
}
