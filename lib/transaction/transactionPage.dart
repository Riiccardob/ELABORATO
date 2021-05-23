import 'package:elaborato/SignIn-Up/login_screen.dart';
import 'package:elaborato/bottomBar/my_bottom_nav_bar.dart';
import 'package:elaborato/transaction/recentTransactions.dart';
import 'package:elaborato/utilities/themeColors.dart';
import 'package:elaborato/utilities/themeStyles.dart';
import 'package:elaborato/security/token.dart';
import 'package:elaborato/widgets/addNote.dart';
import 'package:elaborato/widgets/cardInPage.dart';
import 'package:elaborato/widgets/otherDetailsDivider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

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
        // title: Image.asset(
        //   "assets/icons/logowhite.png",
        //   fit: BoxFit.contain,
        //   height: global_height * 0.55,
        //   width: global_width * 0.55,
        // ),
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
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     // Navigator.push(
      //     //   context,
      //     //   MaterialPageRoute(builder: (context) => UploadPost()),
      //     // );
      //     // print("Mi stanno premendo");
      //   },
      //   isExtended: true,
      //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      //   icon: Icon(
      //     Icons.add_circle_outlined,
      //     color: Colors.white,
      //   ),
      //   label: Text('Scan QR-CODE'),
      // ),
    );
  }
}
