import 'package:flutter/material.dart';

import 'PopUpMenu.dart';

class DemoQuote extends StatefulWidget {
  const DemoQuote({Key? key}) : super(key: key);

  @override
  State<DemoQuote> createState() => _DemoQuoteState();
}

class _DemoQuoteState extends State<DemoQuote> {
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          centerTitle: true,
          actions: [PopUp()],
          title: Text("Quotation", style: TextStyle(fontSize: 30)),
          leading: InkWell(
              onTap: (() {
                Navigator.pop(context);
              }),
              child: const Icon(Icons.arrow_back))),
      body: DemoQuotePage(),
    ));
  }
}

class DemoQuotePage extends StatelessWidget {
  DemoQuotePage({Key? key}) : super(key: key);
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
                'https://www.istitutomarangoni.com/marangoni/entities/article/CS-INTERIOR-DESIGN-JOB_IMG_D.jpg',
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
                  'Rooter Plumbing Company',
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                ))),
                ListTile(
                    leading: Text(
                      'Cost',
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: Text('\$60', style: TextStyle(fontSize: 20))),
              ]))
        ],
      ),
    );
  }
}
