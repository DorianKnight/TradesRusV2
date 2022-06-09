import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(jsonDecode(str).map((x) => Post.fromJson(x)));
String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post(
      {required this.id,
      required this.trade,
      required this.company_name,
      this.body});

  int id;
  String trade;
  String company_name;
  String? body;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        trade: json['trade'],
        company_name: json['company_name'],
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'trade': trade,
        'company_name': company_name,
      };
}
