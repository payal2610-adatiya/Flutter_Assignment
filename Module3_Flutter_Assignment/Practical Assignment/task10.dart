import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping Cart',
      home: ShoppingCart(),
    );
  }
}

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List<String> items = ['Apple', 'Banana', 'Orange', 'Milk', 'Bread'];
  int cartCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Center(child: Text('Cart: $cartCount')),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            trailing: ElevatedButton(
              child: Text('Add to Cart'),
              onPressed: () {
                setState(() {
                  cartCount++;
                });
              },
            ),
          );
        },
      ),
    );
  }
}