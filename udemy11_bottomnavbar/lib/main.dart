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

  List<BottomNavigationBarItem> _items = []; // array
  // mendeklarasikan bahwa _items akan menjadi sebuah list yang hanya dapat menyimpan banyak objek dari tipe BottomNavigationBarItem
  String _value = ''; // string
  int _index = 0; // integer

  void initState() {
    super.initState(); // initial state is the initial state of the state class, meaning before anything's really rendered on the screen for the first time. And this is where we can actually set some state items, set some things.
    _items = <BottomNavigationBarItem> []; // menginisialisasi variabel _items sebagai list kosong
    _items.add(BottomNavigationBarItem(icon: Icon(Icons.people), label: ('People')));
    _items.add(BottomNavigationBarItem(icon: Icon(Icons.weekend), label: ('Weekend')));
    _items.add(BottomNavigationBarItem(icon: Icon(Icons.message), label: ('Message')));
    // dalam konteks aplikasi flutter ini, _items digunakan untuk menyimpan item-item yang akan ditampilkan dalam Bottom Navigation Bar pada aplikasi
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        fixedColor: Colors.blue,
        currentIndex: _index,
        onTap: (int item) { // when we tap one of them, we want to set that index
          setState(() {
            _index = item;
            _value = 'Current Value is : ${_index.toString()}';
          });
        },
        ),
    );
  }
}