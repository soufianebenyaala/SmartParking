import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Cars/cars_screen.dart';
import 'package:flutter_auth/Screens/Parkings/parkings_screen.dart';
import 'package:flutter_auth/Screens/UserProfile/user_profile_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottomnavbar_state.dart';

class BottomnavbarCubit extends Cubit<BottomnavbarState> {
  BottomnavbarCubit() : super(BottomnavbarInitial());

  static BottomnavbarCubit get(context)=>BlocProvider.of(context);

  List<Widget> screens = [ParkingsScreen(),CarsScreen(),UserProfileScreen()];

  int currentIndex = 0;

  void changeBottomNav (int index){
    currentIndex = index ;
    print(currentIndex);
    emit(ChangeIndexBottomNavBar());
  }
}
