import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:elaborato/SignIn-Up/login_screen.dart';
import 'package:elaborato/constants.dart';
import 'package:elaborato/home/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:elaborato/security/token.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unique_identifier/unique_identifier.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // ignore: unused_field
  bool _isLoading = false;
  DateTime _date = DateTime.now();
  String dataStringa = "";
  String _identifier = 'Unknown';

  final _uri = Uri.https('auth.scann3d.it', '/auth/signup');

  TextEditingController name = new TextEditingController();
  TextEditingController surname = new TextEditingController();
  TextEditingController date = new TextEditingController();
  TextEditingController phoneNumber = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController passwordConfirm = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      initialDatePickerMode: DatePickerMode.day,
    );
    if (picked != null && picked != _date)
      setState(() {
        _date = picked;
        var formatter = new DateFormat("yyyy-MM-dd");
        print(_date.toString());
        dataStringa = formatter.format(_date);
        print("La tua stringa e': " + dataStringa);
      });
  }

  // signUp(String name, String surname, String phoneNumber, String email,
  //     String password, String _identifier) async {
  //   print(name);
  //   print(surname);
  //   print(dataStringa);
  //   print(phoneNumber);
  //   print(email);
  //   print(password);
  //   print(_identifier);

  //   Map data = {
  //     'name': name,
  //     'surname': surname,
  //     'birth_date': dataStringa,
  //     'phone_number': phoneNumber,
  //     'email': email,
  //     'password': password,
  //     'device_id': _identifier
  //   };

  //   // ignore: avoid_init_to_null
  //   var jsonData = null;
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   var response = await http.post(_uri,
  //       headers: {"Content-Type": "application/json"}, body: json.encode(data));
  //   print(_uri);
  //   if (response.statusCode == 200) {
  //     jsonData = json.decode(response.body);
  //     saveToken(jsonData, true);
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

  Widget _buildRegisterBtn() {
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
          //   if (signUp(name.text, surname.text, phoneNumber.text, email.text,
          //       password.text, _identifier)) {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => HomeScreen()),
          //     );
          //   } else {
          //     print("error");
          //   }
          // }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Registrati',
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

  // ignore: unused_element
  Widget _buildSigninBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Hai già un account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Login',
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
              ),
              Padding(
                padding: EdgeInsets.only(top: (global_height * 2.5) / 100),
                child: Container(
                    height: double.infinity,
                    child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        // ),
                        // padding: EdgeInsets.only(right: 40, left: 40, top: 15),
                        padding: EdgeInsets.only(
                            right: (global_width * 10) / 100,
                            left: (global_width * 10) / 100,
                            top: (global_height * 3) / 100),
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
                                    height: (global_height * 4) / 100,
                                  ),
                                  Text(
                                    'Nome',
                                    style: kLabelStyle,
                                  ),
                                  SizedBox(
                                    height: (global_height * 1.1) / 100,
                                  ),
                                  TextFormField(
                                    controller: name,
                                    keyboardType: TextInputType.name,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'OpenSans',
                                    ),
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3, color: Colors.white54),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3, color: Colors.red),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      contentPadding:
                                          EdgeInsets.only(top: 15.0),
                                      prefixIcon: Icon(
                                        Icons.account_circle_outlined,
                                        color: Colors.white,
                                      ),
                                      hintText: 'Inserisci il tuo nome',
                                      hintStyle: kHintTextStyle,
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "Il campo 'nome' non può essere vuoto";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: (global_height * 1.33) / 100,
                                  ),
                                  Text(
                                    'Cognome',
                                    style: kLabelStyle,
                                  ),
                                  SizedBox(
                                    height: (global_height * 1.1) / 100,
                                  ),
                                  TextFormField(
                                    controller: surname,
                                    keyboardType: TextInputType.name,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'OpenSans',
                                    ),
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3, color: Colors.white54),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3, color: Colors.red),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      contentPadding:
                                          EdgeInsets.only(top: 15.0),
                                      prefixIcon: Icon(
                                        Icons.account_circle_outlined,
                                        color: Colors.white,
                                      ),
                                      hintText: 'Inserisci il tuo cognome',
                                      hintStyle: kHintTextStyle,
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "Il campo 'cognome' non può essere vuoto";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: (global_height * 1.33) / 100,
                                  ),
                                  Text(
                                    'Data di nascita',
                                    style: kLabelStyle,
                                  ),
                                  SizedBox(
                                    height: (global_height * 1.1) / 100,
                                  ),
                                  TextFormField(
                                    controller: date,
                                    keyboardType: TextInputType.name,
                                    onTap: () async {
                                      await _selectDate(context);
                                    },
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'OpenSans',
                                    ),
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3, color: Colors.white54),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3, color: Colors.red),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      contentPadding:
                                          EdgeInsets.only(top: 15.0),
                                      prefixIcon: Icon(
                                        Icons.calendar_today,
                                        color: Colors.white,
                                      ),
                                      hintText:
                                          "${_date.toLocal()}".split(' ')[0],
                                      hintStyle: kHintTextStyle,
                                    ),
                                    validator: (value) {
                                      // ignore: unrelated_type_equality_checks
                                      if (_date == "") {
                                        return "Il campo 'data' non può essere vuoto";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: (global_height * 1.33) / 100,
                                  ),
                                  // Text(
                                  //   'Numero di telefono',
                                  //   style: kLabelStyle,
                                  // ),
                                  // SizedBox(
                                  //   height: (global_height * 1.1) / 100,
                                  // ),
                                  // TextFormField(
                                  //   controller: phoneNumber,
                                  //   keyboardType: TextInputType.number,
                                  //   style: TextStyle(
                                  //     color: Colors.white,
                                  //     fontFamily: 'OpenSans',
                                  //   ),
                                  //   decoration: InputDecoration(
                                  //     enabledBorder: OutlineInputBorder(
                                  //       borderSide: BorderSide(
                                  //           width: 3, color: Colors.white54),
                                  //       borderRadius: BorderRadius.circular(15),
                                  //     ),
                                  //     focusedBorder: OutlineInputBorder(
                                  //       borderSide: BorderSide(
                                  //           width: 3, color: Colors.red),
                                  //       borderRadius: BorderRadius.circular(15),
                                  //     ),
                                  //     contentPadding:
                                  //         EdgeInsets.only(top: 15.0),
                                  //     prefixIcon: Icon(
                                  //       Icons.phone,
                                  //       color: Colors.white,
                                  //     ),
                                  //     hintText: 'Inserisci il numero di telefono',
                                  //     hintStyle: kHintTextStyle,
                                  //   ),
                                  //   validator: (value) {
                                  //     if (value.isEmpty) {
                                  //       return "Il campo 'numero' non può essere vuoto";
                                  //     }
                                  //     return null;
                                  //   },
                                  // ),
                                  // SizedBox(
                                  //   height: (global_height * 1.33) / 100,
                                  // ),
                                  Text(
                                    'Email',
                                    style: kLabelStyle,
                                  ),
                                  SizedBox(
                                    height: (global_height * 1.1) / 100,
                                  ),
                                  TextFormField(
                                    controller: email,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'OpenSans',
                                    ),
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3, color: Colors.white54),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3, color: Colors.red),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      contentPadding:
                                          EdgeInsets.only(top: 15.0),
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
                                    height: (global_height * 1.33) / 100,
                                  ),
                                  Text(
                                    'Password',
                                    style: kLabelStyle,
                                  ),
                                  SizedBox(
                                    height: (global_height * 1.1) / 100,
                                  ),
                                  TextFormField(
                                    controller: password,
                                    obscureText: _isHidden,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'OpenSans',
                                    ),
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3, color: Colors.white54),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3, color: Colors.red),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      contentPadding:
                                          EdgeInsets.only(top: 15.0, right: 15),
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
                                      if (value.isEmpty) {
                                        return "Il campo 'password' non può essere vuoto";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: (global_height * 1.33) / 100,
                                  ),
                                  Text(
                                    'Conferma della password',
                                    style: kLabelStyle,
                                  ),
                                  SizedBox(
                                    height: (global_height * 1.1) / 100,
                                  ),
                                  TextFormField(
                                    controller: passwordConfirm,
                                    obscureText: _isHidden,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'OpenSans',
                                    ),
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3, color: Colors.white54),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3, color: Colors.red),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      contentPadding:
                                          EdgeInsets.only(top: 15.0, right: 15),
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
                                      if (value.isEmpty) {
                                        return "Il campo 'password' non può essere vuoto";
                                      }
                                      if (value != password.text) {
                                        return "Le password devono corrispondere";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: (global_height * 1.33) / 100,
                                  ),
                                  _buildRegisterBtn(),
                                  _buildSigninBtn(),
                                  SizedBox(
                                    height: (global_height * 1.33) / 100,
                                  ),
                                ])))),
              ),
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
