import 'dart:convert';

import 'package:elaborato/QRScanner/scanner.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';

import 'cartPage.dart';

class Product {
  String name;
  String price;
  String quantity;

  Product(String name, String price, String quantity) {
    this.name = name;
    this.price = price;
    this.quantity = quantity;
  }

  buildTitle(String name) {}

  buildSubtitle(String s) {}
}

var token;

List<Product> cart = [];

var TotalAmount;

Future<void> verifyToken(qrCode, context) async {
  print(qrCode);
  var jsonData = null;
  token = qrCode;

  var _uri = Uri.https('elaboratomacchinette.it', '/verify');
  print(_uri);

  var response = await http.get(_uri, headers: {"token": token});

  if (response.statusCode == 200) {
    try {
      var payload = Jwt.parseJwt(token);
      print(payload);
      print(payload.length);
      print(payload['payload']);
      print(payload['payload']['cart'].length);
      print(payload['payload']['totalAmount']);
      TotalAmount = payload['payload']['totalAmount'].toString();

      for (int i = 0; i < payload['payload']['cart'].length; i++) {
        var product = payload['payload']['cart'][i];
        print(product);
        cart.add(Product(product['product'], _renderDouble((product['price'])),
            product['quantity']));
        print(cart[i].name + cart[i].price + cart[i].quantity);
      }
    } on Exception catch (e) {
      print("Errore");
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => cartPage()),
    );
    return true;
  } else {
    print(response.body);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Scanner()),
    );
    showVerifyResult(response.body, context);
    return false;
  }
}

showVerifyResult(String result, BuildContext context) async {
  var data = jsonDecode(result);
  var message = data['message'];
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: Text(message),
          ));
}

String _renderDouble(double number) {
  if (number < 10000)
    return number.toString();
  else if (number < 1000000)
    return (number / 1000).floor().toString() + "K";
  else
    return (number / 1000000).floor().toString() + "M";
}

String _renderNumber(int number) {
  if (number < 10000)
    return number.toString();
  else if (number < 1000000)
    return (number / 1000).floor().toString() + "K";
  else
    return (number / 1000000).floor().toString() + "M";
}
