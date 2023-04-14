import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:one_stop_grocery/General/Widgets/widgets.dart';
import 'package:one_stop_grocery/General/HomeScreen/view/home_screen.dart';

import '../controller/customer_registration_controller.dart';

class CustomerRegistration extends StatelessWidget {
  final String phNum;
  CustomerRegistration({super.key, required this.phNum});
  final controller = Get.put(CustomerRegistraionController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: ListView(
          children: [
            const SizedBox(
              height: 60,
            ),
            const FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "   Let's get you registered   ",
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "+91 " + phNum,
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child:
                    Widgets.textFormField("Name", controller.nameController)),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Widgets.textFormField(
                  "House No.", controller.addressController),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
              child: Widgets.textFormField("City", controller.cityController),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
              child: Widgets.textFormField("State", controller.stateController),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
                child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                    ),
                    child: const Text(
                      "Next",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async {
                      if (controller.nameController.text.isNotEmpty &&
                          controller.addressController.text.isNotEmpty &&
                          controller.cityController.text.isNotEmpty &&
                          controller.stateController.text.isNotEmpty) {
                      await  controller.saveNewCustomerData(phNum, context);
                      Navigator.popUntil(context, (route) => route.isFirst);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => HomeScreen(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("All Fields are Mandatory")));
                      }
                    }))
          ],
        ),
      ),
    );
  }
}
