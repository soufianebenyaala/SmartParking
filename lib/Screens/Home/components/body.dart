import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Home/components/parkingCard.dart';
import 'package:flutter_auth/components/bottombar.dart';
import 'package:flutter_auth/components/mainappbar.dart';
import 'package:flutter_auth/components/sidemenubar.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/parking.dart';

class Body extends StatelessWidget {

  List<Parking> parkings = Parking.parkings;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SideMenuBar()
      ),
      appBar: MainAppBar(),
      body:  Container( 
        //color: Colors.black12,
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text('Select un parking:',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black)
                  ),
                ),
                Expanded(  
                    child: ListView.builder(
                    itemCount: parkings.length,
                    itemBuilder: (context, index) {
                      return ParkingCard(
                        parking: parkings[index],
                        onCardClick: () {
                          //Navigator.push(              
                          //  context,
                          //  MaterialPageRoute(
                          //    builder: (context) => SelectedCategoryPage(
                          //      selectedCategory: this.categories[index],
                          //    )
                          //  )
                          //);
                        }
                      );
                    },
                  ),
                ),
                BottomBar()
              ],
            )
          )
    );
  }
}