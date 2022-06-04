import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

List<AccountRequest> postFromJson(String str) => List<AccountRequest>.from(
    jsonDecode(str).map((x) => AccountRequest.fromJson(x)));
String postToJson(List<AccountRequest> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AccountRequest {
  AccountRequest(
      {required this.id, required this.email, required this.password});

  int id;
  String email;
  String password;

  factory AccountRequest.fromJson(Map<String, dynamic> json) => AccountRequest(
        id: json["id"],
        email: json['email'],
        password: json['password'],
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'password': password,
      };
}

class RemoteService {
  Future<List<AccountRequest>?> getPost(var params) async {
    final uri = Uri.http('10.0.2.2:8000', '/login', params);
    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    //var uri = Uri.parse('http://10.0.2.2:8000/login');
    //uri.replace(queryParameters: params);
    var response =
        await http.post(uri, headers: headers, body: jsonEncode([params]));

    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }
}
