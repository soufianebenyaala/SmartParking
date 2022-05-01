import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Welcome/components/body.dart';

class WelcomeScreen extends StatelessWidget {
final void Function(bool) onLoginChange;

  const WelcomeScreen({Key key, this.onLoginChange}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(onLoginChange: this.onLoginChange),
    );
  }
}