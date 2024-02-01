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

  String _value = '';
  String _display = '';

  void _onChanged(String value) {
    setState(() {
      _value = value;
    });
  }

  void _onClick() {
    setState(() {
      _display = _value;
    });
  }

  // _display > _value > value
  // dimana _value ditulisan dalam fungsi diatas yang mengartikan bahwa _value memiliki nilai yang sama dengan value
  // dan _display memiliki nilai yang sama dengan _value saat di click

  @override
  // BuildContext = this is the context of which this method is being run, whether it's startup, shut down, refresh, etc.
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold is a structure on which you are going to build your material application
      appBar: AppBar(
        title: Text('Udemy Learn', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget> [
              Text(_display), // mengambil nilai display
              TextField(
                autocorrect: true,
                autofocus: true,
                keyboardType: TextInputType.text,
                onChanged: _onChanged, // mengambil fungsi onChanged
              ),
              ElevatedButton(onPressed: _onClick, child: const Text('Submit')),
              // mengambil fungsi _onClick
            ],
          ),
        ),
      ),
    );
  }
}