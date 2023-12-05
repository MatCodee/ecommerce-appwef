import 'package:ecommerce_app/controllers/popular_product_controller.dart';
import 'package:ecommerce_app/controllers/recomended_product_controller.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/pages/account/account_page.dart';
import 'package:ecommerce_app/pages/auth/sign_in_page.dart';
import 'package:ecommerce_app/pages/auth/sign_up_page.dart';
import 'package:ecommerce_app/pages/cart/cart_page.dart';
import 'package:ecommerce_app/pages/detail/popular_food_detail.dart';
import 'package:ecommerce_app/pages/home/main_food_page.dart';
import 'package:ecommerce_app/routes/routers_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helpers/dependences.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // No entiendo esta informacion
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecomendedProductController>().getRecomendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:  SignUpPage(),
      initialRoute: RouterHelper.initial,
      getPages:   RouterHelper.routes,
    );
  }
}