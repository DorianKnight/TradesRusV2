import 'package:flutter/material.dart';
import 'Logout.dart';
import 'Profile.dart';
import 'Settings.dart';

class PopUp extends StatefulWidget {
  const PopUp({Key? key}) : super(key: key);

  @override
  State<PopUp> createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          const PopupMenuItem<int>(
            value: 0,
            child: Text("My Profile"),
          ),
          const PopupMenuItem<int>(
            value: 1,
            child: Text("Settings"),
          ),
          const PopupMenuItem<int>(
            value: 2,
            child: Text("Logout"),
          )
        ];
      },
      onSelected: (value) {
        switch (value) {
          case 0:
            {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => MyProfile()));
            }
            break;
          case 1:
            {
              Navigator.push(
                  context, MaterialPageRoute(builder: (builder) => Settings()));
            }
            break;
          case 2:
            {
              Navigator.push(
                  context, MaterialPageRoute(builder: (builder) => Logout()));
            }
            break;
        }
      },
    );
  }
}
