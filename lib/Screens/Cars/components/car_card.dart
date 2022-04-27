import 'dart:ui';
import 'package:readmore/readmore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/car.dart';

class CarCard extends StatelessWidget {
  Car car;
  CarCard({Key key, this.car}) : super(key: key);

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
                    car.type,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      //color: kRetailerWhite
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    car.number,
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
                    ///openDialogShow(context, car);
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


}
