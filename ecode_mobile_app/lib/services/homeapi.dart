import 'package:http/http.dart' as http;
import 'dart:convert';

class TwitPage {
  String title = '';
  String body = '';

  Future<void> getTwit() async {
    try {
      http.Response response =
      await http.get(Uri.parse('https://dummyjson.com/posts/1'));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        String title = data['title'] ?? 'Title not available';
        String body = data['body'] ?? 'Body not available';

        print('Title: $title');
        print('Body: $body');

        // Update the instance variables with the retrieved values
        this.title = title;
        this.body = body;
      } else {
        print('Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      this.body = 'Could not get body data';
    }
  }
}
