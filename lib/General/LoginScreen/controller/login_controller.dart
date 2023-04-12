import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:one_stop_grocery/Customer/Customer%20Onboarding/model/customer_regiatration_model.dart';
import 'package:one_stop_grocery/Customer/Customer%20Onboarding/view/customer_registration.dart';
import 'package:one_stop_grocery/General/LoginScreen/Widgets/widgets.dart';
import 'package:one_stop_grocery/General/LoginScreen/view/otp_screen.dart';

import '../../../HomeScreen/view/home_screen.dart';

class LoginController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _verificationId;

  sendOTP(String phoneNumber, BuildContext context) async {
    try {
      await _auth
          .verifyPhoneNumber(
        phoneNumber: "+91$phoneNumber",
        codeSent: (verificationId, forceResendingToken) {
          _verificationId = verificationId;
        },
        verificationCompleted: (phoneAuthCredential) {},
        verificationFailed: (error) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Error Verification Failed")));
        },
        codeAutoRetrievalTimeout: (verificationId) {
          _verificationId = verificationId;
        },
      )
          .then((value) {
        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => OtpScreen(
              phNum: phoneNumber,
            ),
          ),
        );
      });
    } on Error {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Error! Please try again later")));
    }
  }

  verifyOTP(String otp, BuildContext context) {
    try{
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!, smsCode: otp);

    signInWithPhone(credential, context);
    }
     on Error {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Error! Please try again later")));
    }
  }

  void signInWithPhone(
      PhoneAuthCredential credential, BuildContext context) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        CustomerRegistrationModel.checkRegisteredUser(
            phoneController.text, context);
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Error Verification Failed")));
    } on Error {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Error! Please try again later")));
    }
  }

  void logOut(BuildContext context) async {
    try {
      await _auth.signOut();
    } on Error {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Error! Please try again later")));
    }
  }

  @override
  void onClose() {
    phoneController.dispose();
    otpController.dispose();
    super.onClose();
  }
}
