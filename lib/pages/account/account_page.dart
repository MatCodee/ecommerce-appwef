import 'package:ecommerce_app/utils/color_custom.dart';
import 'package:ecommerce_app/utils/dinemsion_page.dart';
import 'package:ecommerce_app/widgets/account_widget.dart';
import 'package:ecommerce_app/widgets/app_icon.dart';
import 'package:ecommerce_app/widgets/big_text.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
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
                  bigText: BigText(text: "Matias")),
              SizedBox(height: Dimension.height20),
              AccountWidget(
                  appIcon: const AppIcon(
                    icon: Icons.phone,
                    backgroundColor: AppColors.yellowColor,
                    iconColor: Colors.white,
                  ),
                  bigText: BigText(text: "9 88834854")),
              SizedBox(height: Dimension.height20),
              AccountWidget(
                  appIcon: const AppIcon(
                    icon: Icons.email,
                    backgroundColor: AppColors.yellowColor,
                    iconColor: Colors.white,
                  ),
                  bigText: BigText(text: "matias.altamiranove@gmail.com")),
              SizedBox(height: Dimension.height20),
              AccountWidget(
                  appIcon: const AppIcon(
                    icon: Icons.location_city,
                    backgroundColor: AppColors.yellowColor,
                    iconColor: Colors.white,
                  ),
                  bigText: BigText(text: "Santiago Steel")),
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
      ),
    );
  }
}
