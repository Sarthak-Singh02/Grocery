import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_stop_grocery/Customer/Customer%20Profile/controller/profile_controller.dart';

import '../../../General/Widgets/widgets.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});
  final controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext ctx) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: GetBuilder<ProfileController>(builder: (context) {
          return ListView(
            children: [
              const SizedBox(
                height: 60,
              ),
              const FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "   Profile Edit   ",
                  style: TextStyle(
                    fontSize: 50,
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
                child:
                    Widgets.textFormField("State", controller.stateController),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 30),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                      ),
                      child: const Text(
                        "Save",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () async {
                        controller.updateData(ctx);
                      }))
            ],
          );
        }),
      ),
    );
  }
}
