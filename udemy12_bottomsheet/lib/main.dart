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

  void _showBottom() {
    showModalBottomSheet<void>(
      context: context, 
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Some Data', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
              ElevatedButton(onPressed: () => Navigator.pop(context), child: Text('Close'))
            ],
          ),
        );
      },
      );
    // modal = it's the only thing that can be active in the application
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
              Text('Click for Bottom Modal Sheet'),
              ElevatedButton(onPressed: _showBottom, child: Text('Click me'))
            ],
          ),
        ),
      ),
    );
  }
}