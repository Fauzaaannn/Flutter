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
  int _value = 0; // Appbar
  String _value1 = ''; // date time
  String _value2 = ''; // footer

  // functions
  void _add() => setState(() => _value++);
  void _remove() => setState(() => _value--);
  void _onClick() => setState(() => _value1 = DateTime.now().toString()); // convert integer date time to string
  void _onClick1(String value) => setState(() => _value2 = value);  // footer 

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

      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.all(32.0),
          child: Column( // column is part of layout, is it helps us move things around the screen, and it can takes a list of widgets
            children: <Widget>[
              Text('Hello World'),
              ElevatedButton(onPressed: () => Navigator.pop(context), child: Text('Close')),
              // Navigator allows us to navigate around not just within the same window, but other windows as well
            ],
          )
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _onClick, // button function
        backgroundColor: Colors.red,
        mini: false, // floatingActionButton Size 
        child: Icon(Icons.timer),
      ),

      persistentFooterButtons: [ // Footer buttons are an easy way to add widgets to the footer 
        IconButton(onPressed: () => _onClick1('Timer'), icon: Icon(Icons.timer)),
        IconButton(onPressed: () => _onClick1('People'), icon: Icon(Icons.people)),
        IconButton(onPressed: () => _onClick1('Map'), icon: Icon(Icons.map)),
      ],

      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget> [
              Text(_value.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),), // convert integer to string
              Text(_value1), // date time for floating action button
              Text(_value2)
            ],
          ),
        ),
      ),
    );
  }
}