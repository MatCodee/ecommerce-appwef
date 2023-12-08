import 'package:ecommerce_app/service/api/api_client.dart';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:ecommerce_app/utils/routes_constants.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiclient;
  PopularProductRepo({required this.apiclient});
  Future<Response> getPopularProductList() async {
    return await apiclient.getData(RoutesConstants.productDetail);
  }
  
}