import 'package:flutter/material.dart';

void main() => runApp(const CustomListApp());

class CustomListApp extends StatelessWidget {
  const CustomListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CustomList(),
    );
  }
}

class CustomList extends StatelessWidget {
  const CustomList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom List')),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.task),
            title: Text('Task 1'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            ),
          ),
          ListTile(
            leading: Icon(Icons.task),
            title: Text('Task 2'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            ),
          ),
          // Add more ListTiles as needed
        ],
      ),
    );
  }
}