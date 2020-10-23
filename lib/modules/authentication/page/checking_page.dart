import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:alumina/modules/modules.dart';
import 'package:alumina/shared/shared.dart' as Utils;
import 'package:alumina/widgets/widgets.dart';

class CheckingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (BuildContext context, RegisterState state) {
        if(state is RegisterCheck) {
          if(state.registered) {
            return LoadPage();
            print(state.registered);
          } else {
            print(state.registered);
            return AuthenticationPage();
          }
        } else {
          return AuthenticationPage();
        }
      }
    );
  }
}