import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:trades_r_us_v1/ConfirmCreation.dart';
import 'package:trades_r_us_v1/PasswordHash.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Account MyAccount = Account(email: 'placeholder', loggedin: false);

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final textController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  PasswordHandler passClient = PasswordHandler();
  bool passwordVisible = false;
  bool confirmVisible = false;
  bool matched = true;
  @override
  void initState() {
    super.initState();
    textController.addListener(() => setState(() {}));
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.greenAccent,
          title: const Text('Create your flutter account'),
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
                  hintText: "Something strong",
                  labelText: 'Password',
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
            //Textfield for confirm Password
            Container(
              padding: EdgeInsets.only(left: 40, right: 40, top: 20),
              child: TextField(
                controller: confirmController,
                decoration: InputDecoration(
                  hintText: "Same as above",
                  labelText: 'Confirm password',
                  errorText: matched ? null : "Password does not match",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () =>
                        setState(() => confirmVisible = !confirmVisible),
                    icon: !confirmVisible
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  ),
                  border: OutlineInputBorder(),
                ),
                obscureText: !confirmVisible,
                textInputAction: TextInputAction.done,
              ),
            ),
            //Submission button
            Container(
              padding: EdgeInsets.all(16),
              child: Card(
                elevation: 8,
                shadowColor: Colors.greenAccent,
                child: ListTile(
                  title: Text(
                    "Create account",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: (() {
                    if (passClient.match(
                        passwordController.text, confirmController.text)) {
                      setState(() {
                        matched = true;
                      });
                      createNewAccount(textController.text,
                          passwordController.text, MyAccount);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => AccountCreated()));
                    } else {
                      setState(() {
                        matched = false;
                      });
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

void createNewAccount(String email, String pass, Account MyAccount) {
  //Set the email and password as parameters within the account class
  MyAccount.setEmail(email);
  MyAccount.setPass(sha256.convert(utf8.encode(pass)));
  MyAccount.changeLoginStatus(true);
  var data = {'email': email, 'password': MyAccount.password.toString()};
  http.post(Uri.parse('http://10.0.2.2:8000/addaccount'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode([data]));

  //Add data to database
}
