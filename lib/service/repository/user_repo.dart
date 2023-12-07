

import 'package:ecommerce_app/service/api/api_client.dart';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:get/get.dart';

class UserRepo {
  final ApiClient apiClient;
  UserRepo({required this.apiClient});


  Future<Response> getUserInfo() async {
    return await apiClient.getData(AppContants.USER_INFO_URL);
  }
}