import 'package:ecommerce_app/controllers/location_controller.dart';
import 'package:ecommerce_app/controllers/user_controller.dart';
import 'package:ecommerce_app/pages/address/add_address_page.dart';
import 'package:ecommerce_app/utils/color_custom.dart';
import 'package:ecommerce_app/utils/dinemsion_page.dart';
import 'package:ecommerce_app/widgets/account_widget.dart';
import 'package:ecommerce_app/widgets/app_icon.dart';
import 'package:ecommerce_app/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
      Get.find<LocationController>().determinePosition();


    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: const Text("Profile"),
        ),
        body: GetBuilder<UserController>(
          builder: ((userController) {
            return userController.isLoading ? SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                margin: EdgeInsets.only(top: Dimension.height20),
                width: double.maxFinite,
                child: Column(
                  children: [
                    const AppIcon(
                      icon: Icons.person,
                      backgroundColor: AppColors.mainColor,
                      iconColor: Colors.white,
                      size: 150,
                      iconSize: 70,
                    ),
                    SizedBox(height: Dimension.height20),
                    AccountWidget(
                        appIcon: const AppIcon(
                          icon: Icons.person,
                          backgroundColor: AppColors.mainColor,
                          iconColor: Colors.white,
                        ),
                        bigText: BigText(text: userController.userModel.name)),
                    SizedBox(height: Dimension.height20),
                    AccountWidget(
                        appIcon: const AppIcon(
                          icon: Icons.phone,
                          backgroundColor: AppColors.yellowColor,
                          iconColor: Colors.white,
                        ),
                        bigText: BigText(text: userController.userModel.phone)),
                    SizedBox(height: Dimension.height20),
                    AccountWidget(
                        appIcon: const AppIcon(
                          icon: Icons.email,
                          backgroundColor: AppColors.yellowColor,
                          iconColor: Colors.white,
                        ),
                        bigText:
                            BigText(text: userController.userModel.email)),
                    SizedBox(height: Dimension.height20),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => AddressPage());
                      },
                      child: AccountWidget(
                          appIcon: const AppIcon(
                            icon: Icons.location_city,
                            backgroundColor: AppColors.yellowColor,
                            iconColor: Colors.white,
                          ),
                          bigText: BigText(text: userController.userModel.address)),
                    ),
                    SizedBox(height: Dimension.height20),
                    AccountWidget(
                        appIcon: const AppIcon(
                          icon: Icons.message_outlined,
                          backgroundColor: Colors.red,
                          iconColor: Colors.white,
                        ),
                        bigText: BigText(text: "None")),
                  ],
                ),
              ),
            ): Container();
          }),
        ));
  }
}
