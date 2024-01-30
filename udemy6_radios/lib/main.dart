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

  int? _value1 = 0;
  int? _value2 = 0;

  void _setValue1(int? value) => setState(() => _value1 = value);
  void _setValue2(int? value) => setState(() => _value2 = value);

  // User The argument type 'void Function(int)' can't be assigned to the parameter type 'void Function(int?)?'.
  // dengan null safety, perlu menggunakan 'int?' untuk memberi tahu Dart bahwa variabel tersebut dapat berisi nilai null 
  // dengan null safety, tipe data non-nullable seperti 'int' tidak dapat mengambil nilai null secara langsung
  // oleh karena itu, deklarasi variabel seperti _value1 dengan tipe 'int?', itu berarti variabel tersebut dapat berisi nilai 'int' atau 'null'

  // Radio option 
  Widget makeRadios() {
    List<Widget> list = <Widget>[]; // Explicitly declare the type <Widget>

    for(int i = 0; i < 3; i++) {
      list.add(Radio(value: i, groupValue: _value1, onChanged: _setValue1));
      // ini adalah radionya, tetapi hanya dalam bentuk lingkaran untuk dipilih salah satu dan harus dipencet lingkarannya untuk dipilih
    }

    Column column = Column(children: list);
    return column;
  }

  Widget makeRadioTiles() {
    List<Widget> list = <Widget>[]; // Explicitly declare the type <Widget>

    for(int i = 0; i < 3; i++) {
      list.add(RadioListTile(
        value: i, 
        groupValue: _value2, 
        onChanged: _setValue2,
        activeColor: Colors.green,
        controlAffinity: ListTileControlAffinity.trailing,
        title: Text('Item: ${i}'),
        subtitle: Text('sub title'),
        ));
      // ini adalah radio yang berbentuk tile, sehingga tidak harus dipencet lingkarannya untuk dipilih
    }

    Column column = Column(children: list);
    return column;
  }

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
              makeRadios(),
              makeRadioTiles(),
            ],
          ),
        ),
      ),
    );
  }
}
