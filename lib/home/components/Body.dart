import 'package:elaborato/home/components/cards.dart';
import 'package:elaborato/transaction/recentTransactions.dart';
import 'package:elaborato/home/components/stats_products.dart';
import 'package:elaborato/utilities/themeStyles.dart';
import 'package:elaborato/home/components/stats_card.dart';
import 'package:flutter/material.dart';

final kInnerDecoration = BoxDecoration(
  color: Colors.white,
  border: Border.all(color: Colors.white),
  borderRadius: BorderRadius.circular(20),
);

final kGradientBoxDecoration = BoxDecoration(
  gradient: LinearGradient(colors: [
    Color.fromRGBO(0, 72, 200, 1.9),
    Color.fromRGBO(33, 121, 150, 1.9)
  ]),
  border: Border.all(
    width: 0,
    color: Color.fromRGBO(0, 55, 150, 1.9),
  ),
  borderRadius: BorderRadius.circular(20),
);

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CardsList(),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: StatsCards(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: StatsProducts(),
          ),
          SizedBox(
            height: 20,
          )
          // RecentTransactions(),
        ],
      ),
    );
  }
}
