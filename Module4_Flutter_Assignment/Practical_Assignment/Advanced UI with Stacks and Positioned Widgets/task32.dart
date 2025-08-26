import 'package:flutter/material.dart';

void main() => runApp(const CustomButtonApp());

class CustomButtonApp extends StatelessWidget {
  const CustomButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Custom Button')),
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Press Me'),
              ),
              Positioned(
                top: 0,
                child: const Icon(Icons.star, size: 24, color: Colors.yellow),
              ),
            ],
          ),
        ),
      ),
    );
  }
}