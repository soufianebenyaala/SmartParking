import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Resarvation/resevation_panier_screen.dart';
import 'package:flutter_auth/components/menu_item.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/main.dart';
import 'package:flutter_auth/services/shared_prefes_manager.dart';
import 'package:flutter_auth/services/user_manager.dart';

class SideMenuBar extends StatelessWidget {
  const SideMenuBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _user = UserManager.currentUser;
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: kPrimaryColor,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                ListTile(
                  title: Text(
                    _user.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  subtitle: Text(
                    _user.email,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.perm_identity,
                      color: kPrimaryColor,
                    ),
                    radius: 20,
                  ),
                ),
                /*MenuItem(
                  icon: Icons.home,
                  title: 'Home',
                  onTap: () {
                    //onIconPressed();
                    //BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickedEvent);
                  },
                ),
                MenuItem(
                  icon: Icons.person,
                  title: 'My Account',
                  onTap: () {
                    //onIconPressed();
                    // BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyAccountClickedEvent);
                  },
                ),
                MenuItem(
                  icon: Icons.shopping_basket,
                  title: 'My Orders',
                  onTap: () {
                    //onIconPressed();
                    //BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyOrdersClickedEvent);
                  },
                ),
                MenuItem(
                  icon: Icons.card_giftcard,
                  title: 'Wishlist',
                ),
                Divider(
                  height: 64,
                  thickness: 0.5,
                  color: Colors.grey,
                  indent: 32,
                  endIndent: 32,
                ),
                MenuItem(
                  icon: Icons.settings,
                  title: 'Settings',
                ),*/
                MenuItem(
                  icon: Icons.card_travel,
                  title: 'Panier',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ReservationPanierScreen();
                        },
                      ),
                    );
                  },
                ),
                MenuItem(
                  icon: Icons.exit_to_app,
                  title: 'Log Out',
                  onTap: () {
                    SharedPrefsManager.setUser("none");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MyApp();
                        },
                      ),
                    );
                  },
                ),
                
              ],
            ),
          ),
        ),
      ],
    );
  }
}
