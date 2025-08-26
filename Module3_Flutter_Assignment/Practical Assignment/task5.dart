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
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(width: 100, height: 100, color: Colors.red),
            Container(width: 150, height: 100, color: Colors.green),
            Container(width: 200, height: 100, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}