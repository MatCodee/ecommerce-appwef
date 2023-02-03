import 'package:ecommerce_app/utils/dinemsion_page.dart';
import 'package:flutter/material.dart';



class IconAndTextWidget extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final Color? iconColor; 

  IconAndTextWidget({super.key,required this.icon,required this.iconColor,required this.text});


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: iconColor,size: Dimension.iconSize24,),
        const SizedBox(width: 5,),
        Text(text!),
      ],
    );
  }
}