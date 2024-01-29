import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? _value1 = false;
  bool? _value2 = false;

  void _value1Changed(bool? value) => setState(() => _value1 = value);
  void _value2Changed(bool? value) => setState(() => _value2 = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Udemy Learn',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Checkbox(value: _value1 ?? false, onChanged: _value1Changed),
              CheckboxListTile(
                value: _value2 ?? false, 
                onChanged: _value2Changed,
                title: Text('Hello World'),
                controlAffinity: ListTileControlAffinity.leading,
                subtitle: Text('Subtitle'),
                secondary: Icon(Icons.archive),
                activeColor: Colors.red,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
