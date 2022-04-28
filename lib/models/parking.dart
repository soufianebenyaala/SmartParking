import 'dart:ui';
import 'package:flutter/material.dart';

class Parking {
  String  Name;
  String  Adress;
  String  description;
  int  totalParkingLots;
  int  totalFreeParkingLots;
  double  latitude;
  double   longitude;
  int  ParkingFees;
  String  companyId;
  bool Status;

  Parking(
    {
      this.Name,
      this.Adress,
      this.description,
      this.totalParkingLots,
      this.totalFreeParkingLots,
      this.latitude,
      this.longitude,
      this.ParkingFees,
      this.companyId,
      this.Status,
    }
  );

  Parking.fromJosn(Map json) :
      Name=json["Name"], 
      Adress=json["Adress"],
      description=json["description"],
      totalParkingLots=json["totalParkingLots"],
      totalFreeParkingLots=json["totalFreeParkingLots"],
      latitude=json["latitude"],
      longitude=json["longitude"],
      ParkingFees=json["ParkingFees"],
      companyId=json["companyId"],
      Status=json["Status"];

}