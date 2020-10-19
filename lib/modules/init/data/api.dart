import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:alumina/shared/shared.dart' as Utils;

class InitProvider {

  Future<bool> initialize() async {
    Utils.initSystem();

    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    return true;
  }
}