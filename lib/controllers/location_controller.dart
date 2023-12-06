import 'package:ecommerce_app/models/address_model.dart';
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


}