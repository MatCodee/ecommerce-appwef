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

  Future<Response> login(String email,String password) async {
    var form = {
      "email": email,
      "password": password
    };
    return await apiclient.postData(AppContants.LOGIN_URL, form );
  }


  Future<void> saveUserNumberAndPassword(String number, String password) async {
    try {
      await sharedPreferences.setString(AppContants.PHONE, number);
      await sharedPreferences.setString(AppContants.PASSWORD, password);
    } catch (e) {
      throw e;
    }
  }


  Future<String> getUserToken() async {
    return await sharedPreferences.getString(AppContants.TOKEN) ?? "None";
  }


  saveUserToken(String token) async {
    apiclient.token = token;
    apiclient.updateHeader(token);
    return await sharedPreferences.setString(AppContants.TOKEN, token);
  }
}