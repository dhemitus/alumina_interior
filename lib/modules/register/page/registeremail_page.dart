import 'package:alumina/modules/modules.dart';
import 'package:flutter/material.dart';

import 'package:alumina/widgets/widgets.dart';
import 'package:alumina/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterEmailPage extends StatefulWidget {
  @override
  _RegisterEmailPageState createState() => _RegisterEmailPageState();
}

class _RegisterEmailPageState extends State<RegisterEmailPage> {
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

  void onLogin() {
    Navigator.of(context).pop();
  }

  void onSubmit() {
    final AuthUser _user = AuthUser(
        username: _email,
        password: _password
    );
    BlocProvider.of<AuthenticationBloc>(context).add(EmailSignUpAuthentication(user: _user));
  }

  @override
  Widget build(BuildContext context) {

    return LoginFormPage(
      formBox: LoginEmailForm(
        emailController: _emailController,
        passwordController: _passwordController,
        link: 'login',
        onLink: (context) => onLogin(),
        onSubmit: (context) => onSubmit(),
      ),
    );
  }
}
