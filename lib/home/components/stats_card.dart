import 'package:elaborato/utilities/themeColors.dart';
import 'package:elaborato/utilities/themeStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class StatsCards extends StatelessWidget {
  const StatsCards({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
              top: 20.0, left: 15.0, right: 15.0, bottom: 16),
          child: Text('Statistiche spese', style: ThemeStyles.primaryTitle),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                // padding: const EdgeInsets.only(top: 16.0),
                height: 150,
                width: MediaQuery.of(context).size.width * 0.5 - 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.0),
                  color: Color.fromRGBO(57, 106, 252, 1),
                  // gradient: LinearGradient(
                  //     begin: Alignment.centerLeft,
                  //     end: Alignment.centerRight,

                  //     colors: [
                  //       Color.fromRGBO(57, 106, 252, 1),
                  //       Color.fromRGBO(41, 72, 255, 1),
                  //     ]),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Totale',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      '\€ 102,40',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 8.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 4.0),
                      height: 40.0,
                      child: Sparkline(
                        data: const <double>[0.0, 0.3, 0.2, 0.4, 0.3, 0.2, 0.3],
                        lineWidth: 3.5,
                        lineColor: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                // padding: const EdgeInsets.only(top: 16.0),
                height: 150,
                width: MediaQuery.of(context).size.width * 0.5 - 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.0),
                  // gradient: LinearGradient(
                  //     begin: Alignment.centerLeft,
                  //     end: Alignment.centerRight,
                  //     colors: [
                  //       Color.fromRGBO(245, 56, 3, 1),
                  //       Color.fromRGBO(245, 208, 32, 1),
                  //     ]),
                  color: Color.fromRGBO(38, 209, 72, 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Mese',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      '\€ 32,00',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 8.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 4.0),
                      height: 40.0,
                      child: Sparkline(
                        data: const <double>[0.0, 0.1, 0.3, 0.2, 0.0, 0.1, 0.2],
                        lineWidth: 3.5,
                        lineColor: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                // padding: const EdgeInsets.only(top: 16.0),
                height: 150,
                width: MediaQuery.of(context).size.width * 0.5 - 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.0),
                  // gradient: LinearGradient(
                  //     begin: Alignment.centerLeft,
                  //     end: Alignment.centerRight,
                  //     colors: [
                  //       Color.fromRGBO(34, 193, 195, 1),
                  //       Color.fromRGBO(253, 187, 45, 1),
                  //     ]),
                  color: Color.fromRGBO(173, 38, 167, 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Settimana',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      '\€ 7,00',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 8.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 4.0),
                      height: 40.0,
                      child: Sparkline(
                        data: const <double>[0.0, 0.3, 0.2, 0.4, 0.3, 0.2, 0.3],
                        lineWidth: 3.5,
                        lineColor: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                // padding: const EdgeInsets.only(top: 16.0),
                height: 150,
                width: MediaQuery.of(context).size.width * 0.5 - 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.0),
                  // gradient: LinearGradient(
                  //     begin: Alignment.centerLeft,
                  //     end: Alignment.centerRight,
                  //     colors: [
                  //       Color.fromRGBO(245, 56, 3, 1),
                  //       Color.fromRGBO(245, 208, 32, 1),
                  //     ]),
                  color: Color.fromRGBO(196, 199, 52, 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Oggi',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      '\€ 1,20',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 8.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 4.0),
                      height: 40.0,
                      child: Sparkline(
                        data: const <double>[0.0, 0.1, 0.3, 0.2, 0.0, 0.1, 0.2],
                        lineWidth: 3.5,
                        lineColor: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
