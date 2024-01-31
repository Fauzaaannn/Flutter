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

  String _value = '';

  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context, 
      initialDate: DateTime(2022),
      firstDate: DateTime(2020), 
      lastDate: DateTime(2024)
      );
    if(picked != null) setState(() => _value = picked.toString());
    // picked != null: Ini adalah kondisi yang memeriksa apakah pengguna benar-benar memilih tanggal dari date picker. Jika picked tidak null, artinya pengguna telah memilih tanggal.
    // catatan ada di notion udemy9_datepicker 
  }

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
              Text(_value),
              ElevatedButton(onPressed: _selectDate, child: Text('Pick A Date'))
            ],
          ),
        ),
      ),
    );
  }
}