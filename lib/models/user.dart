import 'dart:io';

class AuthUser extends Object {
  final String username;
  final String password;
  final String fullname;

  AuthUser({this.username, this.password, this.fullname});
}

class UserData extends Object {
  final String first_name;
  final String last_name;
  final String gender;
  final String birth_date;
  final String token;
  final String uid;
  final String picture_name;
  final File picture;
  final String address;
  final String city;
  final String province;
  final String postcode;
  final String phone;
  final String createAt;
  final String updateAt;

  UserData(
      {this.first_name,
      this.last_name,
      this.gender,
      this.birth_date,
      this.token,
      this.uid,
      this.picture,
      this.picture_name,
      this.address,
      this.city,
      this.province,
      this.postcode,
      this.phone,
      this.createAt,
      this.updateAt});
}
