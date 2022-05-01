import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/Screens/validation/validation.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/layouts/parking_layout.dart';
import 'package:flutter_auth/services/user_manager.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  final void Function(bool) onLoginChange;

  const Body({
    Key key,
    this.onLoginChange,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var email = '';
  var password = '';
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/register.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Your Email",
                onChanged: (value) {
                  email = value;
                },
                validator: (value) {
                  Validation.EmailValidation(value);
                },
              ),
              RoundedPasswordField(onChanged: (value) {
                password = value;
              }, validator: (value) {
                Validation.PasswordValidation(value);
              }),
              RoundedButton(
                  width: size.width * 0.8,
                  text: "LOGIN",
                  press: () {
                    if ( _formKey.currentState.validate()) {
                      //do what we have to do

                      UserManager.performUserLogin(email, password)
                          // ignore: sdk_version_set_literal
                          .then((value) => {
                                value == null
                                    ? {
                                        widget.onLoginChange(true),
                                      }
                                    : print(value),
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return ParkingLayout();
                                    },
                                  ),
                                )
                              });
                    }else{
                      return;
                    }
                  }),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
