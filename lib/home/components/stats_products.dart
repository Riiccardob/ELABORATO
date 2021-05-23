import 'package:elaborato/utilities/themeColors.dart';
import 'package:elaborato/utilities/themeStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class StatsProducts extends StatelessWidget {
  const StatsProducts({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
              top: 20.0, left: 15.0, right: 15.0, bottom: 16),
          child: Text('Statistiche prodotti', style: ThemeStyles.primaryTitle),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    // padding: const EdgeInsets.only(top: 16.0),
                    height: 90,
                    width: MediaQuery.of(context).size.width * 0.8,
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
                          'Patatine',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: Colors.white),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Prodotto comprato 25 volte',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      // padding: const EdgeInsets.only(top: 16.0),
                      height: 90,
                      width: MediaQuery.of(context).size.width * 0.8,
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
                            'Biscotti',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(color: Colors.white),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Prodotto comprato 19 volte',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      // padding: const EdgeInsets.only(top: 16.0),
                      height: 90,
                      width: MediaQuery.of(context).size.width * 0.8,
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
                            'Coca cola',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(color: Colors.white),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Prodotto comprato 15 volte',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
