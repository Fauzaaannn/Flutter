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

  String _value = '';

  void _onClick() => setState(() => _value = DateTime.now().toString());

  @override
  // BuildContext = this is the context of which this method is being run, whether it's startup, shut down, refresh, etc.
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold is a structure on which you are going to build your material application
      appBar: AppBar(
        title: Text('Udemy Learn'),
        backgroundColor: Colors.blue,
      ),

      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.all(32.0),
          child: Column(
            children: <Widget>[
              Text('Click to set Date and Time'),
              ElevatedButton(onPressed: _onClick, child: Text('Set')),
              ElevatedButton(onPressed: () => Navigator.pop(context), child: Text('Close')),
            ],
          ),
        ),
      ),

      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget> [
              Text(_value),
            ],
          ),
        ),
      ),
    );
  }
}