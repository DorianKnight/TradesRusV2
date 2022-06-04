import 'package:flutter/material.dart';
import 'package:trades_r_us_v1/CreateAccount.dart';
import 'package:trades_r_us_v1/LandingPage.dart';

class AccountCreated extends StatefulWidget {
  const AccountCreated({Key? key}) : super(key: key);

  @override
  State<AccountCreated> createState() => _AccountCreatedState();
}

class _AccountCreatedState extends State<AccountCreated> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Your account has been created'),
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
                    "You are logged in",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25),
                  ),
                  subtitle: const Text(
                    "Press to return to home screen",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  onTap: (() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const LandingPage()));
                  }),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
