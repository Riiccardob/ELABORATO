import 'package:elaborato/QRScanner/scanner.dart';
import 'package:elaborato/transaction/transactionPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:elaborato/SignIn-Up/login_screen.dart';
import 'package:elaborato/constants.dart';
import 'package:elaborato/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

String qrCode = 'Unknown';

class MyBottomNavBar extends StatefulWidget {
  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  String qrCode = 'Unknown';

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    SharedPreferences sharedPreferences;

    return Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
        bottom: 3,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(245, 56, 3, 1),
              Color.fromRGBO(245, 208, 32, 1),
            ]),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, -10),
              blurRadius: 35,
              color: Colors.yellow.withOpacity(0.4)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            // icon: Image.asset("assets/icons/whitefavicon.png"),
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          IconButton(
              icon: Icon(
                Icons.qr_code_scanner_outlined,
                color: Colors.white,
              ),
              // onPressed: () => scanQRCode(),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Scanner()),
                );
              }
              // onPressed: firstUse == true
              //     ? scanQRCode()
              //     : () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(builder: (context) => Scanner()),
              //         );
              //       }
              ),
          IconButton(
            icon: Icon(
              Icons.compare_arrows_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TransactionPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(() {
        this.qrCode = qrCode;
      });
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }
}
