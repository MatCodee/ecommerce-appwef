import 'package:ecommerce_app/controllers/auth_controlller.dart';
import 'package:ecommerce_app/controllers/cart_controller.dart';
import 'package:ecommerce_app/controllers/location_controller.dart';
import 'package:ecommerce_app/controllers/popular_product_controller.dart';
import 'package:ecommerce_app/controllers/recomended_product_controller.dart';
import 'package:ecommerce_app/controllers/user_controller.dart';
import 'package:ecommerce_app/service/api/api_client.dart';
import 'package:ecommerce_app/service/repository/auth_repo.dart';
import 'package:ecommerce_app/service/repository/location_repo.dart';
import 'package:ecommerce_app/service/repository/popular_products_repo.dart';
import 'package:ecommerce_app/service/repository/recomended_products_repo.dart';
import 'package:ecommerce_app/service/repository/user_repo.dart';
import 'package:ecommerce_app/utils/routes_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Ver que esta ocurriendo con esta funcion
Future<void> init() async {
  await Get.putAsync(() async => await SharedPreferences.getInstance(),
          permanent: true); // SharedPreferences

  Get.lazyPut(() => ApiClient(appBaseUrl: RoutesConstants.baseUrl));


  // Repos
  Get.lazyPut(() => AuthRepo(apiclient: Get.find(), sharedPreferences: Get.find<SharedPreferences>()));
  Get.lazyPut(() => PopularProductRepo(apiclient: Get.find()));
  Get.lazyPut(() => RecomendedProductRepo(apiclient: Get.find()));
  Get.lazyPut(() => LocationRepo(apiClient: Get.find(), sharedPreferences: Get.find<SharedPreferences>()));
  Get.lazyPut(() => UserRepo(apiClient: Get.find()));
  // controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecomendedProductController(recomendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController());
  Get.lazyPut(() => LocationController(locationRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
}