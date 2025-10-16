import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimationHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AnimationHomePage extends StatefulWidget {
  @override
  _AnimationHomePageState createState() => _AnimationHomePageState();
}

class _AnimationHomePageState extends State<AnimationHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Animations Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 1. Animated Button
            AnimatedButton(),
            SizedBox(height: 30),

            // 2. Hero Animation Navigation
            Column(
              children: [
                Hero(
                  tag: 'imageHero',
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage('https://picsum.photos/100'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondScreen()),
                    );
                  },
                  child: Text('Open Hero Animation'),
                ),
              ],
            ),

            SizedBox(height: 30),

            // 3. Loading Animation Demo
            LoadingAnimationDemo(),
          ],
        ),
      ),
    );
  }
}

// 1. Animated Button with implicit animations
class AnimatedButton extends StatefulWidget {
  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: _isPressed ? 160 : 200,
        height: _isPressed ? 60 : 80,
        decoration: BoxDecoration(
          color: _isPressed ? Colors.deepOrange : Colors.blue,
          borderRadius: BorderRadius.circular(_isPressed ? 20 : 40),
          boxShadow: [
            BoxShadow(
              color: _isPressed ? Colors.deepOrange.withOpacity(0.5) : Colors.blue.withOpacity(0.5),
              blurRadius: _isPressed ? 8 : 15,
              spreadRadius: _isPressed ? 2 : 5,
              offset: Offset(0, _isPressed ? 2 : 5),
            ),
          ],
        ),
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 200),
            style: TextStyle(
              color: Colors.white,
              fontSize: _isPressed ? 16 : 20,
              fontWeight: FontWeight.bold,
            ),
            child: Text(
              'Tap Me!',
            ),
          ),
        ),
      ),
    );
  }
}

// 2. Hero Animation between screens
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'imageHero',
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage('https://picsum.photos/200'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Hero Animation!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}

// 3. Loading Animation for Data Fetching
class LoadingAnimationDemo extends StatefulWidget {
  @override
  _LoadingAnimationDemoState createState() => _LoadingAnimationDemoState();
}

class _LoadingAnimationDemoState extends State<LoadingAnimationDemo> with SingleTickerProviderStateMixin {
  bool _isLoading = false;
  String _data = 'No data loaded';
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
      _data = 'Loading...';
    });

    // Simulate API call
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _isLoading = false;
      _data = 'Data loaded successfully!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 200,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: _isLoading
                ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Rotating loading indicator
                RotationTransition(
                  turns: _controller,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                // Pulsing text
                FadeTransition(
                  opacity: _animation,
                  child: Text(
                    'Loading...',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
                : Text(
              _data,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _isLoading ? null : _fetchData,
          child: Text('Fetch Data'),
        ),
      ],
    );
  }
}