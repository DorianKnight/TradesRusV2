import 'package:flutter/material.dart';
import 'package:trades_r_us_v1/LogIn.dart';
import 'package:trades_r_us_v1/PasswordHash.dart';

import 'CreateAccount.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  var isLoggedIn = MyAccount.loggedin;
  String email = MyAccount.getEmail();

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.teal,
          title: const Text('My Profile'),
          leading: InkWell(
            onTap: (() {
              Navigator.pop(context);
            }),
            child: const Icon(Icons.arrow_back),
          ),
        ),
        body: Visibility(
          visible: isLoggedIn,
          child: Center(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Card(
                elevation: 2,
                shadowColor: Colors.teal,
                child: Text(
                  'Logged in as $email',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ),
          replacement: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 60,
                  width: 200,
                  child: Card(
                    elevation: 8,
                    shadowColor: Colors.blueAccent,
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      title: const Text(
                        'Log in',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      onTap: (() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => LogIn()));
                      }),
                    ),
                  ),
                ),
              ),
              const ListTile(
                contentPadding: EdgeInsets.all(20),
                title: Text(
                  "New to TradesRus? \nCreate an account",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: Container(
                  height: 60,
                  width: 200,
                  child: Card(
                    elevation: 8,
                    shadowColor: Colors.greenAccent,
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const CreateAccount()));
                      }),
                      title: const Text(
                        'Create Account',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
