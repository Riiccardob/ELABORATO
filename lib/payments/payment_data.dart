import 'dart:convert';
import 'dart:io';
import 'package:elaborato/QRScanner/scanner.dart';
import 'package:elaborato/SignIn-Up/login_screen.dart';
import 'package:elaborato/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:elaborato/token/tokenData.dart';
import 'PaypalPayment.dart';

Future<void> sendTransaction(String id, BuildContext context) async {
  var _uri = Uri.https('elaboratomacchinette.it', '/transaction');

  var response = await http.post(_uri,
      headers: {"token": token},
      // body: {'order_id': id, 'email': user.email}
      body: json.encode({"order_id": id, "email": user.email}));

  if (response.statusCode == 200) {
    print(response.body);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
    showVerifyResult(response.body, context);
  } else {
    print(response.body);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Scanner()),
    );
    showVerifyResult(response.body, context);
  }
}

showVerifyResult(String result, BuildContext context) async {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: Text(result),
          ));
}
