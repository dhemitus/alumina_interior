import 'dart:io';

class AuthUser extends Object {
  final String username;
  final String password;
  final String fullname;

  AuthUser({this.username, this.password, this.fullname});
}

class UserData extends Object {
  final String firstName;
  final String lastName;
  final String gender;
  final String birthDate;
  final String token;
  final String uid;
  final String pictureName;
  final File picture;
  final String address;
  final String city;
  final String province;
  final String postcode;
  final String phone;
  final String createAt;
  final String updateAt;

  UserData(
      {this.firstName,
      this.lastName,
      this.gender,
      this.birthDate,
      this.token,
      this.uid,
      this.picture,
      this.pictureName,
      this.address,
      this.city,
      this.province,
      this.postcode,
      this.phone,
      this.createAt,
      this.updateAt});
}
