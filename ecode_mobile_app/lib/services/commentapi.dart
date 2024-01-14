import 'package:http/http.dart' as http;
import 'dart:convert';

class CommentPage {
  List<String> comments = [];

  Future<void> getComment() async {
    try {
      http.Response response = await http.get(Uri.parse('https://dummyjson.com/posts/1/comments'));

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);

        if (responseData.containsKey('comments')) {
          List<dynamic> commentData = responseData['comments'];

          comments = commentData.map<String>((comment) {
            return comment['body'].toString() ?? 'Comment body not available';
          }).toList();

          print('Comments: $comments');
        } else {
          print('Response does not contain a "comments" key');
        }
      } else {
        print('Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      comments = ['Could not get comment data'];
    }
  }


}
