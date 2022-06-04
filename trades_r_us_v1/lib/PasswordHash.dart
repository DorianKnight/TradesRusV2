import 'dart:convert';
import 'package:crypto/crypto.dart';

class PasswordHandler {
  bool match(String pass1, String pass2) {
    var bytes1 = utf8.encode(pass1);
    var bytes2 = utf8.encode(pass2);
    Digest hash1 = sha256.convert(bytes1);
    Digest hash2 = sha256.convert(bytes2);

    if (hash1.toString() == hash2.toString()) {
      print('Password matched');
      return true;
    }
    print('Password not matched');
    return false;
  }
}

class Account {
  Account({
    required this.email,
    this.password,
    required this.loggedin,
  });
  String email;
  Digest? password;
  bool loggedin;

  setEmail(String email) {
    this.email = email;
  }

  setPass(Digest password) {
    this.password = password;
  }

  changeLoginStatus(bool loggedin) {
    this.loggedin = loggedin;
  }

  String getEmail() {
    return email;
  }

  String? getPass() {
    return password.toString();
  }
}
