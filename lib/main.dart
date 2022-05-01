import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/layouts/parking_layout.dart';
import 'package:flutter_auth/services/shared_prefes_manager.dart';
import 'package:flutter_auth/services/user_manager.dart';

import 'Screens/SplashPage/splash_screen.dart';
import 'Screens/Welcome/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsManager.initializeSharedPrefs();
  await UserManager.initialize();
  runApp(MyApp());
  }

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      bool isLoggedIn = false;
  // This widget is the root of your application.
  void onLoginUpdate(bool value) {
    setState(() {
      isLoggedIn = value;
    });
    print('Logged' + value.toString());
  }
    var seenStartUpScreen = SharedPrefsManager.getUser();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Parking',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      //home: ParkingLayout(),
      home: (isLoggedIn || seenStartUpScreen!= "none")
          ? ParkingLayout()
          : SplashPage(duration: 5,goTopage: WelcomeScreen(onLoginChange: onLoginUpdate,),),
      //home: SplashPage(duration: 3,goTopage: WelcomeScreen()),
    );
  }
}
