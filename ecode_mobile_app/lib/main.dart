import 'package:flutter/material.dart';
import 'package:ecode_mobile_app/pages/login.dart';
import 'package:ecode_mobile_app/pages/home.dart';
import 'package:ecode_mobile_app/pages/comment.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => LoginPage(),
    '/home': (context) => Home(),
    '/comment': (context) => Comment()
  },
));