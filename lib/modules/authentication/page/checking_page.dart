import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:alumina/modules/modules.dart';
import 'package:alumina/shared/shared.dart' as Utils;
import 'package:alumina/widgets/widgets.dart';

class CheckingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (BuildContext context, AuthenticationState state) {
        if (state is AuthenticationIsSignIn) {
          print(state.user);
          return LoadPage();
          //frontpage
        } else {
          return AuthenticationPage();
        }
      }
    );
  }
}