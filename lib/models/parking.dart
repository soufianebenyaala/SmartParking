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

}