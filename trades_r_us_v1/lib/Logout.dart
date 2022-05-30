import 'package:flutter/material.dart';

class Logout extends StatelessWidget {
  const Logout({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.amber,
          title: const Text('You have been logged out'),
          leading: InkWell(
            onTap: (() {
              Navigator.pop(context);
            }),
            child: const Icon(Icons.arrow_back),
          ),
        ),
      ),
    );
  }
}
