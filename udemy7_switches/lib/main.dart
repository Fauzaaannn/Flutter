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

  bool _value1 = false;
  bool _value2 = false;

  void _onChanged1(bool value) => setState(() => _value1 = value );
  void _onChanged2(bool value) => setState(() => _value2 = value );

  @override
  // BuildContext = this is the context of which this method is being run, whether it's startup, shut down, refresh, etc.
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold is a structure on which you are going to build your material application
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text('Udemy Learn'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget> [
              Switch(value: _value1, onChanged: _onChanged1),
              SwitchListTile(
                value: _value2, 
                onChanged: _onChanged2,
                title: Text('Hello World', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
                )
            ],
          ),
        ),
      ),
    );
  }
}