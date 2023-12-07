import 'package:ecommerce_app/controllers/auth_controlller.dart';
import 'package:ecommerce_app/controllers/location_controller.dart';
import 'package:ecommerce_app/utils/color_custom.dart';
import 'package:ecommerce_app/utils/dinemsion_page.dart';
import 'package:ecommerce_app/widgets/big_text.dart';
import 'package:ecommerce_app/widgets/input_field.dart';
import 'package:ecommerce_app/widgets/primaryButton.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController _addressscontroller = TextEditingController();
  final TextEditingController _contactPersonName = TextEditingController();
  final TextEditingController _contactPersonNumber = TextEditingController();
  late bool _isLogged;
  CameraPosition _cameraPosition =
      CameraPosition(target: LatLng(45.51563, -122.677433), zoom: 17);
  LatLng _initialPosition = LatLng(45.51563, -122.677433);

  @override
  void initState() {
    super.initState();
    /*
      // Establecemos el init state del map
      _isLogged = Get.find<AuthController>().useLoggedIn();
      if(_isLogged && Get.find<UserController>().userModel == null) {
        Get.find<UserController>().getUserInfo();
      }
      if(Get.find<LocationController>().addressList.isNotEmpty) {
        _cameraPosition = CameraPosition(target: LatLng(
          double.parse(Get.find<LocationController>().getAddress['latitude']);
          double.parse(Get.find<LocationController>().getAddress['longitude']);
        ));

        _initialPosition = LatLng(
          double.parse(Get.find<LocationController>().getAddress['latitude']);
          double.parse(Get.find<LocationController>().getAddress['longitude']);
        );
      }
    */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Address Page"),
          backgroundColor: AppColors.mainColor,
        ),
        body: GetBuilder<LocationController>(builder: (locationController) {
          _addressscontroller.text =
              '${locationController.placemark.name ?? ""}'
              '${locationController.placemark.locality ?? ""}'
              '${locationController.placemark.postalCode} ?? "'
              '${locationController.placemark.country} ?? "';

          _contactPersonName.text = "Matias";
          _contactPersonNumber.text = "9 88834854";

          print("address en my views is: " + _addressscontroller.text);
          return Column(
            children: [
              Container(
                height: 140,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.radius15),
                  border: Border.all(
                      width: 2, color: Theme.of(context).primaryColor),
                ),
                child: Stack(
                  children: [
                    GoogleMap(
                        initialCameraPosition:
                            CameraPosition(target: _initialPosition, zoom: 17),
                        zoomControlsEnabled: false,
                        compassEnabled: false,
                        indoorViewEnabled: true,
                        mapToolbarEnabled: false,
                        onCameraIdle: () {
                          locationController.updatePosition(
                              _cameraPosition, true);
                        },
                        onCameraMove: ((position) =>
                            _cameraPosition = position),
                        onMapCreated: (GoogleMapController controller) {
                          locationController.setMapController(controller);
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: Dimension.height20,
              ),
              BigText(text: "Delivery Address"),
              SizedBox(
                height: Dimension.height20,
              ),

              // Widget Text Field
              InputFieldText(
                  textController: _addressscontroller,
                  hintText: "Your address",
                  icon: Icons.map),
              SizedBox(
                height: Dimension.height20,
              ),
              InputFieldText(
                  textController: _contactPersonName,
                  hintText: "Your address",
                  icon: Icons.person),
              SizedBox(
                height: Dimension.height20,
              ),

              InputFieldText(
                  textController: _contactPersonNumber,
                  hintText: "Your address",
                  icon: Icons.phone),
              SizedBox(
                height: Dimension.height20,
              ),
            ],
          );
        }),
        bottomNavigationBar: GetBuilder<LocationController>(
          builder: (locationController) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      left: Dimension.width20 * 2.5,
                      right: Dimension.width20 * 2.5,
                      top: Dimension.height10,
                      bottom: Dimension.height30),
                  child:
                      PrimaryButton(press: saveAddress, title: "Save Address"),
                ),
              ],
            );
          },
        ));
  }

  void saveAddress() {
    print("Saved");
  }
}
