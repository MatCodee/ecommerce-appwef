import 'package:ecommerce_app/utils/dinemsion_page.dart';
import 'package:ecommerce_app/widgets/app_icon.dart';
import 'package:ecommerce_app/widgets/big_text.dart';
import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  AppIcon appIcon;
  BigText bigText;
  
  AccountWidget({super.key, required this.appIcon, required this.bigText});


  @override 
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Dimension.width20, 
        top: Dimension.width10, 
        bottom: Dimension.width10
      ),
      child: Row(
        children: [
          appIcon,
          SizedBox(width: Dimension.width20,),
          bigText
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.grey.withOpacity(0.1),
            offset: Offset(0, 1),
          ),
        ],
      ),
    );
  }
}