import 'package:elaborato/profile/logged_in_page.dart';
import 'package:flutter/material.dart';
import 'package:elaborato/SignIn-Up/login_screen.dart';
import 'package:elaborato/SignIn-Up/api/google_signin_api.dart';
import 'package:elaborato/bottomBar/my_bottom_nav_bar.dart';
import 'package:focused_menu/modals.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:focused_menu/focused_menu.dart';
import 'components/Body.dart';

SharedPreferences sharedPreferences;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String qrCode = 'Unknown';
  @override
  Widget build(BuildContext context) {
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
                FocusedMenuItem(
                    title: Text("Profile"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoggedInPage(user: user)),
                      );
                    },
                    trailingIcon: Icon(Icons.supervisor_account_rounded)),
                FocusedMenuItem(
                    backgroundColor: Color.fromRGBO(245, 56, 3, 1),
                    title: Text(
                      "Logout",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      await GoogleSignInApi.logout();

                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    trailingIcon: Icon(
                      Icons.logout,
                      color: Colors.white,
                    )),
              ],
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.person),
              )),
        ],
      ),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
