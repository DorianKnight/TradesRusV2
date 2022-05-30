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
