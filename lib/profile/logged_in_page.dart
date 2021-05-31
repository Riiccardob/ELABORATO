import 'package:elaborato/bottomBar/my_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:elaborato/SignIn-Up/api/google_signin_api.dart';

import '../SignIn-Up/login_screen.dart';

class LoggedInPage extends StatelessWidget {
  final GoogleSignInAccount user;

  const LoggedInPage({
    Key key,
    this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
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
            'Profilo',
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
                      backgroundColor: Color.fromRGBO(245, 56, 3, 1),
                      title: Text(
                        "Logout",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        await GoogleSignInApi.logout();

                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
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
        body: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // CircleAvatar(
                //         radius: 40,
                //         backgroundImage: NetworkImage(user.photoUrl),
                //       ),
                (user.photoUrl != null
                    ? CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(user.photoUrl),
                      )
                    : CircleAvatar(
                        radius: 40,
                        backgroundImage:
                            AssetImage('assets/icons/blank-profile-circle.png'),
                      )),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nome: ' + user.displayName,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Email: ' + user.email,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: MyBottomNavBar(),
      );

  // @override
  // Widget build(BuildContext context) => Scaffold(
  //       appBar: AppBar(
  //         title: Text('Logged in'),
  //         centerTitle: true,
  //         actions: [
  //           TextButton(
  //             onPressed: () async {
  //               await GoogleSignInApi.logout();

  //               Navigator.of(context).pushReplacement(
  //                 MaterialPageRoute(builder: (context) => LoginScreen()),
  //               );
  //             },
  //             child: Text('Logout'),
  //           )
  //         ],
  //       ),
  //       body: Container(
  //         alignment: Alignment.center,
  //         color: Colors.blueGrey.shade900,
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Text(
  //               'Profile',
  //               style: TextStyle(fontSize: 24),
  //             ),
  //             SizedBox(
  //               height: 32,
  //             ),
  //             CircleAvatar(
  //               radius: 40,
  //               backgroundImage: NetworkImage(user.photoUrl),
  //             ),
  //             SizedBox(
  //               height: 8,
  //             ),
  //             Text(
  //               'Name: ' + user.displayName,
  //               style: TextStyle(color: Colors.white, fontSize: 24),
  //             ),
  //             SizedBox(
  //               height: 8,
  //             ),
  //             Text(
  //               'Email: ' + user.email,
  //               style: TextStyle(color: Colors.white, fontSize: 24),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );
}
