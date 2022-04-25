import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  get kPrimaryColor => null;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(0.2),
              offset: Offset.zero)
        ]),
        height: 100,
        padding: EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipOval(
              child: Material(
                child: IconButton(
                  icon: Icon(Icons.favorite, color:kPrimaryColor),
                  onPressed: () {},
                ),
              ),
            ),
            ClipOval(
              child: Material(
                child: IconButton(
                  icon: Icon(Icons.shopping_cart, color:kPrimaryColor),
                  onPressed: () {},
                ),
              ),
            ),
            ClipOval(
              child: Material(
                child: IconButton(
                  icon: Icon(Icons.pin_drop, color:kPrimaryColor),
                  onPressed: () {},
                ),
              ),
            ),
            ClipOval(
              child: Material(
                child: IconButton(
                  icon: Icon(Icons.settings, color:kPrimaryColor),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ));
  }
}