import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:elaborato/constants.dart';
import 'package:elaborato/home/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:elaborato/SignIn-Up/api/google_signin_api.dart';

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

  final _uri = Uri.https('elaboratomacchinette.it', '/login');

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
    }
  }

  @override
  Widget build(BuildContext context) {
    global_height = MediaQuery.of(context).size.height;
    global_width = MediaQuery.of(context).size.width;
    signIn();
    print(user.email);
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
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
