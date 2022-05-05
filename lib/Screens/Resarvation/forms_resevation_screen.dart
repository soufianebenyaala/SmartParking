import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Resarvation/components/date_time_field.dart';
import 'package:flutter_auth/Screens/validation/validation.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/layouts/parking_layout.dart';
import 'package:flutter_auth/models/parking.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter_auth/services/api_manger.dart';
import 'package:flutter_auth/services/user_manager.dart';

class FormsReservationScreen extends StatefulWidget {
  Parking parking;
  FormsReservationScreen(this.parking, {Key key}) : super(key: key);

  @override
  State<FormsReservationScreen> createState() => _FormsReservationScreenState();
}

class _FormsReservationScreenState extends State<FormsReservationScreen> {
  final formKey = GlobalKey<FormState>();
  //key for form
  TextEditingController _positionController = TextEditingController();
  TextEditingController _datetimeController = TextEditingController();
  DateTime _dateTime;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.04),
              Text(
                "Here to Get You Reservation",
                style: TextStyle(fontSize: 27, color: Color(0xFF363f93)),
              ),
              Text(
                "Welcomed !",
                style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Enter your Postion"),
                validator: (value) {
                  Validation.validateName(value);
                },
                controller: _positionController,
              ),
              BasicDateTimeField(datetimeController: _datetimeController),
              RoundedButton(
                width: size.width * 0.8,
                color: kPrimaryColor,
                text: "Reserve maintenant",
                textColor: Colors.white, //createResarvation
                press: () {
                  ApiManager.createResarvation(
                          _datetimeController.text,
                          _positionController.text,
                          UserManager.currentUser.id,
                          widget.parking.id)
                      .then((value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ParkingLayout()),
                    );
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
