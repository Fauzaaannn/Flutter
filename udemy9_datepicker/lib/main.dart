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

  double _value = 0.0;

  void _setValue(double value) => setState(() => _value = value );

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
              Text('Value: ${(_value * 100).round()}'), 
              // round = membulatkan angka desimal, tanpa round output yang dikeluarkan akan menjadi desimal
              // _value * 100 = untuk memberikan jarak atau jangkauan nilai pada slider
              Slider(value: _value, onChanged: _setValue)
            ],
          ),
        ),
      ),
    );
  }
}