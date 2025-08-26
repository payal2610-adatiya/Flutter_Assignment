import 'package:flutter/material.dart';

void main() => runApp(Task15App());

class Task15App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AssetImageDisplay(),
    );
  }
}

class AssetImageDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Local Asset Image')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('BoxFit.cover'),
            Image.asset(
              'assets/image.jpeg',
              fit: BoxFit.cover,
              width: 200,
              height: 200,
            ),
            Text('BoxFit.contain'),
            Image.asset(
              'assets/img.jpeg',
              fit: BoxFit.contain,
              width: 200,
              height: 200,
            ),
            Text('BoxFit.fill'),
            Image.asset(
              'assets/imgs.jpeg',
              fit: BoxFit.fill,
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}