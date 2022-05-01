import 'package:flutter/material.dart';
import 'package:flutter_auth/components/mainappbar.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/models/parking.dart';
import 'package:flutter_auth/services/api_manger.dart';
import 'package:flutter_auth/services/user_manager.dart';

class ReclamationScreen extends StatefulWidget {
  Parking parking;
  ReclamationScreen(this.parking, {Key key}) : super(key: key);

  @override
  State<ReclamationScreen> createState() => _ReclamationScreenState();
}

class _ReclamationScreenState extends State<ReclamationScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _statusController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController.text = UserManager.currentUser.email;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: MainAppBar(),
        backgroundColor: Color(0xFFffffff),
        body: SingleChildScrollView(
            child: Container(
                height: size.height * 0.85,
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //SizedBox(height: height * 0.04),
                        Text(
                          "Here to Get You Reclamation",
                          style:
                              TextStyle(fontSize: 27, color: Color(0xFF363f93)),
                        ),
                        Text(
                          "Welcomed !",
                          style:
                              TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                        ),
                        //SizedBox(height: height * 0.05,),
                      ],
                    ),

                    TextFormField(
                      decoration: InputDecoration(labelText: "Enter your Name"),
                      validator: validateName,
                      controller: _nameController,
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: "Enter your Email"),
                      validator: validateName,
                      controller: _emailController,
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: "Enter your Address"),
                      validator: validateName,
                      controller: _addressController,
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: "Enter your Status"),
                      validator: validateName,
                      controller: _statusController,
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: "Enter your Description"),
                      validator: validateName,
                      controller: _descriptionController,
                      maxLines: 2,
                    ),
                    //Spacer(),
                    RoundedButton(
                      width: size.width * 0.8,
                      color: Colors.red[800],
                      text: "Reclamation",
                      textColor: Colors.white,
                      press: () {
                        ApiManager.createReclamation(
                            _nameController.text,
                            _emailController.text,
                            _addressController.text,
                            _descriptionController.text,
                            _statusController.text).then((value) => Navigator.pop(context));
                        
                      },
                    )
                  ],
                ))));
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
    } else if (value.length != 10) {
      return "Mobile number must 10 digits";
    } else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }
}
