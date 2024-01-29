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

  String _value = 'Hello World'; // private value

  void _onPressed(String value) { // function value 
    setState(() {
      _value = value;
      // setting private value to this function value
    });
  }

  @override
  // BuildContext = this is the context of which this method is being run, whether it's startup, shut down, refresh, etc.
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold is a structure on which you are going to build your material application
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Udemy Learn'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget> [
              Text(_value),
              ElevatedButton(onPressed: () => _onPressed('Hello Fauzan'), child: Text('Click Me'))
              // anonymous function that simply returns the on pressed with Hello Fauzan
              // remember on dart function are object as well
            ],
          ),
        ),
      ),
    );
  }
}