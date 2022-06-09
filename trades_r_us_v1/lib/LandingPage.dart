import 'dart:collection';

import 'package:flutter/material.dart';
import 'FindTrades.dart';
import 'PopUpMenu.dart';
import 'Quotes.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPage();
}

class _LandingPage extends State<LandingPage> {
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(primaryColor: Colors.greenAccent),
        home: Scaffold(
          ///
          ///
          appBar: AppBar(
            centerTitle: true,
            actions: const [PopUp()],
            title: Text(
              'Trades R Us',
              style:
                  TextStyle(fontSize: 30, fontFamily: 'PlayfairDisplay-Italic'),
            ),
            backgroundColor: Colors.greenAccent,
          ),

          ///
          ///
          body: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                child: Image.network(
                    'https://cdn.shopify.com/s/files/1/0059/0056/6597/products/photo-id-6637646807109-cheerful-workman-smiling-at-the-camera-in-the-city_224a3edb-cae6-42fd-8b23-4070ccae5954_grande.jpg?v=1647790352',
                    width: 500,
                    height: 288,
                    fit: BoxFit.fill),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Card(
                  color: Colors.lightBlue[100],
                  child: ListTile(
                    title: Text(
                      "Your one stop shop for home renovations",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Card(
                  elevation: 8,
                  color: Colors.greenAccent,
                  shadowColor: Colors.deepOrange,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    title: Text(
                      "Search for trades",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const FindTrades()));
                      });
                    },
                  ),
                ),
              )
            ],
          ),

          ///
          ///
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.handyman),
                label: 'Find Trades',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long),
                label: 'Quotes',
              ),
            ],
            currentIndex: _selectedIndex,
            backgroundColor: Colors.greenAccent,
            unselectedItemColor: Colors.blueGrey,
            selectedItemColor: Colors.blueAccent,
            onTap: _onTap,
          ),
        ),
      );

  //Bottom nav bar logic
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        {/*Do nothing, you're on the right page*/}
        break;

      case 1:
        {
          //Push to Find Trades
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => FindTrades()));
        }
        break;

      case 2:
        {
          //Push to quotes
          Navigator.push(context, MaterialPageRoute(builder: (_) => Quotes()));
        }
        break;
    }
  }
}
