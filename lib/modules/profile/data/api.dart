import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileProvider {
  Future<dynamic> getProfile() async {
    CollectionReference _user =
        FirebaseFirestore.instance.collection('profile');
    try {
      SharedPreferences _storage = await SharedPreferences.getInstance();
      String _uid = _storage.getString('uid');

      final QuerySnapshot _raw =
          await _user.where('uid', isEqualTo: _uid).get();
      print(_raw.docs.first.get('picture_name'));

      return _raw;
    } catch (e) {
      return false;
    }
  }
}
