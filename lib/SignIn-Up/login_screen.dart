import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:elaborato/SignIn-Up/recoverPass/RecoverPassword.dart';
import 'package:elaborato/SignIn-Up/registration_screen.dart';
import 'package:elaborato/constants.dart';
import 'package:elaborato/home/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unique_identifier/unique_identifier.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:elaborato/SignIn-Up/api/google_signin_api.dart';

import '../profile/logged_in_page.dart';

var user;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  // ignore: unused_field
  bool _isLoading = false;
  String _identifier = 'Unknown';

  // TextEditingController emailController = new TextEditingController();
  // TextEditingController passwordController = new TextEditingController();

  final _uri = Uri.https('elaboratomacchinette.it', '/login');

  sendData() async {
    print(user.displayName);
    print(user.email);

    Map data = {'email': user.email, 'password': user.displayName};
    // ignore: avoid_init_to_null
    var jsonData = null;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.post(_uri,
        headers: {"Content-Type": "application/json"}, body: json.encode(data));
    print(_uri);
    if (response.statusCode == 200) {
      print(response.body);
      return true;
    } else {
      print(response.body);
      return false;
    }
  }

  openBrowserTab() async {
    await FlutterWebBrowser.openWebPage(
        url: "http://172.105.64.74:21220/google");
  }

  Future signIn() async {
    user = await GoogleSignInApi.login();

    if (user == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Sign in Failed')));
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
      // if (sendData()) {
      //   Navigator.of(context).pushReplacement(
      //     // MaterialPageRoute(builder: (context) => LoggedInPage(user: user)),
      //     MaterialPageRoute(builder: (context) => HomeScreen()),
      //   );
      // } else {
      //   signIn();
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    global_height = MediaQuery.of(context).size.height;
    global_width = MediaQuery.of(context).size.width;
    signIn();
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                // height: double.infinity,
                // width: double.infinity,
                height: global_height,
                width: global_width,
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
            ],
          ),
        ),
      ),
    );
  }
}
