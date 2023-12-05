import 'package:ecommerce_app/models/auth_model.dart';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecommerce_app/service/api/api_client.dart';

class AuthRepo {
  final ApiClient apiclient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiclient,required this.sharedPreferences});
  
  Future<Response> registration(SignUpBody signUpBody) async {
    return await apiclient.postData(AppContants.REGISTRATION_URL, signUpBody.toJson());
  }

  saveUserToken(String token) async {
    apiclient.token = token;
    apiclient.updateHeader(token);
    return await sharedPreferences.setString(AppContants.TOKEN, token);
  }
}