import 'package:flutter/material.dart';
import 'package:trades_r_us_v1/CreateAccount.dart';
import 'package:trades_r_us_v1/LoginConfirmation.dart';
import 'LoginReceive.dart';
import 'PasswordHash.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  final textController = TextEditingController();
  final passwordController = TextEditingController();
  PasswordHandler passClient = PasswordHandler();
  bool passwordVisible = false;
  bool matched = true;

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
          title: const Text('Log into your flutter account'),
          leading: InkWell(
            onTap: (() {
              Navigator.pop(context);
            }),
            child: const Icon(Icons.arrow_back),
          ),
        ),
        body: Column(
          children: [
            //Textfield for username
            Container(
              padding: EdgeInsets.only(left: 40, right: 40, top: 40),
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                  hintText: 'someone@example.com',
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.mail),
                  suffixIcon: textController.text.isEmpty
                      ? Container(width: 0)
                      : IconButton(
                          onPressed: () => textController.clear(),
                          icon: Icon(Icons.close),
                        ),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
              ),
            ),
            //Textfield for Password
            Container(
              padding: EdgeInsets.only(left: 40, right: 40, top: 20),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Your password",
                  labelText: 'Password',
                  errorText: matched ? null : "Password does not match",
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: IconButton(
                    onPressed: () =>
                        setState(() => passwordVisible = !passwordVisible),
                    icon: !passwordVisible
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  ),
                  border: OutlineInputBorder(),
                ),
                obscureText: !passwordVisible,
                textInputAction: TextInputAction.done,
              ),
            ),
            //Submission button
            Container(
              padding: EdgeInsets.all(16),
              child: Card(
                elevation: 8,
                shadowColor: Colors.deepOrange,
                child: ListTile(
                  title: Text(
                    "Sign in",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: (() async {
                    String passHashedStr = sha256
                        .convert(utf8.encode(passwordController.text))
                        .toString();
                    var params = {
                      'email': textController.text,
                    };
                    var AccountData = await RemoteService().getPost(params);

                    if (loginCorrect(AccountData, passHashedStr)) {
                      setState(() {
                        MyAccount.loggedin = true;
                        matched = true;
                        //print("YOU ARE NOW LOGGED IN " +
                        //    MyAccount.loggedin.toString());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => LoggedinConfirm()));
                      });
                    } else {
                      setState(() {
                        MyAccount.loggedin = false;
                        matched = false;
                      });
                      print("Not logged in");
                    }
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

bool loginCorrect(var AccountData, String userInputPass) {
  String databasePass = AccountData[0].password;
  if (databasePass == userInputPass) {
    MyAccount.email = AccountData[0].email;
    return true;
  } else {
    return false;
  }
}
