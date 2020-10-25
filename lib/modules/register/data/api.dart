import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterProvider {
  Future<bool> isRegistered({User user}) async {
    //user check on server
    SharedPreferences _storage = await SharedPreferences.getInstance();
    return _storage.getBool('registered') ?? false;
  }

  Future<bool> addRegister(User user) async {
    CollectionReference _user = FirebaseFirestore.instance.collection('profile');

    try {
      await _user.add({
        'uid': user.uid,
        'createAt': FieldValue.serverTimestamp()
      });
      return true;
    } catch(e) {
      return false;
    }
  }
}