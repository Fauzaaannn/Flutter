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

enum Answers{YES,NO,MAYBE}

class _MyAppState extends State<MyApp> {

  String _value = '';

  void _setValue(String value) => setState(() => _value = value);

  Future _askUser() async {
    switch( // switch case 
      await showDialog(
        context: context,
        builder: (BuildContext context) {
         return Container(
           child: SimpleDialog(
            title: Text('Do you like Flutter?'),
            children: <Widget>[
              SimpleDialogOption(child: Text('Yes!'), onPressed: (){Navigator.pop(context, Answers.YES);},),
              SimpleDialogOption(child: Text('Nope'), onPressed: (){Navigator.pop(context, Answers.NO);},),
              SimpleDialogOption(child: Text('Maybe'), onPressed: (){Navigator.pop(context, Answers.MAYBE);},),
            ]
           ),
         );
        }
      )
    ) {
      case Answers.YES:
        _setValue('YES');
        break;
      case Answers.NO:
        _setValue('NO');
        break;
      case Answers.MAYBE:
        _setValue('MAYBE');
        break;
    }
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
              Text(_value),
              ElevatedButton(onPressed: _askUser, child: Text('Click me'))
            ],
          ),
        ),
      ),
    );
  }
}