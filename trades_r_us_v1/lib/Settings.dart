import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
          title: const Text('Settings'),
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
