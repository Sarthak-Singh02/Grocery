import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_stop_grocery/General/LoginScreen/Widgets/widgets.dart';
import 'package:one_stop_grocery/General/LoginScreen/controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: ListView(children: [
          const SizedBox(
            height: 60,
          ),
          const FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              "   Let's sign you in.   ",
              style: TextStyle(
                fontSize: 50,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              "   Enter your phone number to get OTP   ",
              style: TextStyle(
                fontSize: 30,
                color: CupertinoColors.systemGrey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: TextFormField(
                controller: controller.phoneController,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  hintText: "Phone Number",
                  hintStyle: const TextStyle(fontWeight: FontWeight.w300),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      width: 2.0,
                      color: Colors.deepOrange,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      color: CupertinoColors.systemGrey,
                      width: 2.0,
                    ),
                  ),
                )),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                  ),
                  child: const Text(
                    "Next",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  onPressed: ()  {
                    if (controller.phoneController.text.length == 10 &&
                        controller.phoneController.text.isNumericOnly) {
                       controller.sendOTP(
                          controller.phoneController.text, context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Invalid Contact")));
                    }
                  }))
        ]),
      ),
    );
  }
}