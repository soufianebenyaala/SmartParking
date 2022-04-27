import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/Parking.dart';

class ParkingCard extends StatelessWidget {
  var parking;
  Function onCardClick;
  

  ParkingCard({this.parking, this.onCardClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.onCardClick();
      },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          height: 150,
          child: Stack(
            children: [
              Positioned(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child:
                      Image.asset('assets/images/car.jpg', fit: BoxFit.cover),
                ),
              ),
              Positioned(
                bottom: 8,
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.9),
                              Colors.black.withOpacity(0.3)
                            ]))),
              ),
              Positioned(
                top: 0,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(this.parking.Name,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 27)),
                          Row(
                            children: [
                              Icon(Icons.pin_drop, color: Colors.red[900]),
                              Text(this.parking.Adress,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18)),
                            ],
                          ),
                         
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Text("Free Parking Lots :" + this.parking.totalFreeParkingLots.toString(),style: TextStyle(
                                      color: kPrimaryLightColor, fontSize: 20)),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Text(this.parking.ParkingFees.toString()+" TND",style: TextStyle(
                                      color: kPrimaryLightColor, fontSize: 21,fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
