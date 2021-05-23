import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:elaborato/SignIn-Up/recoverPass/RecoverPassword.dart';
import 'package:elaborato/SignIn-Up/registration_screen.dart';
import 'package:elaborato/constants.dart';
import 'package:elaborato/home/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:elaborato/security/token.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unique_identifier/unique_identifier.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  // ignore: unused_field
  bool _isLoading = false;
  String _identifier = 'Unknown';

  // final _uri = Uri.https('auth.scann3d.it', '/auth/login');

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // @override
  // void initState() {
  //   super.initState();
  //   initUniqueIdentifierState();
  // }

  // Future<void> initUniqueIdentifierState() async {
  //   String identifier;
  //   try {
  //     identifier = await UniqueIdentifier.serial;
  //   } on PlatformException {
  //     identifier = 'Failed to get Unique Identifier';
  //   }

  //   if (!mounted) return;

  //   setState(() {
  //     _identifier = identifier;
  //   });
  // }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      // ignore: deprecated_member_use
      child: FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RecovePassword()),
          );
        },
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Password dimenticata?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.blue,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Rimani connesso',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  // signIn(String email, String password, String _identifier) async {
  //   print(email);
  //   print(password);
  //   print(_identifier);

  //   Map data = {'email': email, 'password': password, 'device_id': _identifier};
  //   // ignore: avoid_init_to_null
  //   var jsonData = null;
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   var response = await http.post(_uri,
  //       headers: {"Content-Type": "application/json"}, body: json.encode(data));
  //   print(_uri);
  //   if (response.statusCode == 200) {
  //     jsonData = json.decode(response.body);

  //     saveToken(jsonData, _rememberMe);

  //     setState(() {
  //       _isLoading = false;
  //       sharedPreferences.setString("token", jsonData['token']);
  //       Navigator.of(context).pushAndRemoveUntil(
  //           MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
  //           (Route<dynamic> route) => false);
  //     });
  //     return true;
  //   } else {
  //     print(response.body);
  //     return false;
  //   }
  // }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      width: double.infinity,
      // ignore: deprecated_member_use
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
          // if (_formKey.currentState.validate()) {
          //   setState(() {
          //     _isLoading = true;
          //   });
          //   if (signIn(
          //       emailController.text, passwordController.text, _identifier)) {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => HomeScreen()),
          //     );
          //   } else {
          //     print("error");
          //   }
          //   // Navigator.push(
          //   //   context,
          //   //   MaterialPageRoute(builder: (context) => HomeScreen()),
          //   // );
          // }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegistrationScreen()),
        );
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Non hai un account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Registrati',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    global_height = MediaQuery.of(context).size.height;
    global_width = MediaQuery.of(context).size.width;
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
                // child: _isLoading
                //     ? Center(child: CircularProgressIndicator())
                //     : ListView(
                //         children: <Widget>[
                //           HomeScreen(),
                //         ],
                //       )
              ),
              Padding(
                padding: EdgeInsets.only(top: (global_height * 2.5) / 100),
                child: Container(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    // padding: EdgeInsets.only(right: 40, left: 40, top: 35),
                    padding: EdgeInsets.only(
                        right: (global_width * 7) / 100,
                        left: (global_width * 7) / 100,
                        top: (global_height * 4.5) / 100),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          // Image.asset(
                          //   "assets/icons/logowhite.png",
                          //   height: (global_height * 10) / 100,
                          //   width: (global_width * 70) / 100,
                          // ),
                          SizedBox(
                            height: (global_height * 15) / 100,
                          ),
                          Text(
                            'Email',
                            style: kLabelStyle,
                          ),
                          SizedBox(
                            height: (global_height * 1.1) / 100,
                          ),
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                            ),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.white54),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.red),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              contentPadding: EdgeInsets.only(top: 15.0),
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Colors.white,
                              ),
                              hintText: 'Inserisci la mail',
                              hintStyle: kHintTextStyle,
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Il campo 'email' non può essere vuoto";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: (global_height * 4) / 100,
                          ),
                          Text(
                            'Password',
                            style: kLabelStyle,
                          ),
                          SizedBox(
                            height: (global_height * 1.1) / 100,
                          ),
                          TextFormField(
                            controller: passwordController,
                            obscureText: _isHidden,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                            ),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.white54),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.red),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              contentPadding:
                                  EdgeInsets.only(top: 15.0, right: 20),
                              prefixIcon: Icon(
                                Icons.lock_outline_rounded,
                                color: Colors.white,
                              ),
                              suffix: InkWell(
                                onTap: _togglePasswordView,
                                child: Icon(
                                  _isHidden
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white,
                                ),
                              ),
                              hintText: 'Inserisci la password',
                              hintStyle: kHintTextStyle,
                            ),
                            validator: (value) {
                              //int i = int.parse(passwordController.text);
                              if (value.isEmpty) {
                                return "Il campo 'password' non può essere vuoto";
                              } //else if (i < 6) {
                              //return "the password must be at least 6 characters long";
                              //}
                              return null;
                            },
                          ),
                          _buildForgotPasswordBtn(),
                          _buildRememberMeCheckbox(),
                          _buildLoginBtn(),
                          _buildSignupBtn(),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
