import 'package:ecommerce_app/models/auth_model.dart';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:ecommerce_app/utils/routes_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecommerce_app/service/api/api_client.dart';

class AuthRepo {
  final ApiClient apiclient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiclient,required this.sharedPreferences});

  
  //AppContants.REGISTRATION_URL
  Future<Response> registration(SignUpBody signUpBody) async {
    print(signUpBody.toJson());
    return await apiclient.postData(RoutesConstants.authUser, signUpBody.toJson());
  }

  Future<Response> login(String username,String password) async {
    Map<String, dynamic> form = {
      "username": username,
      "password": password
    };
    return await apiclient.postDataAuth(RoutesConstants.authToken, form);
  }

  Future<Response> logout() async {
    return await apiclient.postData(RoutesConstants.logout, null);
  }


  Future<void> saveUserNumberAndPassword(String number, String password) async {
    try {
      await sharedPreferences.setString(AppContants.PHONE, number);
      await sharedPreferences.setString(AppContants.PASSWORD, password);
    } catch (e) {
      throw e;
    }
  }

  Future<Response> isAuthUser() async {
    final userToken = await getUserToken();
    if (userToken.isNotEmpty) {
      //apiclient.updateHeader(userToken);
    }
    Response response = await apiclient.getData(RoutesConstants.isAutenticated);
    return response;
  }

  Future<String> getUserToken() async {
    return await sharedPreferences.getString(AppContants.TOKEN) ?? "None";
  }


  saveUserToken(String token) async {
    //apiclient.token = token;
    apiclient.updateHeader(token);
    return await sharedPreferences.setString(AppContants.TOKEN, token);
  }
}