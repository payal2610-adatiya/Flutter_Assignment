import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToggleApp(),
    );
  }
}

class ToggleApp extends StatefulWidget {
  @override
  _ToggleAppState createState() => _ToggleAppState();
}

class _ToggleAppState extends State<ToggleApp> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? Colors.grey[800] : Colors.white,
      appBar: AppBar(
        title: Text('Toggle Switch'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Dark Mode',
              style: TextStyle(
                fontSize: 20,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            Switch(
              value: isDark,
              onChanged: (bool value) {
                setState(() {
                  isDark = value;
                });
              },
              activeColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}