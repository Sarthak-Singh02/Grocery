import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  final box = GetStorage();
  @override
  void onInit() {
    nameController.text = box.read("name");
    addressController.text = box.read("address");
    cityController.text = box.read("city");
    stateController.text = box.read("state");
    super.onInit();
  }

  updateData(BuildContext ctx) {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      return users.doc(box.read("phNum")).update({
        "name": nameController.text,
        "address": addressController.text,
        "city": cityController.text,
        "state": stateController.text
      }).then((value) {
        box.write("name", nameController.text);
        box.write("address", addressController.text);
        box.write("city", cityController.text);
        box.write("state", stateController.text);
        ScaffoldMessenger.of(ctx).showSnackBar(
            const SnackBar(content: Text("Successfully Updated")));
        Navigator.pop(ctx);
      });
    } on Error {
      ScaffoldMessenger.of(ctx).showSnackBar(
          const SnackBar(content: Text("Error! Please try again later")));
    }
    update();
  }
}
