import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/body.dart';

class LoginScreen extends StatelessWidget {
  final void Function(bool) onLoginChange;

  const LoginScreen({Key key, this.onLoginChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(onLoginChange: onLoginChange),
    );
  }
}
