import 'package:flutter/material.dart';

void main() => runApp(const CardWithFABApp());

class CardWithFABApp extends StatelessWidget {
  const CardWithFABApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Card UI')),
        body: Stack(
          children: [
            Center(
              child: Card(
                elevation: 4,
                child: SizedBox(
                  width: 300,
                  height: 200,
                  child: const Center(child: Text('This is a card')),
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              right: 16,
              child: FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}