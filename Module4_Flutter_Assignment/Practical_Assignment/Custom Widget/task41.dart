import 'package:flutter/material.dart';

void main() {
runApp(MyApp());
}

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'Rating Widget Demo',
home: Scaffold(
appBar: AppBar(title: Text('Rating Widget')),
body: Center(
child: RatingWidget(),
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