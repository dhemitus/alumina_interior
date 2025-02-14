import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:alumina/modules/modules.dart';
//import 'package:alumina/shared/shared.dart' as Utils;
//import 'package:alumina/widgets/widgets.dart';

class CheckingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
        builder: (BuildContext context, RegisterState state) {
      print(state);
      if (state is RegisterCheck) {
        print('check ${state.registered}');
        if (state.registered) {
//            return LoadPage(title: 'register ${state.registered}',);
          print(state.registered);
          return FrontPage();
          //front
        } else {
          print('uncheck ${state.registered}');
          return RegisterProfilePage();
//            return AuthenticationPage();
        }
      } else {
        print('nocheck false');
        return RegisterProfilePage();
//          return AuthenticationPage();
      }
    });
  }
}
