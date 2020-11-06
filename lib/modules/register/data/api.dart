import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:alumina/models/models.dart';

class RegisterProvider {
  Future<bool> isRegistered({User user}) async {
    //user check on server
    SharedPreferences _storage = await SharedPreferences.getInstance();
    return _storage.getBool('registered') ?? false;
  }

  Future<bool> addRegister(User user) async {
    CollectionReference _user = FirebaseFirestore.instance.collection('profile');

    try {
      SharedPreferences _storage = await SharedPreferences.getInstance();
      _storage.setString('uid', user.uid);

      final QuerySnapshot _raw = await _user.where('uid', isEqualTo: user.uid).get();

      if(_raw.docs.length <= 0) {
        await _user
            .add({'uid': user.uid, 'createAt': FieldValue.serverTimestamp()});
      }
      return true;
    } catch(e) {
      return false;
    }
  }

  Future<dynamic> setPicture(UserData user) async {
    CollectionReference _user = FirebaseFirestore.instance.collection('profile');
    StorageReference _fstorage = FirebaseStorage.instance.ref().child('profile/${user.first_name}_${user.picture_name}');
    StorageUploadTask _upload = _fstorage.putFile(user.picture);

    try {
      StorageTaskSnapshot _complete = await _upload.onComplete;
      String _url = await _complete.ref.getDownloadURL();

      SharedPreferences _storage = await SharedPreferences.getInstance();
      String _uid = _storage.getString('uid');

      final QuerySnapshot _raw = await _user.where('uid', isEqualTo: _uid).get();
      final String _pid = _raw.docs.first.id;

      await _user.doc(_pid).update({
        'picture_name': user.picture_name,
        'picture': _url,
        'updateAt': FieldValue.serverTimestamp()
      });
      return await _user.where('uid', isEqualTo: _uid).get();
    } catch(e) {
      return false;
    }
  }

  Future<bool> setProfile(UserData user) async {
    CollectionReference _user = FirebaseFirestore.instance.collection('profile');
    try {

      SharedPreferences _storage = await SharedPreferences.getInstance();
      String _uid = _storage.getString('uid');

      final QuerySnapshot _raw = await _user.where('uid', isEqualTo: _uid).get();
      final String _pid = _raw.docs.first.id;

      await _user.doc(_pid).update({
        'first_name': user.first_name,
        'last_name': user.last_name,
        'gender': user.gender,
        'birth_date': user.birth_date,
        'updateAt': FieldValue.serverTimestamp()
      });
      return true;
    } catch(e) {
      return false;
    }
  }

  Future<bool> setAddress(UserData user) async {
    CollectionReference _user = FirebaseFirestore.instance.collection('profile');
    try {

      SharedPreferences _storage = await SharedPreferences.getInstance();
      String _uid = _storage.getString('uid');

      final QuerySnapshot _raw = await _user.where('uid', isEqualTo: _uid).get();
      final String _pid = _raw.docs.first.id;

      await  _user.doc(_pid).update({
        'address': user.address,
        'city': user.city,
        'province': user.province,
        'postcode': user.postcode,
        'updateAt': FieldValue.serverTimestamp()
      });
      return true;
    } catch(e) {
      return false;
    }
  }

  Future<dynamic> getProfile() async {
    CollectionReference _user = FirebaseFirestore.instance.collection('profile');
    try {
      SharedPreferences _storage = await SharedPreferences.getInstance();
      String _uid = _storage.getString('uid');

      final QuerySnapshot _raw = await _user.where('uid', isEqualTo: _uid).get();
      print(_raw.docs.first.get('picture_name'));

      return _raw;
    } catch(e) {
      return false;
    }
  }
}