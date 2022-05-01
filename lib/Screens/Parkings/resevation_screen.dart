import 'package:flutter/material.dart';
import 'package:flutter_auth/models/parking.dart';

class ReservationScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>(); //key for form
  String name="";
  Parking parking;
  ReservationScreen(this.parking, { Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height= MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Color(0xFFffffff),
      body: Container(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Form(
            key: formKey, //key for form
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height:height*0.04),
                Text("Here to Get You Reservation", style: TextStyle(fontSize: 27, color:Color(0xFF363f93)),),
                Text("Welcomed !", style: TextStyle(fontSize: 30, color:Color(0xFF363f93)),),
                SizedBox(height: height*0.05,),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Enter your description"
                  ),
                  validator: validateName,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Enter your "
                  ),
                  validator: validateName,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Enter your "
                  ),
                  validator: validateName,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Enter your "
                  ),
                  validator: validateName,
                ),
              ],
            ),
          ),
        ),
      
    );
  }
    String validateName(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if(value.length != 10){
      return "Mobile number must 10 digits";
    }else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }

  String validateEmail(String value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if(!regExp.hasMatch(value)){
      return "Invalid Email";
    }else {
      return null;
    }
  }
}