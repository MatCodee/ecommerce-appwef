import 'package:ecommerce_app/pages/auth/sign_in_page.dart';
import 'package:ecommerce_app/pages/cart/cart_page.dart';
import 'package:ecommerce_app/pages/detail/popular_food_detail.dart';
import 'package:ecommerce_app/pages/home/home_page.dart';
import 'package:ecommerce_app/pages/home/main_food_page.dart';
import 'package:ecommerce_app/pages/payment/paypal_payment_page.dart';
import 'package:get/get.dart';

class RouterHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cardPage = "/cart-page";
  static const String home = "/home-page";

  static String getInitial() => '$initial';
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecommendedFood(int pageId) =>'$recommendedFood?pageId=$pageId';
  static String getCartPage() => '$cardPage';
  static String getHomePage() => '$home';

  static List<GetPage> routes = [
    GetPage(name: "/", page: () => SignInPage()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return PopularFoodDetail(pageId: int.parse(pageId!));
        }),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return PopularFoodDetail(pageId: int.parse(pageId!));
        }),
    GetPage(
        name: cardPage,
        page: () {
          return const CartPage();
        },
        transition: Transition.fadeIn),
    GetPage(name: home, page: () => const HomePage())
  ];
}
