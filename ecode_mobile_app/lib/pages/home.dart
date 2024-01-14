import 'package:ecode_mobile_app/pages/comment.dart';
import 'package:flutter/material.dart';
import 'package:ecode_mobile_app/services/homeapi.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TwitPage twitPage;

  @override
  void initState() {
    super.initState();
    twitPage = TwitPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        flexibleSpace: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(50.0, 50.0, 0.0, 10.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/logogram.png'),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 50.0, 10.0, 10.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/profile.png'),
              ),
            ),
          ],
        ),
        title: Text('Ecode Fess'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<void>(
          future: twitPage.getTwit(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              String body = twitPage.body ?? 'Body not available';

              return Card(
                margin: EdgeInsets.all(16.0),
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
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
                      SizedBox(height: 8.0),
                      Text(
                        body,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Divider(color: Colors.grey),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(Icons.favorite_border),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.comment),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Comment()),
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.share),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
