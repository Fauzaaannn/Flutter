import 'package:flutter/material.dart';
import 'package:ecode_mobile_app/services/loginapi.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    final result = await ApiService.login(
      _usernameController.text,
      _passwordController.text,
    );

    if (result['success']) {
      print('Login successful');
      print(result['data']);

      Navigator.pushNamed(context, '/home');
    } else {
      print('Login failed');
      print(result['error']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Welcome to Ecode Mobile App',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
              ),
              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  // Add navigation to registration page or password recovery page
                },
                child: Text('Forgot Password?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
