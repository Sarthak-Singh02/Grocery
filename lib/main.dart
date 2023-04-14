import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:one_stop_grocery/General/HomeScreen/view/home_screen.dart';
import 'General/LoginScreen/view/login_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: CupertinoColors.systemGrey6,
      ),
      home: (box.hasData("phNum"))?HomeScreen():LoginScreen(),
    );
  }
}