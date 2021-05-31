import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:elaborato/bottomBar/my_bottom_nav_bar.dart';
import 'package:elaborato/constants.dart';
import 'package:elaborato/payments/PaypalPayment.dart';
import 'package:elaborato/token/cartPage.dart';
import 'package:elaborato/token/tokenData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'button_widget.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';

import '../main.dart';

// class Product {
//   String name;
//   String price;
//   String quantity;

//   Product(String name, String price, String quantity) {
//     this.name = name;
//     this.price = price;
//     this.quantity = quantity;
//   }

//   buildTitle(String name) {}

//   buildSubtitle(String s) {}
// }

// List<Product> chart = [];
// List<Widget> widChart = [];

class Scanner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  String qrCode = 'Unknown';

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
            'Scanner',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w800,
            ),
          ),
          toolbarHeight: 70,
        ),
        body: qrCode == 'Unknown' || qrCode == '-1'
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonWidget(
                      text: 'Scannerizza un QR',
                      onClicked: () => scanQRCode(),
                    ),
                  ],
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonWidget(
                      text: 'Visualizza il carrello',
                      onClicked: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => cartPage()),
                        );
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ButtonWidget(
                      text: 'Scannerizza un QR',
                      onClicked: () => scanQRCode(),
                    ),
                  ],
                ),
              ),
        bottomNavigationBar: MyBottomNavBar(),
      );

  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );
      firstUse = false;

      if (!mounted) return;

      setState(() {
        this.qrCode = qrCode;
      });
      verifyToken(qrCode, context);
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }
}
