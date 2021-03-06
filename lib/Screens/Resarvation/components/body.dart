import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Resarvation/components/resevation_card.dart';
import 'package:flutter_auth/constants.dart';

class ReservationScreenBody extends StatelessWidget {
  var reservations;
  ReservationScreenBody({ Key key,this.reservations }) : super(key: key);

  @override
  Widget build(BuildContext context) {

print(reservations);
    return  SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("My Reservations",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                      color: kPrimaryColor)),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
               child: reservations != null ? ListView.builder(
                 itemCount:  reservations.length,
                 scrollDirection: Axis.vertical,
                 shrinkWrap: true,
                  itemBuilder: (context, index) {
                   return ReservationCard(
                     reservation: reservations[index],
                   );
                 },
               ):  Center(child: CircularProgressIndicator(),)
              )
        ])),
      ),
    );
  }
}