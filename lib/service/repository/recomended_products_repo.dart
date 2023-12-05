import 'package:ecommerce_app/service/api/api_client.dart';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:get/get.dart';

class RecomendedProductRepo extends GetxService {
  final ApiClient apiclient;
  RecomendedProductRepo({required this.apiclient});
  Future<Response> getPopularProductList() async {
    return await apiclient.getData(AppContants.RECOMENDED_PRODUCT_URI);
  }
  
}