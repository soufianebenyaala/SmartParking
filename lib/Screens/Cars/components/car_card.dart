import 'dart:ui';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/textfield_widget.dart';
import 'package:flutter_auth/layouts/parking_layout.dart';
import 'package:flutter_auth/services/api_manger.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/car.dart';

class CarCard extends StatefulWidget {
  Car car;
  CarCard({Key key, this.car}) : super(key: key);

  @override
  State<CarCard> createState() => _CarCardState();
}

class _CarCardState extends State<CarCard> {
  TextEditingController _numberController = TextEditingController();
  TextEditingController _typeController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  @override
  void initState() {
    super.initState();

    _numberController.text = widget.car.number;
    _typeController.text = widget.car.type;
    _descriptionController.text = widget.car.description;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Card(
        elevation: 5.0,
        //shape: RoundedRectangleBorder(
        //  borderRadius: BorderRadius.circular(10.0)
        //),
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
          width: MediaQuery.of(context).size.width - 100,
          child: Row(
            children: [
              Icon(
                Icons.car_repair_sharp,
                size: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.car.type,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      //color: kRetailerWhite
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    widget.car.number,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      //color: kRetailerLightPrimary
                    ),
                  )
                ],
              ),
              Spacer(),
              TextButton(
                  onPressed: () {
                    openDialog(context, widget.car);
                  },
                  child: Row(
                    children: [
                      Text(
                        "See more",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: kPrimaryColor,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: kPrimaryColor,
                        size: 20,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Future openDialog(context, car) => showDialog(
      context: context,
      // ignore: missing_return
      builder: (context) {
        Size size = MediaQuery.of(context).size;
        return AlertDialog(
          scrollable: true,
          title: Text("detail car"),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RoundedButton(
                  paddingHorizontal: 0,
                  paddingVertical: 0,
                  margin: 0,
                  borderRadius: 5,
                  width: size.width * 0.2,
                  text: "Delete",
                  press: () {
                    openDeleteDialog(context);
                  },
                  color: Colors.red,
                  textColor: Colors.white,
                ),
                SizedBox(
                  width: 5,
                ),
                RoundedButton(
                  paddingHorizontal: 0,
                  paddingVertical: 0,
                  margin: 0,
                  width: size.width * 0.2,
                  borderRadius: 5,
                  text: "Edit",
                  press: () {
                    openEditDialog(context, car);
                  },
                  //color: kPrimaryLightColor,
                  textColor: Colors.white,
                ),
              ],
            ),
          ],
          content: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "Type : ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                        //label: 'number',
                        car.type,
                        style: TextStyle(fontSize: 13)),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "Number : ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      //label: 'type',
                      car.number,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "Description : ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      //label: 'description',
                      car.description,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });

  Future openEditDialog(context, car) => showDialog(
      context: context,
      // ignore: missing_return
      builder: (context) {
        return AlertDialog(
          scrollable: true,
          title: Text("Edit Profile"),
          actions: [
            Center(
              child:RoundedButton(
                borderRadius: 30,
              text: "Edit",
              press: () {
                ApiManager.carUpdate(
                        _numberController.text,
                        _descriptionController.text,
                        _typeController.text,
                        car.id)
                    .then((value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ParkingLayout();
                      },
                    ),
                  );
                });
              },
              color: kPrimaryColor,
              textColor: Colors.white,
            ),
            )
            ],
          content: Form(
            child: Column(
              children: [
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'type',
                  controller: _typeController,
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'number',
                  controller: _numberController,
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'description',
                  controller: _descriptionController,
                ),
              ],
            ),
          ),
        );
      });

  Future openDeleteDialog(context) => showDialog(
      context: context,
      // ignore: missing_return
      builder: (context) {
        return AlertDialog(
            scrollable: true,
            title:  Center(
                child:Text("Delete")),
            actions: [
              Center(
                child: RoundedButton(
                text: "Delete",
                press: () {
                  ApiManager.DeleteCar(widget.car.id).then((value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ParkingLayout();
                        },
                      ),
                    );
                  });
                },
                color: Colors.red,
                textColor: Colors.white,
              ),
              )
              ],
            content:  Center(
                child:Text("are you shur !!!")));
      });
}
