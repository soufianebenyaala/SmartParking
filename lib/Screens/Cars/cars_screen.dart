import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Cars/components/body.dart';
import 'package:flutter_auth/models/car.dart';
import 'package:flutter_auth/services/api_manger.dart';
import 'package:flutter_auth/services/shared_prefes_manager.dart';

class CarsScreen extends StatefulWidget {
  @override
  State<CarsScreen> createState() => _CarsScreenState();
}

class _CarsScreenState extends State<CarsScreen> {
  List<Car> _cars;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    getcars();
  }

  Future<void> getcars() async {
    print(SharedPrefsManager.getUser());
    _cars = await ApiManager.getcars(SharedPrefsManager.getUser());
    if (_cars != null) {
      setState(() {
        _isLoading = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarsScreenBody(cars : _cars),
    );
  }
}