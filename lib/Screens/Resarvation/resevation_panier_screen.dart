import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Resarvation/components/reservation_panier_body.dart';
import 'package:flutter_auth/components/second_appbar.dart';
import 'package:flutter_auth/models/reservation.dart';
import 'package:flutter_auth/services/api_manger.dart';
import 'package:flutter_auth/services/shared_prefes_manager.dart';

class ReservationPanierScreen extends StatefulWidget {
  
  ReservationPanierScreen({ Key key }) : super(key: key);

  @override
  State<ReservationPanierScreen> createState() => _ReservationPanierScreenState();
}

class _ReservationPanierScreenState extends State<ReservationPanierScreen> {
  List<Reservation> _reservations;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    getcars();
  }

  Future<void> getcars() async {
    _reservations = await ApiManager.getreservationByUser(SharedPrefsManager.getUser(),"RESERVE");
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
      appBar: SecondAppBar(),
      body: ReservationPanierScreenBody(reservations:_reservations),
    );
  }
}