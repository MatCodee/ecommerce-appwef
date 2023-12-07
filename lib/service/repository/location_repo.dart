import 'package:ecommerce_app/models/address_model.dart';
import 'package:ecommerce_app/service/api/api_client.dart';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  LocationRepo({required this.apiClient, required this.sharedPreferences});


  Future<Response> getAddressfromGeocode(LatLng latLng) async {
    return await apiClient.getData('${AppContants.GEOCODE_URL}'
      '?lat=${latLng.latitude}&lng=${latLng.longitude}'
    );
  }
  
  String getUserAddress() {
    return sharedPreferences.getString(AppContants.USER_ADDRESS) ?? "";
  }
  Future<Response> addAddress(AddressModel addressModel) async {
    return await apiClient.postData(AppContants.ADD_USER_ADDRESS_URL, addressModel.toJson());
  }

}