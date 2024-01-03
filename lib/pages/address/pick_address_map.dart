import 'dart:async';
import 'package:ecommerce_app/controllers/location_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickAddressPage extends StatefulWidget {
  final bool fromSignup;
  final bool fromAdress;
  final GoogleMapController? googleMapController;

  PickAddressPage(
      {required this.fromSignup,
      required this.fromAdress,
      this.googleMapController,
      super.key});

  @override
  State<PickAddressPage> createState() => _PickAddressPageState();
}

class _PickAddressPageState extends State<PickAddressPage> {
  LocationController locationController = Get.find<LocationController>();
  final LatLng _initialPosition = const LatLng(45.51563, -122.677433);
  final CameraPosition _cameraPosition =
      const CameraPosition(target: LatLng(45.51563, -122.677433), zoom: 17);
  late GoogleMapController _mapController;
  LatLng sourceLocation = LatLng(
      Get.find<LocationController>().currentPosition.latitude,
      Get.find<LocationController>().currentPosition.longitude);

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(builder: (locationController) {
      return Scaffold(
        body: SafeArea(
          child: Center(
            child: SizedBox(
              width: double.maxFinite,
              child: Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition:
                        CameraPosition(target: sourceLocation, zoom: 17.5),
                    mapType: MapType.terrain,
                    onMapCreated: ((GoogleMapController controller) {
                      _controller.complete(controller);
                    }),
                  ),
                  Center(
                      child: !locationController.loading
                          ? Image.asset('assets/location.png',
                              height: 50, width: 50)
                          : const CircularProgressIndicator()),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: const Text('Guardar Ubicacion!'),
          icon: const Icon(Icons.directions_boat),
        ),
      );
    });
  }
}
