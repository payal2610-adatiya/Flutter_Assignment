import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String username = "";
  String password = "";

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  // Load saved data
  loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString("username") ?? "";
      password = prefs.getString("password") ?? "";
    });
  }

  // Save data
  saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("username", usernameController.text);
    await prefs.setString("password", passwordController.text);
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("SharedPreferences Example")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(labelText: "Enter Username"),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: "Enter Password"),
              ),
              ElevatedButton(onPressed: saveData, child: const Text("Save")),
              const SizedBox(height: 20),
              Text("Saved Username: $username"),
              Text("Saved Password: $password"),
            ],
          ),
        ),
      ),
    );
  }
}
