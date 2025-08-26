import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: FeedbackForm(), debugShowCheckedModeBanner: false));
}

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final _formKey = GlobalKey<FormState>();
  String? selectedRating;
  bool isAnonymous = false;
  TextEditingController feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedback Form", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueGrey,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintText: "Select Rating",
                  border: OutlineInputBorder(borderSide: BorderSide(width: 4.0)),
                ),
                value: selectedRating,
                items: <String>['1', '2', '3', '4', '5']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedRating = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select a rating';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: feedbackController,
                decoration: InputDecoration(
                  hintText: "Enter your feedback",
                  border: OutlineInputBorder(borderSide: BorderSide(width: 4.0)),
                ),
                maxLines: 4,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your feedback';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: isAnonymous,
                    onChanged: (value) {
                      setState(() {
                        isAnonymous = value!;
                      });
                    },
                  ),
                  Text("Submit Anonymously"),
                ],
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {

                    String feedback = feedbackController.text;
                    String anonymity = isAnonymous ? "Anonymous" : "Identified";

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Feedback Submitted! Rating: $selectedRating, Anonymity: $anonymity")),
                    );
                  }
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}