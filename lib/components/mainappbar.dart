import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  Color themeColor;

  MainAppBar({ 
    this.themeColor = kPrimaryColor,
  });

  @override
  MainAppBarState createState() => MainAppBarState();

  @override
  Size get preferredSize => new Size.fromHeight(80);
}

class MainAppBarState extends State<MainAppBar> {

  @override 
  Widget build(BuildContext context) {
    return AppBar(
        title: Text("Parking App",style: TextStyle(fontWeight: FontWeight.bold,color: kPrimaryColor)),
        /*IconFont(
          iconName: IconFontHelper.LOGO,
          color: widget.themeColor,
          size: 40
        ),*/
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: widget.themeColor),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.all(10),
            child: ClipOval(
              child: Image.asset('assets/images/user.png')
            )
          )
        ],
      );
  }
}