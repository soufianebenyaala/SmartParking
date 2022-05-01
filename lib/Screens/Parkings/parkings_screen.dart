import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Parkings/components/body.dart';
import 'package:flutter_auth/models/parking.dart';
import 'package:flutter_auth/services/api_manger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParkingsScreen extends StatefulWidget {
  @override
  State<ParkingsScreen> createState() => _ParkingsScreenState();
}

class _ParkingsScreenState extends State<ParkingsScreen> {
  List<Parking> _parkings;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    getparkings();
  }

  Future<void> getparkings() async {
    _parkings = await ApiManager.getparkings();
    if (_parkings != null) {
      setState(() {
        _isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body( parkings: _parkings),
    );
  }
}
