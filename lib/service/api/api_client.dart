import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  late Map<String,String> _mainHeaders;
  final String appBaseUrl;

  ApiClient({ required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token = "";
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
    };
  }
  void updateHeader(String new_token) {
    token = new_token;
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Token $new_token',
    };
  }

  Future<Response> getData(String url) async {
    try {
      Response response = await get(url,headers: _mainHeaders );
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String url, dynamic body) async {
    try {
      Response response = await post(url, body,headers: _mainHeaders);
      return response;
    } catch (e) {
      print(e.toString());
      return Response(statusCode: 1,statusText: e.toString());
    }
  }
  Future<Response> postDataAuth(String url, dynamic body) async {
    try {
      Response response = await post(url, body);
      return response;
    } catch (e) {
      print(e.toString());
      return Response(statusCode: 1,statusText: e.toString());
    }
  }
}