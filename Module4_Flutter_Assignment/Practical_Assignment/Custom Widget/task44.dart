import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Widgets ',
      home: Scaffold(
        appBar: AppBar(title: Text('Custom Widgets')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ProfileScreen(),
              ProductCatalog(),
              CustomButton(
                text: 'Click Me',
                onPressed: () {
                  print('Button Pressed');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RatingWidget extends StatefulWidget {
  @override
  _RatingWidgetState createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index < _rating ? Icons.star : Icons.star_border,
            color: Colors.amber,
          ),
          onPressed: () {
            setState(() {
              _rating = index + 1;
            });
          },
        );
      }),
    );
  }
}

class ProgressBar extends StatelessWidget {
  final double percentage;

  ProgressBar({required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 20,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: FractionallySizedBox(
        widthFactor: percentage / 100,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final String image;
  final String bio;

  ProfileCard({required this.name, required this.image, required this.bio});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(image),
          Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(bio),
        ],
      ),
    );
  }
}

class AvatarBadge extends StatelessWidget {
  final String imageUrl;
  final bool isOnline;

  AvatarBadge({required this.imageUrl, required this.isOnline});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
          radius: 30,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: CircleAvatar(
            radius: 8,
            backgroundColor: isOnline ? Colors.green : Colors.red,
          ),
        ),
      ],
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileCard(
          name: 'Payal',
          image: 'assets/me.jpg',
          bio: 'Flutter Developer',
        ),
        RatingWidget(),
        ProgressBar(percentage: 75),
        AvatarBadge(
          imageUrl: 'data:image/jpeg;base64,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',
          isOnline: true,
        ),
      ],
    );
  }
}

class ProductCatalog extends StatelessWidget {
  final List<Map<String, String>> products = [
    {'name': 'Product 1', 'price': '\$10000', 'image': 'data:image/jpeg;base64,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'},
    {'name': 'Product 2', 'price': '\$20000', 'image': 'data:image/jpeg;base64,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'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            children: [
              Image.network(products[index]['image']!),
              Text(products[index]['name']!),
              Text(products[index]['price']!),
            ],
          ),
        );
      },
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(text, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}