import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'dart:async';
import 'dart:convert';
// import 'dart:io';


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

  Map _countries = Map();

  void _getData() async {
    var url = 'http://country.io/names.json'; // return a two letter representation of the country along with the full name, so we're getting a map in json form
    // json is a different way of representing data in a text format
    var response = await http.get(Uri.parse(url));

    // 200 means the server returned the data okay and there were no issues 
    if (response.statusCode == 200) { 
      setState(() => _countries = json.decode(response.body));
      print('Loaded ${_countries.length} countries');
    } else {
      print("Status code: ${response.statusCode}");
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
              Text('Countries', style: TextStyle(fontWeight: FontWeight.bold),),
              Expanded(
                child: ListView.builder(
                  itemCount: _countries.length,
                  itemBuilder: (BuildContext context, int index) {
                    String key = _countries.keys.elementAt(index);
                    return Row(
                      children: [
                        Text('${key} : '),
                        Text(_countries[key])
                      ],
                    );
                  },
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }
}