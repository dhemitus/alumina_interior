import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:alumina/shared/shared.dart' as Utils;
import 'package:alumina/modules/modules.dart';

Future<void> main() async {
  Utils.initSystem();
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthenticationBloc>(
        create: (context) => AuthenticationBloc(AuthenticationRepository()),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alumina Interior',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Alumina Interior'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final TextEditingController _controllerTopic = TextEditingController();
  String token = '';
  bool isSubscribed = false;

  static Future<dynamic> onBackgroundMessageHandler(Map<String, dynamic> message) {
    debugPrint('onBackgroundMessageHandler');
    if (message.containsKey('data')) {
      final dynamic data = message['data'];
      String name = data['name'];
      String age = data['age'];
      String page = data['page'];
      debugPrint('name: $name & age: $age & page: $page');
    }

    /*if (message.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = message['notification'];
  }*/

    // Or do other work.
    return Future.value(true);
  }

  @override
  void initState() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        debugPrint('onMessage');
        _getDataFcm(message, 'onMessage');
      },
      onBackgroundMessage: onBackgroundMessageHandler,
      onResume: (Map<String, dynamic> message) async {
        debugPrint('onResume');
        _getDataFcm(message, 'onResume');
      },
      onLaunch: (Map<String, dynamic> message) async {
        debugPrint('onLaunch');
        _getDataFcm(message, 'onLaunch');
      },
    );

    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(
            sound: true, badge: true, alert: true, provisional: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      debugPrint("Settings registered: $settings");
    });
    _firebaseMessaging.getToken().then((String token) {
      debugPrint('getToken: $token');
      setState(() {
        this.token = token;
      });
    });
    super.initState();
  }

  void _getDataFcm(Map<String, dynamic> message, String type) {
    try {
      /*debugPrint('message.length: ${message.keys.length}');
      debugPrint('message: $message');
      var aps = message['aps'];
      var name = message['name'];
      var age = message['age'];
      debugPrint('name: $name & age: $age');*/

      /*var data = message['data'];
      debugPrint('data: $data');
      String name = data['name'];
      String age = data['age'];
      String page = data['page'];
      debugPrint('name: $name & age: $age & page: $page');*/
      String page = '';
      String name = '';
      String age = '';
      if (Platform.isIOS) {
        name = message['name'];
        age = message['age'];
        page = message['page'];
      } else if (Platform.isAndroid) {
        var data = message['data'];
        name = data['name'];
        age = data['age'];
        page = data['page'];
      }
      debugPrint('name: $name & age: $age & page: $page');
      switch (type) {
        case 'onResume':
        case 'onLaunch':
          {
            if (page == 'detail_page') {
//              _navigateToDetailPage();
            }
            break;
          }
        default:
          {
            debugPrint('unknown type in getDataFcm');
          }
      }
    } catch (error) {
      debugPrint("error: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    Utils.initScreen(context);
      return AuthenticationPage();
/*    return Scaffold(
      key: _scaffoldState,
      body: SafeArea(
        child: Column(
          children: [
            RegisterProfileForm()
          ],
        )
      ),
    );*/
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
