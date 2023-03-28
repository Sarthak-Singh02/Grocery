import 'package:flutter/material.dart';
import 'package:one_stop_grocery/Screens/Customer/CustomerHomePage.dart';

class CustomerDetailsScreen extends StatelessWidget {
  const CustomerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Details"),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Name",
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
                hintText: "Address",
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
                hintText: "State/City",
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
                hintText: "Pincode",
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
                      builder: (BuildContext context) => CustomerHomePage(),
                    ),
                  );
                },
                child: Text("Next"))
          ],
        ),
      )),
    );
  }
}
