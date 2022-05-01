import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Parkings/components/parkingCard.dart';
import 'package:flutter_auth/Screens/Parkings/parking_details.dart';
import 'package:flutter_auth/models/parking.dart';
import 'package:flutter_auth/utils/parkings.dart';

class Body extends StatelessWidget {
  List<Parking> parkings;
  Body({this.parkings});
  //List<Parking> parkings = ParkingsPreferences.parkings;
  
  @override
  Widget build(BuildContext context)  {
    return Container(
        //color: Colors.black12,
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Text('Select un parking:',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black)),
        ),
        Expanded(
          child: parkings != null ? ListView.builder(
            itemCount:  parkings.length,
            itemBuilder: (context, index) {
              return ParkingCard(
                  parking: parkings[index],
                  onCardClick: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ParkingDetailsScreen(parkings[index])),
                    );
                  });
            },
          ):  Center(child: CircularProgressIndicator(),)
        ),
      ],
    ));
  }
}
