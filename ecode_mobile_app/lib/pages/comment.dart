import 'package:flutter/material.dart';
import 'package:ecode_mobile_app/services/homeapi.dart';
import 'package:ecode_mobile_app/services/commentapi.dart';

class Comment extends StatefulWidget {
  const Comment({Key? key}) : super(key: key);

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  TwitPage twitPage = TwitPage(); // Import TwitPage
  CommentPage commentPage = CommentPage(); // Import CommentPage
  TextEditingController commentController = TextEditingController(); // Add this line to declare the controller

  @override
  void initState() {
    super.initState();
    twitPage.getTwit();
    commentPage.getComment();
  }

  void addComment() {
    String newComment = commentController.text.trim();
    if (newComment.isNotEmpty) {
      setState(() {
        commentPage.comments.add(newComment);
        commentController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        flexibleSpace: Row(
          children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 50.0, 10.0, 10.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/profile.png'),
              ),
            ),
          ],
        ),
        title: Text('Comment'),
        centerTitle: true,
        elevation: 4.0,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/profile.png'),
                      ),
                      SizedBox(width: 8.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fauzan',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '@handle • ${DateTime.now().toString()}',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    twitPage.body, // Access body from twitPage
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Comments:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  // List of comments using Card widget
                  for (int index = 0; index < commentPage.comments.length; index++)
                    Card(
                      elevation: 3.0,
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage('assets/car.png'),
                                ),
                                SizedBox(width: 8.0),
                                Expanded(
                                  child: Text(
                                    commentPage.comments[index],
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    // Implement logic to delete the comment
                                    setState(() {
                                      commentPage.comments.removeAt(index);
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: commentController,
                decoration: InputDecoration(
                  hintText: 'Add a comment...',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: addComment,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
