import 'package:ecommerce_app/models/address_model.dart';
import 'package:ecommerce_app/models/response_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';


import 'package:ecommerce_app/service/repository/location_repo.dart';
import 'package:get/get.dart';

class LocationController extends GetxController implements GetxService {
  final LocationRepo locationRepo;

  LocationController({required this.locationRepo});
  bool _loading = false;
    
  // Esta es la posicion del controlador
  late Position _position;
  late Position _pickPosition;

  Placemark _placemark = Placemark();
  Placemark _pickPlacemark = Placemark();


  List<AddressModel> _addressList = [];
  late List<AddressModel> _allAddressList;
  List<String> _addressTypeList = ["home","office","others"];

  int addressTypeIndex = 0;

  
  // get metods:
  Placemark get placemark => _placemark;
  Placemark get pickPlacemark => _pickPlacemark;

  late GoogleMapController _mapController;
  bool _updateAddressData = true;
  bool _changeAddress = true;

  void setMapController(GoogleMapController mapController) {
    _mapController = mapController;
  }

  void updatePosition(CameraPosition position, bool fromAddress) async {
    if(_updateAddressData) {
      _loading = true;
      update();
      try {
        if(fromAddress) {
          _position = Position(
            latitude: position.target.latitude,
            longitude: position.target.longitude,
            timestamp: DateTime.now(),
            heading: 1, 
            accuracy: 1,
            altitude:  1, 
            speedAccuracy: 1, 
            speed: 1,
            altitudeAccuracy: 1,
            headingAccuracy: 1,
          );
        } else {
          _position = Position(
            latitude: position.target.latitude,
            longitude: position.target.longitude,
            timestamp: DateTime.now(),
            heading: 1, 
            accuracy: 1,
            altitude:  1, 
            speedAccuracy: 1, 
            speed: 1,
            altitudeAccuracy: 1,
            headingAccuracy: 1,
          );

          if(_changeAddress) {
            String _address = await getAddressfromGeocode(
              LatLng(position.target.latitude, position.target.longitude)
            );
            fromAddress ? _placemark = Placemark(name: _address):
            _pickPlacemark=Placemark(name: _address);
          }
        }
      } catch (e) {
        print(e);
      }
    }
  }


  Future<String> getAddressfromGeocode(LatLng latLng) async {
    String _address = "Unknown Location Found";
    Response response = await locationRepo.getAddressfromGeocode(latLng);
    if(response.body['status'] == 'ok') {
      _address = response.body['results'][0]['formatted_address'].toString();
      print("printing address " + _address);
    } else {
      print("Error getting the google api");
    }
    return _address;
  }


  // Set Address Tupe index

  Future<ResponseModel> addAddress(AddressModel addressModel) async {
    _loading = true;
    update();
    Response response =  await locationRepo.addAddress(addressModel);
    ResponseModel responseModel;
    if(response.statusCode == 200) {
      String message = response.body("message");
      responseModel = ResponseModel(true, message);
      // saveUserAddress()
    } else {
      print("couldn 't save the  address");
      responseModel = ResponseModel(false, response.statusText!);
    }
    update();
    return responseModel;
  }
}