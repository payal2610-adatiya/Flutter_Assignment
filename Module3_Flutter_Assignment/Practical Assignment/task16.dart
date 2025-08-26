
import 'package:flutter/material.dart';

void main() => runApp(Task16App());

class Task16App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageCarousel(),
    );
  }
}

class ImageCarousel extends StatefulWidget {
  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final List<String> images = [
    'assets/image.jpeg',
    'assets/image.jpeg',
    'assets/image.jpeg',
    'assets/image.jpeg',

  ];

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    autoSlide();
  }

  void autoSlide() {
    Future.delayed(Duration(seconds: 3), () {
      if (currentIndex < images.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
      setState(() {});
      autoSlide();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Carousel')),
      body: PageView.builder(
        itemCount: images.length,
        onPageChanged: (index) {
          currentIndex = index;
        },
        itemBuilder: (context, index) {
          return Image.network(images[index]);
        },
      ),
    );
  }
}