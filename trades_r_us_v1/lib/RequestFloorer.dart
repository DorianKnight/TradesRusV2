import 'package:http/http.dart' as http;
import 'Post.dart';

class RemoteService {
  Future<List<Post>?> getPost() async {
    var client = http.Client();

    var uri = Uri.parse('http://10.0.2.2:8000/floorers');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }
}
