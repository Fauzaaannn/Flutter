import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp( // material app is an application that uses a material
    home: MyApp(),
  ));
}

// State is just simply remembering what's going on 
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // variables declaration
  int _value = 0;
  String _value1 = '';

  // functions
  void _add() => setState(() => _value++);
  void _remove() => setState(() => _value--);
  void _onClick() => setState(() => _value1 = DateTime.now().toString()); // convert integer date time to string

  @override
  // BuildContext = this is the context of which this method is being run, whether it's startup, shut down, refresh, etc.
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold is a structure on which you are going to build your material application
      appBar: AppBar(
        title: Text('Udemy Learn'),
        backgroundColor: Colors.red,
        actions: <Widget> [
          IconButton(onPressed: _add, icon: Icon(Icons.add)), // button function
          IconButton(onPressed: _remove, icon: Icon(Icons.remove)), // button function
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _onClick, // button function
        backgroundColor: Colors.red,
        mini: false, // floatingActionButton Size 
        child: Icon(Icons.timer),
      ),

      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget> [
              Text(_value.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),), // convert integer to string
              Text(_value1) // date time for floating action button
            ],
          ),
        ),
      ),
    );
  }
}