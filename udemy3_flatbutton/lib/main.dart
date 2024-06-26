import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp( // material app is an application that uses a material
    home: MyApp(),
  ));
}

// State is just simply remembering what's going on 
// State is the data associated with the applications current settings
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _value = 0; 

  // void _onPressed() {  
  //   setState(() {
  //     _value = DateTime.now().toString();
  //   });
  // }

  void _add() {  
    setState(() {
      _value++;
    });
  }

  void _substract() {  
    setState(() {
      _value--;
    });
  }

  @override
  // BuildContext = this is the context of which this method is being run, whether it's startup, shut down, refresh, etc.
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold is a structure on which you are going to build your material application
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Udemy Learn'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget> [
              // Text(_value),
              // ElevatedButton(onPressed: _onPressed, child: Text('Click me')),
              // TextButton(onPressed: _onPressed, child: Text('Click me')),
              Text('Value = ${_value}'),
              IconButton(onPressed: _add, icon: Icon(Icons.add)),
              IconButton(onPressed: _substract, icon: Icon(Icons.remove)),
            ],
          ),
        ),
      ),
    );
  }
}