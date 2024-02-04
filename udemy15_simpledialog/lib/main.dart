import 'package:flutter/material.dart';
import 'dart:async';

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

  Future _showAlert(BuildContext context, String message) async {
    return showDialog(
      context: context, 
      builder: (BuildContext context) {
        return Container(
          child: AlertDialog(
          title: Text(message),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: Text('Ok'))
          ],
        ),
        );
      }
      );
  }

  @override
  // BuildContext = this is the context of which this method is being run, whether it's startup, shut down, refresh, etc.
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold is a structure on which you are going to build your material application
      appBar: AppBar(
        title: Text('Udemy Learn'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget> [
              Text('Add Widget Here'),
              ElevatedButton(onPressed: () => _showAlert(context, 'do you like flutter, I do!'), child: Text('Click me'))
            ],
          ),
        ),
      ),
    );
  }
}