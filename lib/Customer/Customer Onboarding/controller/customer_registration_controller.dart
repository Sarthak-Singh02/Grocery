import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:one_stop_grocery/Customer/Customer%20Onboarding/model/customer_regiatration_model.dart';

class CustomerRegistraionController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  saveNewCustomerData(String phNum, BuildContext context) async {
    try {
      final box = GetStorage();
      await box.write("phNum", phNum);
      await box.write("name", nameController.text);
      await box.write("address", addressController.text);
      await box.write("city", cityController.text);
      await box.write("state", stateController.text);
      await CustomerRegistrationModel.addUser(context);
    } on Error {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Error! Please try again later")));
    }
  }
}
