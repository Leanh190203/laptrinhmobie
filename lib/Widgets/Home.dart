import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../Widgets/ItemWidget.dart';
import '../controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF4C53A5),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Đăng nhập'),
              onTap: () {
                Navigator.pushNamed(context, "login");
              },
            ),
            ListTile(
              leading: Icon(Icons.app_registration),
              title: Text('Đăng ký'),
              onTap: () {
                Navigator.pushNamed(context, "register");
              },
            ),
            ListTile(
              leading: Icon(Icons.mail_outline),
              title: Text('Liên hệ'),
              onTap: () {
                Navigator.pushNamed(context, "contact");
              },
            ),
          ],
        ),
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (productController.errorMessage.isNotEmpty) {
          print(productController.errorMessage);
          return Center(child: Text('Error: ${productController.errorMessage}'));
        } else if (productController.products.isEmpty) {
          return Center(child: Text('No products found'));
        } else {
          return ListView(
            children: [
              Container(
                padding: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  color: Color(0xFFEDECF2),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  children: [
                    // Thanh tìm kiếm
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Tìm kiếm...",
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.search,
                              size: 27,
                              color: Color(0xFF4C53A5),
                            ),
                            onPressed: () {},
                          ),
                          Icon(
                            Icons.camera_alt,
                            size: 27,
                            color: Color(0xFF4C53A5),
                          ),
                        ],
                      ),
                    ),
                    // Categories
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      child: Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C53A5),
                        ),
                      ),
                    ),
                    // Items
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      child: Text(
                        "Outstanding Cat",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C53A5),
                        ),
                      ),
                    ),
                    // Items Widget
                    ItemWidget(items: productController.products),
                  ],
                ),
              ),
            ],
          );
        }
      }),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        onTap: (index) {},
        height: 70,
        color: Color(0xFF4C53A5),
        items: [
          Icon(
            CupertinoIcons.back,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.list,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
