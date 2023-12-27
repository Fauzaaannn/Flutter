import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  home: OjanCard(),
));

class OjanCard extends StatefulWidget {
  const OjanCard({super.key});

  @override
  State<OjanCard> createState() => _OjanCardState();
}

class _OjanCardState extends State<OjanCard> {

  int ninjaLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Fauzan Profile Page',
        style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() { // updated immediately without the need to reload.
            ninjaLevel++;
          });
        },
        backgroundColor: Colors.grey[600],
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/ninja.png'),
                radius: 40.0,
              ),
            ),
            Divider(
              height: 60.0,
              color: Colors.grey[800],
            ),
            Text('NAME',
            style: TextStyle(
              color: Colors.grey,
              letterSpacing: 2.0,
            ),
            ),
            SizedBox(height: 10.0),
            Text('Fauzan',
              style: TextStyle(
                color: Colors.amberAccent[200],
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.0),

            Text('CURRENT LEVEL',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text('$ninjaLevel',
              style: TextStyle(
                color: Colors.amberAccent[200],
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              children: [
                Icon(
                  Icons.email,
                  color: Colors.grey[400],
                ),
                SizedBox(width: 10.0,),
                Text('fauzan@gmail.com',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 18.0,
                  letterSpacing: 1.0,
                )
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}




