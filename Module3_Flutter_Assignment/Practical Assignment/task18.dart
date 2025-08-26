import 'package:flutter/material.dart';

void main() => runApp(Task18App());

class Task18App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FeedbackForm(),
    );
  }
}

class FeedbackForm extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  String name = '';
  String comments = '';
  String category = 'General';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Feedback Form')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
              onChanged: (value) => name = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Comments'),
              onChanged: (value) => comments = value,
            ),
            DropdownButton<String>(
              value: category,
              onChanged: (String? newValue) {
                setState(() {
                  category = newValue!;
                });
              },
              items: <String>['General', 'Bug Report', 'Feature Request']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Process feedback
                print('Name: $name, Comments: $comments, Category: $category');
              },
              child: Text('Submit Feedback'),
            ),
          ],
        ),
      ),
    );
  }
}