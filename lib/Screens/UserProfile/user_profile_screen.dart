import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/UserProfile/components/user_profile_body.dart';
import 'package:flutter_auth/models/user.dart';
import 'package:flutter_auth/services/user_manager.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User _user;
    _user = UserManager.currentUser;
    print(_user.name);
    return Scaffold(
      body: Body(user : _user),
    );
  }
}