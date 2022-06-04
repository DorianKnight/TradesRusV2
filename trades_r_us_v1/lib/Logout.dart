import 'package:flutter/material.dart';
import 'package:trades_r_us_v1/CreateAccount.dart';

import 'LandingPage.dart';

class Logout extends StatefulWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: const Text('You have been logged out'),
      ),
      body: Center(
          child: Container(
        height: 100,
        width: 300,
        child: Card(
          elevation: 10,
          shadowColor: Colors.green[300],
          color: Colors.cyan[50],
          child: Center(
            child: ListTile(
              title: Text(
                "Press to return to home screen",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),
              ),
              onTap: (() {
                setState(() {
                  MyAccount.loggedin = false;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const LandingPage()));
                });
              }),
            ),
          ),
        ),
      )),
    ));
  }
}
