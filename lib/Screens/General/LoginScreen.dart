import 'package:flutter/material.dart';
import 'package:one_stop_grocery/Screens/Customer/CustomerLogin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(onPressed: () {}, child: Text("Login as Manager")),
          ElevatedButton(
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => CustomerLogin(),
                  ),
                );
              },
              child: Text("Login as Customer"))
        ]),
      ),
    );
  }
}
