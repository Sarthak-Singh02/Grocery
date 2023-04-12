import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_stop_grocery/General/LoginScreen/controller/login_controller.dart';
import 'package:one_stop_grocery/General/LoginScreen/view/login_screen.dart';
import 'package:one_stop_grocery/HomeScreen/controller/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.put(HomeScreenController());
  final controller1 = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Groceteria"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "Welcome ${controller.box.read('name')}!!",
                  style: const TextStyle(fontSize: 25),
                ),
              ),
            ),
          ),
          GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Card(
                    color: CupertinoColors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 5.0,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {},
                      child: GridTile(
                        child: Image.asset(
                          controller.assetImage[index],
                          scale: 4,
                        ),
                        footer: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                controller.itemName[index],
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                    ));
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.shopping_cart,
        ),
        backgroundColor: Colors.indigo,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.history),
              title: Text(
                "Order History",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.person),
              title: Text(
                "Profile",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ),
            ListTile(
              onTap: () {
                controller1.logOut(context);
                controller.box.erase();
                Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => LoginScreen(),
                  ),
                );
              },
              leading: Icon(Icons.logout),
              title: Text(
                "Sign Out",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
