import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:alumina/modules/modules.dart';

Future<void> main() async {
  Bloc.observer = SimpleBlocObserver();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<InitBloc>(
        create: (context) => InitBloc(InitRepository())..add(StartInit()),
      ),
      BlocProvider<MessageBloc>(
        create: (context) =>
            MessageBloc(MessageRepository())..add(StartMessage()),
      ),
      BlocProvider<RegisterBloc>(
        create: (context) => RegisterBloc(RegisterRepository())
          ..add(IsRegisterd())
          ..add(GetProfile()),
      ),
      BlocProvider<AuthenticationBloc>(
        create: (context) => AuthenticationBloc(
            AuthenticationRepository(), BlocProvider.of<RegisterBloc>(context))
          ..add(IsSignInAuthentication()),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alumina Interior',
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/phoneVerify': (BuildContext context) => PhoneVerifyPage(),
        '/registerAddress': (BuildContext context) => RegisterAddressPage(),
        '/loginEmail': (BuildContext context) => LoginEmailPage(),
        '/registerEmail': (BuildContext context) => RegisterEmailPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocBuilder<MessageBloc, MessageState>(
          builder: (BuildContext context, MessageState state) {
        return HomePage();
      }),
    );
  }
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onChange(Cubit cubit, Change change) {
    print(change);
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(cubit, error, stackTrace);
  }
}
