import 'package:ecommerce_app/utils/color_custom.dart';
import 'package:ecommerce_app/utils/dinemsion_page.dart';
import 'package:ecommerce_app/widgets/big_text.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  dynamic press; // function button
  String title;

  PrimaryButton({super.key, required this.press, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: Dimension.screenWidth / 2,
        height: Dimension.screenHeight / 13,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimension.radius30),
          color: AppColors.mainColor,
        ),
        child: Center(
            child: BigText(
          text: title,
          size: Dimension.font26,
          color: Colors.white,
        )),
      ),
    );
  }
}
