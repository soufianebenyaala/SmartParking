
import 'package:flutter_auth/models/user.dart';
import 'package:flutter_auth/utils/cars.dart';

class UserPreferences {
  static User user = User(
    name:"Soufiane",
    email:"benyaala.soufiane@gmail.com",
    address:"Djerba Tunisia",
    password:"azerty123",
    photo:'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
    phone:"78945612",
    cars:CarPreferences.cars,
  );
}