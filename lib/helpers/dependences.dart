

import 'package:ecommerce_app/controllers/cart_controller.dart';
import 'package:ecommerce_app/controllers/popular_product_controller.dart';
import 'package:ecommerce_app/controllers/recomended_product_controller.dart';
import 'package:ecommerce_app/service/api/api_client.dart';
import 'package:ecommerce_app/service/repository/popular_products_repo.dart';
import 'package:ecommerce_app/service/repository/recomended_products_repo.dart';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:get/get.dart';

// Ver que esta ocurriendo con esta funcion
Future<void> init() async {
  Get.lazyPut(() => ApiClient(appBaseUrl: AppContants.BASE_URL));
  
  // Repos
  Get.lazyPut(() => PopularProductRepo(apiclient: Get.find()));
  Get.lazyPut(() => RecomendedProductRepo(apiclient: Get.find()));

  // controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecomendedProductController(recomendedProductRepo: Get.find()));

}