import 'package:flutter/material.dart';
import 'package:one_stop_grocery/Screens/Customer/CustomerDetailsScreen.dart';

class CustomerLogin extends StatelessWidget {
  const CustomerLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer"),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Phone Number",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "OTP",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          CustomerDetailsScreen(),
                    ),
                  );
                },
                child: Text("Verify"))
          ],
        ),
      )),
    );
  }
}
