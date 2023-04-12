import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreenController extends GetxController {
  final box = GetStorage();
  List<String> assetImage = [
    "assets/cereals.png",
    "assets/Dairy.png",
    "assets/desserts.png",
    "assets/drinks.png",
    "assets/fruits.png",
    "assets/meat.png",
  ];
  List<String> itemName = [
    "Cereals and Pulses",
    "Dairy and Eggs",
    "Desserts",
    "Drinks",
    "Fruits",
    "Meat"
  ];
}
