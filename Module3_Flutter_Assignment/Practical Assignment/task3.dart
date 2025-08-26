import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Hello, Flutter!',
                style: TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              Text(
                'Welcome to Flutter Development',
                style: TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}