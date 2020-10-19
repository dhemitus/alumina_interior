import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:alumina/modules/modules.dart';
import 'package:alumina/shared/shared.dart' as Utils;
import 'package:alumina/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Utils.initScreen(context);
    return BlocBuilder<InitBloc, InitState>(
      builder: (BuildContext context, InitState state) {
        if (state is InitLoading) {
          return LoadPage();
        } else if (state is InitLoaded) {
          return CheckingPage();
        } else if (state is InitError) {
          return ErrorPage();
        } else {
          return WaitPage();
        }
      }
    );
  }
}
