import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_auth/models/car.dart';

class User {
  String  name;
  String  email;
  String  address;
  String  password;
  String  photo;
  String  phone;
  String  role;
  List<Car> cars;

  User(
    {
      this.name,
      this.email,
      this.address,
      this.password,
      this.photo,
      this.phone,
      this.role="Client",
      this.cars,
    }
  );

  User.fromJosn(Map json) :
          name = json["name"],
          email = json["email"],
          address = json["address"],
          password = json["password"],
          photo = json["photo"],
          phone = json["phone"],
          role = json["role"],
          cars = json["cars"];


}

