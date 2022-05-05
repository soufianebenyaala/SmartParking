import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_auth/components/mainappbar.dart';
import 'package:flutter_auth/components/sidemenubar.dart';

import 'cubit/bottomnavbar_cubit.dart';

class ParkingLayout extends StatelessWidget {
  GlobalKey<ConvexAppBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BottomnavbarCubit(),
      child: BlocConsumer<BottomnavbarCubit, BottomnavbarState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = BottomnavbarCubit.get(context);
          return Scaffold(
                  drawer: Drawer(
        child: SideMenuBar()
      ),
      appBar: MainAppBar(),
            // bottom navigation bar
            bottomNavigationBar: ConvexAppBar(
              key: _bottomNavigationKey,

              items: [
                TabItem(icon: Icons.home, title: 'Home'),
                TabItem(icon: Icons.map, title: 'Discovery'),
                TabItem(icon: Icons.add, title: 'Add'),
                //TabItem(icon: Icons.message, title: 'Message'),
                TabItem(icon: Icons.people, title: 'Profile'),
              ],
              //initialActiveIndex: 2,//optional, default as 0
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
