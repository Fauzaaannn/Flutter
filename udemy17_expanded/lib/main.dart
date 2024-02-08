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

  @override
  // BuildContext = this is the context of which this method is being run, whether it's startup, shut down, refresh, etc.
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold is a structure on which you are going to build your material application
      appBar: AppBar(
        title: Text('Udemy Learn'),
      ),
      body: Container(
        color: Colors.grey[300],
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget> [
              Text('Images Demo'),
              Expanded(child: Image.asset('images/flutter.jpg')),
              Expanded(child: Image.asset('images/flutter.jpg')),
              // Expanded = it determines how much area of the screen you actually need to work with this
            ],
          ),
        ),
      ),
    );
  }
}