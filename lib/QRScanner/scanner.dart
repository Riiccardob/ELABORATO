import 'package:elaborato/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'button_widget.dart';

import '../main.dart';

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
        // title: Image.asset(
        //   "assets/icons/logowhite.png",
        //   fit: BoxFit.contain,
        //   height: global_height * 0.55,
        //   width: global_width * 0.55,
        // ),
        toolbarHeight: 70,
      ),
      body: qrCode == 'Unknown' or '-1'
      // firstUse == true
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonWidget(
                    text: 'Start QR scan',
                    onClicked: () => scanQRCode(),
                  ),
                ],
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Scan Result',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '$qrCode',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 72),
                  ButtonWidget(
                    text: 'Start QR scan',
                    onClicked: () => scanQRCode(),
                  ),
                ],
              ),
            ));

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
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }
}
