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

// Allow the user to enter their name, and when a button is clicked, display a snackbar displaying their name.

class _MyAppState extends State<MyApp> {

  String _value = '';

  final GlobalKey<ScaffoldState> _scaffoldstate = GlobalKey<ScaffoldState>();

  void _showBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void _onChanged(String value) {
    setState(() {
      _value = value;
    });
  }

  @override
  // BuildContext = this is the context of which this method is being run, whether it's startup, shut down, refresh, etc.
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold is a structure on which you are going to build your material application
      key: _scaffoldstate,
      appBar: AppBar(
        title: Text('Udemy Learn', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget> [
              Text('Input Name Here'),
              TextField(
                onChanged: _onChanged, // mengambil fungsi onChanged
              ),
              ElevatedButton(onPressed: () => _showBar('Hello ${_value}'), child: const Text('Submit')),
              // mengambil fungsi _showBar
            ],
          ),
        ),
      ),
    );
  }
}