import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: LoginScreen(), debugShowCheckedModeBanner: false));
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email1, password1;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login Form", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.blueGrey,
        ),
        body: Form(
            key: _formkey,
            child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                  TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    hintText: "Enter Email",
                    border: OutlineInputBorder(borderSide: BorderSide(width: 4.0)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    border: OutlineInputBorder(borderSide: BorderSide(width: 4.0)),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a valid password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        email1 = email.text.toString();
                        password1 = password.text.toString();

                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Login Successful"),
                                content: Text("Welcome, $email1!"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("OK"),
                                  ),
                                ],
                              );
                            },
                            );
                      }
                    },
  child: Text("Login"),
  ),
  ],
  ),
  ),
  ),
  );
}
}