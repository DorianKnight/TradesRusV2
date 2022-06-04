import 'package:flutter/material.dart';
import 'package:trades_r_us_v1/CreateAccount.dart';
import 'package:trades_r_us_v1/LandingPage.dart';
import 'Profile.dart';
import 'QuoteDemoPage.dart';
import 'FindTrades.dart';
import 'PopUpMenu.dart';

class Quotes extends StatefulWidget {
  Quotes({Key? key}) : super(key: key);

  @override
  State<Quotes> createState() => _Quotes();
}

class _Quotes extends State<Quotes> {
  bool isLoggedin = MyAccount.loggedin;
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            actions: [PopUp()],
            title: const Text(
              'Quotes',
              style:
                  TextStyle(fontSize: 30, fontFamily: 'PlayfairDisplay-Italic'),
            ),
            backgroundColor: Colors.redAccent,
          ),

          ///
          ///
          body: Visibility(
            visible: isLoggedin,
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              children: getChildrenOfGridview(context),
            ),
            replacement: Container(
              child: Card(
                child: ListTile(
                  title: Text(
                    "Log in to view your quotes",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    "Tap button to log in",
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => MyProfile()));
                    });
                  },
                ),
              ),
            ),
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
  int _selectedIndex = 2;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        {
          //Push to landing page
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => LandingPage()));
        }
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
          //Do nothing, you're on the right page
        }
        break;
    }
  }
}

List<Widget> getChildrenOfGridview(BuildContext context) {
  return [
    createGridViewChild(
        'Get it done Roofing.ink',
        'https://image.shutterstock.com/image-vector/roofing-logo-template-260nw-667144810.jpg',
        context,
        'QuoteDemoPage'),
    createGridViewChild(
        'Expect Welds Toronto',
        'https://as1.ftcdn.net/v2/jpg/02/73/58/64/500_F_273586418_6BXUozNGOqmTSVwZU27V5Qu4nQfvnDQj.jpg',
        context,
        'QuoteDemoPage'),
    createGridViewChild(
        'Precise Flooring Canada',
        'https://uh2e53580ga3zux1t1c61n11-wpengine.netdna-ssl.com/wp-content/uploads/2018/05/apple-touch-icon-180x180.png',
        context,
        'QuoteDemoPage'),
    createGridViewChild(
        'Ground and Mortor Tiling',
        'https://www.uniqueflooringgta.net/__static/0411b629a79fe4401f43bd59a46086d1/new-logo-1(6).png',
        context,
        'QuoteDemoPage'),
    createGridViewChild(
        'Mr Rooter Plumbing',
        'https://pbs.twimg.com/profile_images/483684288857010176/nV0Y_q7O_400x400.jpeg',
        context,
        'QuoteDemoPage'),
  ];
}

void pageDirector(BuildContext context, String destination) {
  switch (destination) {
    case 'LandingPage':
      {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LandingPage()));
      }
      break;
    case 'QuoteDemoPage':
      {
        Navigator.push(context, MaterialPageRoute(builder: (_) => DemoQuote()));
      }
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
              style: const TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    ),
  );
}
