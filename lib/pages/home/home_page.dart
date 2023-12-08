

import 'package:ecommerce_app/controllers/user_controller.dart';
import 'package:ecommerce_app/pages/account/account_page.dart';
import 'package:ecommerce_app/pages/cart/cart_page.dart';
import 'package:ecommerce_app/pages/home/main_food_page.dart';
import 'package:ecommerce_app/utils/color_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List pages = const [
    MainFoodPage(),
    CartPage(),
    AccountPage(),
  ];

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    Get.find<UserController>().getUserInfo();

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
      selectedItemColor: AppColors.mainColor,
      unselectedItemColor: Colors.amberAccent,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: onTapNav,
      items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "dart"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "me"),
        ],
      ),
    );
  }
}