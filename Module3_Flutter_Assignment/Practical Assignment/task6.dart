import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 30,
                      backgroundImage: AssetImage("assets/me.jpg")
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("ADATIYA PAYAL ",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
                      Text('Flutter Developer', style: TextStyle(color: Colors.grey)),

                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}