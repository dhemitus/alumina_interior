import 'package:alumina/modules/modules.dart';
import 'package:flutter/material.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginEmailPage extends StatefulWidget {
  @override
  _LoginEmailPageState createState() => _LoginEmailPageState();
}

class _LoginEmailPageState extends State<LoginEmailPage> {
  String _email, _password;

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  _printEmail() {
    setState(() {
      _email = _emailController.text;
    });
  }

  _printPassword() {
    setState(() {
      _password = _passwordController.text;
    });
  }

  @override
  void initState() {
    _emailController.addListener(_printEmail);
    _passwordController.addListener(_printPassword);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.removeListener(_printEmail);
    _passwordController.removeListener(_printPassword);

    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void onRegister() {
    Navigator.of(context).pushNamed('/registerEmail');
  }

  void onSubmit() {
    final AuthUser _user = AuthUser(
      username: _email,
      password: _password
    );
    BlocProvider.of<AuthenticationBloc>(context).add(EmailSignInAuthentication(user: _user));
  }

  Widget content() {
    return LoginFormPage(
      formBox: LoginEmailForm(
        emailController: _emailController,
        passwordController: _passwordController,
        link: 'register',
        onLink: (context) => onRegister(),
        onSubmit: (context) => onSubmit(),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (BuildContext context, AuthenticationState state) {
          if(state is AuthenticationSignIn) {
            return CheckingPage();
//            return RegisterProfilePage();
            //frontpage
          } else {
            return content();
          }
        }
    );
  }
}
