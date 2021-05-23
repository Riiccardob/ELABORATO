import 'package:elaborato/home/components/stats_card.dart';
import 'package:flutter/material.dart';
import 'package:elaborato/SignIn-Up/login_screen.dart';
import 'package:elaborato/bottomBar/my_bottom_nav_bar.dart';
import 'package:elaborato/security/token.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:focused_menu/modals.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:elaborato/constants.dart';
import 'package:focused_menu/focused_menu.dart';

import 'components/Body.dart';
import 'components/cards.dart';
import '../transaction/recentTransactions.dart';

SharedPreferences sharedPreferences;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String qrCode = 'Unknown';
  // @override
  // void initState() {
  //   super.initState();
  //   checkLoginState();
  // }

  // checkLoginState() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   if (!await isLogged()) {
  //     print("Non e' loggato");
  //     Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
  //         (Route<dynamic> route) => false);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          //  backgroundColor: Colors.white,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(245, 56, 3, 1),
                  Color.fromRGBO(245, 208, 32, 1),
                ]),
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Home',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        // title: Image.asset(
        //   "assets/icons/logowhite.png",
        //   fit: BoxFit.contain,
        //   height: global_height * 0.55,
        //   width: global_width * 0.55,
        // ),
        toolbarHeight: 70,
        actions: <Widget>[
          FocusedMenuHolder(
              onPressed: () {},
              menuWidth: MediaQuery.of(context).size.width * 0.5,
              animateMenuItems: false,
              menuBoxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              ),
              menuItems: <FocusedMenuItem>[
                // FocusedMenuItem(
                //     title: Text("Change Profile"),
                //     onPressed: () {},
                //     trailingIcon: Icon(Icons.supervisor_account_rounded)),
                FocusedMenuItem(
                    backgroundColor: Color.fromRGBO(245, 56, 3, 1),
                    title: Text(
                      "Logout",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      logout();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    trailingIcon: Icon(
                      Icons.logout,
                      color: Colors.white,
                    )),
              ],
              child: IconButton(
                onPressed: () {
                  // showSearch(context: context, delegate: Search(widget.list));
                },
                icon: Icon(Icons.person),
              )),
        ],
      ),
      body: Body(),
      // Column(
      //   children: <Widget>[
      //     CardsList(),
      //     Padding(
      //       padding: const EdgeInsets.only(top: 10),
      //       child: StatsCards(),
      //     ),
      //     RecentTransactions(),
      //   ],
      // ),
      bottomNavigationBar: MyBottomNavBar(),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () => scanQRCode(),
      //   isExtended: true,
      //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      //   icon: Icon(
      //     Icons.add_circle_outlined,
      //     color: Colors.white,
      //   ),
      //   label: Text('Scan QR-CODE'),
      // ),
    );
  }
}
