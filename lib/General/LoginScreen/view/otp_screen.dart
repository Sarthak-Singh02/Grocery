import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/widgets.dart';
import '../controller/login_controller.dart';

class OtpScreen extends StatelessWidget {
  final String phNum;
  OtpScreen({super.key, required this.phNum});
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        body: ListView(
          children: [
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
                "   Enter your OTP   ",
                style: TextStyle(
                  fontSize: 30,
                  color: CupertinoColors.systemGrey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: TextFormField(
                  obscureText: true,
                  controller: controller.otpController,
                  keyboardType: TextInputType.phone,
                  maxLength: 6,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    hintText: "Enter OTP",
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
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    onPressed: ()  {
                      if (controller.otpController.text.length == 6 &&
                          controller.phoneController.text.isNumericOnly) {
                         controller.verifyOTP(
                            controller.otpController.text, context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Invalid OTP")));
                      }
                    }))
          ],
        ),
      ),
    );
  }
}
