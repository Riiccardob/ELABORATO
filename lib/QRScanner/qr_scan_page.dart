import 'package:elaborato/QRScanner/scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'button_widget.dart';

import '../main.dart';

class QRScanPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                text: 'Create QR Code',
                onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Scanner(),
                )),
              ),
              const SizedBox(height: 32),
              ButtonWidget(
                text: 'Scan QR Code',
                onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Scanner(),
                )),
              ),
            ],
          ),
        ),
      );
}
