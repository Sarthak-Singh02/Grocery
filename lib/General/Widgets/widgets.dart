import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Widgets {
  static void showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: const Text(
                "Loading...",
                style: TextStyle(fontSize: 18),
              )),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static Widget textFormField(
    String hint,
    TextEditingController controller,
  ) {
    return TextFormField(
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
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
        ));
  }
}
