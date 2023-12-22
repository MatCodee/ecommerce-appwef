import 'package:ecommerce_app/controllers/popular_product_controller.dart';
import 'package:ecommerce_app/controllers/recomended_product_controller.dart';
import 'package:ecommerce_app/routes/routers_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helpers/dependences.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
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
      initialRoute: RouterHelper.getInitial(),
      getPages: RouterHelper.routes,
    );
  }
}