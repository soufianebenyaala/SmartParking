import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/reservation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReservationCard extends StatefulWidget {
  Reservation reservation;
  ReservationCard({Key key, this.reservation}) : super(key: key);

  @override
  State<ReservationCard> createState() => _ReservationCardState();
}

class _ReservationCardState extends State<ReservationCard> {
  @override
  Widget build(BuildContext context) {
    final format = DateFormat("yyyy-MM-dd HH:mm");
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
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
          child: Row(
            children: [
              Icon(
                Icons.bookmark_add,
                size: 35,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                   "Reservation at position : "+widget.reservation.position.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      //color: kRetailerWhite
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Starting date : "+format.format(widget.reservation.startingDate),
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      //color: kRetailerLightPrimary
                    ),
                  ),
                                    Text(
                    "Ending date : "+format.format(widget.reservation.endingDate),
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      //color: kRetailerLightPrimary
                    ),
                  )
                ],
              ),
              Spacer(),
              TextButton(
                  onPressed: () {
                    //openDialog(context, widget.car);
                  },
                  child: Row(
                    children: [
                      Text(
                        "See more",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: kPrimaryColor,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: kPrimaryColor,
                        size: 14,
                      ),
                    ],
                  )
                  ),
            ],
          ),
        ),
      ),
    );
  }
}