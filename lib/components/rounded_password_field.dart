import 'package:flutter/material.dart';
import 'package:flutter_auth/components/text_field_container.dart';
import 'package:flutter_auth/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String Function(dynamic value) validator;
  RoundedPasswordField({
    Key key,
    this.onChanged,
    this.validator
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: true,
        validator: validator,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
