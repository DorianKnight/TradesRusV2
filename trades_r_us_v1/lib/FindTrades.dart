import 'package:flutter/material.dart';

import 'LandingPage.dart';
import 'PopUpMenu.dart';
import 'Quotes.dart';
import 'TradesDemoPage.dart';

class FindTrades extends StatefulWidget {
  const FindTrades({Key? key}) : super(key: key);

  @override
  State<FindTrades> createState() => _FindTrades();
}

class _FindTrades extends State<FindTrades> {
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            actions: [PopUp()],
            title: const Text(
              'Search For Trades',
              style:
                  TextStyle(fontSize: 30, fontFamily: 'PlayfairDisplay-Italic'),
            ),
            backgroundColor: Colors.lightBlue,
          ),

          ///
          ///
          body: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            children: getChildrenOfGridview(context),
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
  int _selectedIndex = 1;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        {
          //Push to landing page
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const LandingPage()));
        }
        break;

      case 1:
        {
          //Do nothing, you're on the right page
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

List<Widget> getChildrenOfGridview(BuildContext context) {
  return [
    createGridViewChild(
        'Roofing',
        'https://www.build-review.com/wp-content/uploads/2021/01/roofing.jpg',
        context,
        'TradesDemoPage'),
    createGridViewChild(
        'Welding',
        'https://www.safetyandhealthmagazine.com/ext/resources/images/safety-tips/welder.jpg?1483464014',
        context,
        'TradesDemoPage'),
    createGridViewChild(
        'Flooring',
        'https://contentgrid.homedepot-static.com/hdus/en_US/DTCCOMNEW/Articles/types-of-flooring-hero-A.jpg',
        context,
        'TradesDemoPage'),
    createGridViewChild(
        'Tiling',
        'https://media.istockphoto.com/photos/laying-ceramic-tiles-picture-id534500443?k=20&m=534500443&s=612x612&w=0&h=UmvBneubcoNrt9huWf3UQGT7lLxkC9W4YT7uP1OuVJ4=',
        context,
        'TradesDemoPage'),
    createGridViewChild(
        'Plumbing',
        'https://blog.herzing.ca/hubfs/iStock-615603432.jpg',
        context,
        'TradesDemoPage'),
  ];
}

void pageDirector(BuildContext context, String destination) {
  switch (destination) {
    case 'LandingPage':
      {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const LandingPage()));
      }
      break;
    case 'TradesDemoPage':
      {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const DemoTrade()));
      }
      break;
  }
}

Widget createGridViewChild(
    String caption, String address, BuildContext context, String destination) {
  return Container(
    margin: const EdgeInsets.all(8.0),
    child: Card(
      color: Colors.greenAccent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          side: BorderSide(color: Colors.black, width: 2.0)),
      child: InkWell(
        splashColor: Colors.grey,
        onTap: () {
          pageDirector(context, destination);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
              child: Image.network(address,
                  width: 200, height: 140, fit: BoxFit.fill),
            ),
            Text(
              caption,
              style: const TextStyle(fontSize: 25),
            )
          ],
        ),
      ),
    ),
  );
}
