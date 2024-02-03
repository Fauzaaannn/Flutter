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

// key = a key is a way of referencing the actual widget

class _MyAppState extends State<MyApp> {

  final GlobalKey<ScaffoldState> _scaffoldstate = GlobalKey<ScaffoldState>();
  // GlobalKey = this means that it will be available accross the entire application no matter where you call it

  void _showBar() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Hello World')));
  }

  @override
  // BuildContext = this is the context of which this method is being run, whether it's startup, shut down, refresh, etc.
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold is a structure on which you are going to build your material application
      key: _scaffoldstate,
      // this scaffold has e key of scaffold state, meaning it's taking this object and making a reference to it in here
      appBar: AppBar(
        title: Text('Udemy Learn'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget> [
              ElevatedButton(onPressed: _showBar, child: Text('Click me'))
            ],
          ),
        ),
      ),
    );
  }
}