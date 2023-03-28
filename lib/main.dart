import 'package:flutter/material.dart';
import 'package:one_stop_grocery/Screens/General/LoginScreen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.green,
      ),
      home:  LoginScreen(),
    );
  }
}

