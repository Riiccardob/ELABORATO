import 'dart:convert';

import 'package:elaborato/SignIn-Up/login_screen.dart';
import 'package:elaborato/bottomBar/my_bottom_nav_bar.dart';
import 'package:elaborato/constants.dart';
import 'package:elaborato/payments/PaypalPayment.dart';
import 'package:elaborato/token/tokenData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:flutter_braintree/flutter_braintree.dart';

import '../main.dart';
import 'button_widget.dart';

// ignore: camel_case_types
class cartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _cartPageState();
}

// ignore: camel_case_types
class _cartPageState extends State<cartPage> {
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
            'Carrello',
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
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: cart.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(20)),
                        ),
                        // height: 50,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "PRODOTTO #" + (index + 1).toString(),
                                  style: TextStyle(fontSize: 24),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "•" + cart[index].name,
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  "•" + cart[index].price + "€",
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  "•Quantità: " + cart[index].quantity,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      cart.length == index + 1
                          ? Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: new BorderRadius.all(
                                          const Radius.circular(20)),
                                    ),
                                    // height: 50,
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              "Totale: " + TotalAmount + "€",
                                              style: TextStyle(fontSize: 24),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15, right: 23, left: 23),
                                      child: ButtonWidget(
                                        text: 'Paga con Paypal',
                                        onClicked: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  PaypalPayment(
                                                onFinish: (number) async {
                                                  // payment done
                                                  print('order id: ' + number);
                                                },
                                              ),
                                            ),
                                          );
                                          print("Mi stanno premendo");
                                        },
                                      )),
                                ],
                              ))
                          : SizedBox(
                              height: 1,
                            ),
                    ],
                  ));
            }),
        bottomNavigationBar: MyBottomNavBar(),
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: () {
        //     Navigator.of(context).push(
        //       MaterialPageRoute(
        //         builder: (BuildContext context) => PaypalPayment(
        //           onFinish: (number) async {
        //             // payment done
        //             print('order id: ' + number);
        //           },
        //         ),
        //       ),
        //     );
        //     print("Mi stanno premendo");
        //   },
        //   isExtended: true,
        //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        //   backgroundColor: Colors.orange,
        //   icon: Icon(
        //     Icons.payment,
        //     color: Colors.white,
        //   ),
        //   label: Text('Paga con PayPal'),
        // ),
      );
}
