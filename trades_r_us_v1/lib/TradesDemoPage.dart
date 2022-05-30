import 'package:flutter/material.dart';

import 'PopUpMenu.dart';

class DemoTrade extends StatefulWidget {
  const DemoTrade({Key? key}) : super(key: key);

  @override
  State<DemoTrade> createState() => _DemoTradeState();
}

class _DemoTradeState extends State<DemoTrade> {
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          centerTitle: true,
          actions: [PopUp()],
          title: Text(
            "Tiling",
            style: TextStyle(fontSize: 30),
          ),
          leading: InkWell(
              onTap: (() {
                Navigator.pop(context);
              }),
              child: const Icon(Icons.arrow_back))),
      body: DemoTradePage(),
    ));
  }
}

class DemoTradePage extends StatelessWidget {
  DemoTradePage({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
            ),
            child: Image.network(
                'https://corporate.homedepot.com/sites/default/files/image_gallery/Hero%20Banner_Final.png',
                //width: 200,
                //height: 140,
                fit: BoxFit.fill),
          ),
          // ignore: prefer_const_constructors
          Card(
              color: Colors.orangeAccent,
              child: Column(children: const [
                ListTile(
                    title: Center(
                        child: Text(
                  'The Crooked Tile',
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                ))),
                ListTile(
                    leading: Text(
                      'Locality',
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing:
                        Text('Burlington', style: TextStyle(fontSize: 20))),
              ]))
        ],
      ),
    );
  }
}
