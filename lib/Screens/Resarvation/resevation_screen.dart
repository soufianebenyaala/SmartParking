import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Resarvation/components/body.dart';
import 'package:flutter_auth/models/parking.dart';
import 'package:flutter_auth/models/reservation.dart';
import 'package:flutter_auth/services/api_manger.dart';
import 'package:flutter_auth/services/shared_prefes_manager.dart';

class ReservationScreen extends StatefulWidget {
  
  ReservationScreen({ Key key }) : super(key: key);

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  List<Reservation> _reservations;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    getcars();
  }

  Future<void> getcars() async {
    _reservations = await ApiManager.getreservationByUser(SharedPrefsManager.getUser(),"CHECKEDOUT");
    if (_reservations != null) {
      setState(() {
        _isLoading = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    final double height= MediaQuery.of(context).size.height;
    return Scaffold(
      body: ReservationScreenBody(reservations:_reservations),
    );
  }
}