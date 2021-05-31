import 'package:elaborato/bottomBar/my_bottom_nav_bar.dart';
import 'package:elaborato/transaction/recentTransactions.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatefulWidget {
  final String title;
  final String subTitle;
  final String price;
  final String letter;
  final Color color;
  TransactionPage({
    this.color,
    this.letter,
    this.price,
    this.subTitle,
    this.title,
  });
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
          'Transazioni',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        toolbarHeight: 70,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            RecentTransactions(),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
