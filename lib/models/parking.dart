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

 static List<Parking> parkings = <Parking>[
      Parking(
        Name:"Carrefour parking",
        Adress:"Tunis Tunis",
        description:"Un parking, parc de stationnement, aire de stationnement ou stationneur, est un espace ou un bâtiment spécifiquement aménagé pour le stationnement des véhicules. Il peut être public ou privé, en enclos, en élévation1 ou souterrain. On en trouve le plus souvent à côté des bâtiments publics (gare, aéroport), des lieux de travail, des centres commerciaux ou devant les grandes surfaces pour accueillir les usagers.",
        totalParkingLots:20,
        totalFreeParkingLots:10,
        latitude:48.862725,
        longitude:2.287592,
        ParkingFees:5,
        companyId:"1",
        Status:true,
      ),
            Parking(
        Name:"Carrefour parking",
        Adress:"Tunis Tunis",
        description:"Un parking, parc de stationnement, aire de stationnement ou stationneur, est un espace ou un bâtiment spécifiquement aménagé pour le stationnement des véhicules. Il peut être public ou privé, en enclos, en élévation1 ou souterrain. On en trouve le plus souvent à côté des bâtiments publics (gare, aéroport), des lieux de travail, des centres commerciaux ou devant les grandes surfaces pour accueillir les usagers.",
        totalParkingLots:20,
        totalFreeParkingLots:10,
        latitude:48.862725,
        longitude:2.287592,
        ParkingFees:5,
        companyId:"1",
        Status:true,
      ),
      Parking(
        Name:"Carrefour parking",
        Adress:"Tunis Tunis",
        description:"Un parking, parc de stationnement, aire de stationnement ou stationneur, est un espace ou un bâtiment spécifiquement aménagé pour le stationnement des véhicules. Il peut être public ou privé, en enclos, en élévation1 ou souterrain. On en trouve le plus souvent à côté des bâtiments publics (gare, aéroport), des lieux de travail, des centres commerciaux ou devant les grandes surfaces pour accueillir les usagers.",
        totalParkingLots:20,
        totalFreeParkingLots:10,
        latitude:48.862725,
        longitude:2.287592,
        ParkingFees:5,
        companyId:"1",
        Status:true,
      ),
            Parking(
        Name:"Carrefour parking",
        Adress:"Tunis Tunis",
        description:"Un parking, parc de stationnement, aire de stationnement ou stationneur, est un espace ou un bâtiment spécifiquement aménagé pour le stationnement des véhicules. Il peut être public ou privé, en enclos, en élévation1 ou souterrain. On en trouve le plus souvent à côté des bâtiments publics (gare, aéroport), des lieux de travail, des centres commerciaux ou devant les grandes surfaces pour accueillir les usagers.",
        totalParkingLots:20,
        totalFreeParkingLots:10,
        latitude:48.862725,
        longitude:2.287592,
        ParkingFees:5,
        companyId:"1",
        Status:true,
      ),
 ];
}