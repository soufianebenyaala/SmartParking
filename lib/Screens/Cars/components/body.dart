import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Cars/components/car_card.dart';
import 'package:flutter_auth/components/textfield_widget.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/car.dart';
import 'package:flutter_auth/utils/user.dart';

class CarsScreenBody extends StatelessWidget {
  const CarsScreenBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Car> cars = UserPreferences.user.cars;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("My Cars",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                      color: kPrimaryColor)),
              FloatingActionButton(
                onPressed: () {
                  AddCar(context);
                },
                tooltip: 'Increment',
                backgroundColor: kPrimaryColor,
                child: const Icon(Icons.add),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
               child: ListView.builder(
                 itemCount: cars.length,
                 scrollDirection: Axis.vertical,
                 shrinkWrap: true,
                  itemBuilder: (context, index) {
                   return CarCard(
                     car: cars[index],
                   );
                 },
               ),
              )
        ])),
      ),
    );
  }

  Future AddCar(context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          scrollable: true,
          title: Text("Add"),
          actions: [TextButton(onPressed: () {}, child: Text("Add Car"))],
          content: Form(
            child: Column(
              children: [
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Type',
                  onChanged: (name) {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Numbre',
                  onChanged: (phone) {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Sescription',
                  maxLines: 5,
                  onChanged: (address) {},
                ),
              ],
            ),
          ),
        ),
      );
}
