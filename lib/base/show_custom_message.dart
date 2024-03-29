import 'package:ecommerce_app/utils/color_custom.dart';
import 'package:ecommerce_app/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackBar(String message, {bool isError = true ,String title="Error"}) {
  Get.snackbar(title, message,
    titleText: BigText(
      text: title, 
      color: Colors.white,
    ),
    messageText: Text(message,style: const TextStyle(
        color: Colors.white,
      ),
    ),
    colorText: Colors.white,
    backgroundColor: isError ? Colors.redAccent : AppColors.mainColor,
  );
}