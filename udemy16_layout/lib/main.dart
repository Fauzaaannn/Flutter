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

  TextEditingController _user = new TextEditingController();
  TextEditingController _pass = new TextEditingController();

  @override
  // BuildContext = this is the context of which this method is being run, whether it's startup, shut down, refresh, etc.
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold is a structure on which you are going to build your material application
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Udemy Learn', style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget> [
              Text('Please Login'),
              Row(
                children: <Widget>[
                  Text('Username: '),
                  Expanded(child: TextField(controller: _user,))
                  // the label has a fixed sized, the text field is considered a greedy widget, meaning it's going to take as much space as you give it and it's just going to keep going
                  // expanded = it says it expands to take up the rest of the screen or the rest of the widget that we're a child of and then fills the text field to fill that
                ],
              ),
              Row(
                children: <Widget>[
                  Text('Password: '),
                  Expanded(child: TextField(controller: _pass, obscureText: true,))
                ],
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: ElevatedButton(onPressed: () => print('Login ${_user.text}'), child: Text('Click me')),
              ),
              Card(
                child: Container(
                  padding: EdgeInsets.all(32.0),
                  child: Column(
                    children: <Widget>[
                      Text('Hello World'),
                      Text('How Are You?'),
                    ]
                  ),
                ),
              ),
              Card(
                child: Container(
                  padding: EdgeInsets.all(32.0),
                  child: Column(
                    children: <Widget>[
                      Text('Hello World'),
                      Text('How Are You?'),
                    ]
                  ),
                ),
              ),
              Card(
                child: Container(
                  padding: EdgeInsets.all(32.0),
                  child: Column(
                    children: <Widget>[
                      Text('Hello World'),
                      Text('How Are You?'),
                    ]
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}