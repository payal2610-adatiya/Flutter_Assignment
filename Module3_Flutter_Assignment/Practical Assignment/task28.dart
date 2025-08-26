import 'package:flutter/material.dart';

void main() => runApp(const ProductListingApp());

class ProductListingApp extends StatelessWidget {
  const ProductListingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProductListing(),
    );
  }
}

class ProductListing extends StatelessWidget {
  const ProductListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Listing')),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ProductCard(name: 'Product 1', price: '\$10', image: 'https://via.placeholder.com/150'),
          ProductCard(name: 'Product 2', price: '\$20', image: 'https://via.placeholder.com/150'),
          ProductCard(name: 'Product 3', price: '\$30', image: 'https://via.placeholder.com/150'),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String image;

  const ProductCard({super.key, required this.name, required this.price, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(image),
          Text(name),
          Text(price),
        ],
      ),
    );
  }
}