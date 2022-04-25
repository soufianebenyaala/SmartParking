
import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class SplashPage extends StatelessWidget {
  int duration = 0;
  Widget goTopage;

  SplashPage({this.duration,this.goTopage });

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: this.duration),(){
      Navigator.push(context, MaterialPageRoute(builder: (context) => this.goTopage ));
    });

    return Scaffold(
      body: Container(
        color: kPrimaryColor,
        alignment: Alignment.center,
        child:  Icon(Icons.favorite,color: Colors.white,size: 100,),
      ),
    );
  }
}
