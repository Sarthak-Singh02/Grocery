import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get_storage/get_storage.dart';

import '../../../General/HomeScreen/view/home_screen.dart';
import '../view/customer_registration.dart';

class CustomerRegistrationModel {
  static addUser(BuildContext context) {
    try {
      final box = GetStorage();
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      return users
          .doc(box.read("phNum"))
          .set({
            "name": box.read("name"),
            "address": box.read("address"),
            "city": box.read("city"),
            "state": box.read("state")
          })
          .then((value) => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Successfully Registered"))))
          .catchError((error) => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Error! Failed to add user"))));
    } on Error {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Error! Please try again later")));
    }
  }

  static checkRegisteredUser(String phNum, BuildContext context) {
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(phNum)
          .get()
          .then((DocumentSnapshot documentSnapshot) async {
        if (documentSnapshot.exists) {
          final box = GetStorage();

          await box.write("phNum", phNum);
          await box.write("name", documentSnapshot.get("name"));
          await box.write("address", documentSnapshot.get("address"));
          await box.write("city", documentSnapshot.get("city"));
          await box.write("state", documentSnapshot.get("state"));
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => HomeScreen(),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => CustomerRegistration(
                phNum: phNum,
              ),
            ),
          );
        }
      });
    } on Error {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Error! Please try again later")));
    }
  }
}
