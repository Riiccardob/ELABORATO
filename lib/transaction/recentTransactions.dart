import 'package:elaborato/utilities/themeStyles.dart';
import 'package:elaborato/widgets/transactionCard.dart';
import 'package:flutter/material.dart';

class RecentTransactions extends StatefulWidget {
  @override
  _RecentTransactionsState createState() => _RecentTransactionsState();
}

class _RecentTransactionsState extends State<RecentTransactions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionCard(
          color: Colors.black,
          letter: 'M1',
          title: 'Patatine',
          subTitle: 'Macchinetta 1',
          price: '2 €',
        ),
        TransactionCard(
          color: Color(0xfffe695d),
          letter: 'M1',
          title: 'Biscotti',
          subTitle: 'Macchinetta 1',
          price: '1,5 €',
        ),
        TransactionCard(
          color: Color(0xff103289),
          letter: 'M1',
          title: 'Patatine',
          subTitle: 'Macchinetta 1',
          price: '2 €',
        ),
        TransactionCard(
          color: Colors.greenAccent,
          letter: 'M2',
          title: 'Patatine',
          subTitle: 'Macchinetta 2',
          price: '2 €',
        ),
        TransactionCard(
          color: Colors.amberAccent,
          letter: 'M1',
          title: 'Coca Cola',
          subTitle: 'Macchinetta 1',
          price: '3 €',
        ),
        TransactionCard(
          color: Colors.black,
          letter: 'M1',
          title: 'Patatine',
          subTitle: 'Macchinetta 1',
          price: '2 €',
        ),
        TransactionCard(
          color: Color(0xfffe695d),
          letter: 'M1',
          title: 'Biscotti',
          subTitle: 'Macchinetta 1',
          price: '1,5 €',
        ),
        TransactionCard(
          color: Color(0xff103289),
          letter: 'M1',
          title: 'Patatine',
          subTitle: 'Macchinetta 1',
          price: '2 €',
        ),
        TransactionCard(
          color: Colors.greenAccent,
          letter: 'M2',
          title: 'Patatine',
          subTitle: 'Macchinetta 2',
          price: '2 €',
        ),
        TransactionCard(
          color: Colors.amberAccent,
          letter: 'M1',
          title: 'Coca Cola',
          subTitle: 'Macchinetta 1',
          price: '3 €',
        ),
        TransactionCard(
          color: Colors.black,
          letter: 'M1',
          title: 'Patatine',
          subTitle: 'Macchinetta 1',
          price: '2 €',
        ),
        TransactionCard(
          color: Color(0xfffe695d),
          letter: 'M1',
          title: 'Biscotti',
          subTitle: 'Macchinetta 1',
          price: '1,5 €',
        ),
        TransactionCard(
          color: Color(0xff103289),
          letter: 'M1',
          title: 'Patatine',
          subTitle: 'Macchinetta 1',
          price: '2 €',
        ),
        TransactionCard(
          color: Colors.greenAccent,
          letter: 'M2',
          title: 'Patatine',
          subTitle: 'Macchinetta 2',
          price: '2 €',
        ),
        TransactionCard(
          color: Colors.amberAccent,
          letter: 'M1',
          title: 'Coca Cola',
          subTitle: 'Macchinetta 1',
          price: '3 €',
        ),
      ],
    );
  }
}
