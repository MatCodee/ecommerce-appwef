import 'package:ecommerce_app/utils/dinemsion_page.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;
  final bool transparent;
  final EdgeInsets? margin;
  double? height;
  double width;
  final double? fontSize;
  final double radius;
  final IconData? icon;

  CustomButton({
    this.onPressed,
    required this.buttonText,
    this.transparent=false,
    this.margin,
    this.height=50,
    this.width=280,
    this.fontSize,
    this.radius=5,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle _flatButton = TextButton.styleFrom(
      backgroundColor: onPressed == null ? Theme.of(context).disabledColor : transparent ? Colors.transparent : Theme.of(context).primaryColor,
      minimumSize: Size(
        width = Dimension.screenWidth, 
        height = height!,
      ),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius)
      )
    );
    return Center(
      child: SizedBox(
        width: width ?? Dimension.screenWidth,
        height: height ?? 50,
        child: TextButton(
          onPressed: onPressed, 
          style: _flatButton,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null ? Padding(padding: EdgeInsets.only(right: Dimension.width10/2),child: Icon(icon, color: transparent ? Theme.of(context).primaryColor: Theme.of(context).cardColor )) : const SizedBox(),
              Text(
                buttonText, style: TextStyle(fontSize: fontSize != null ? fontSize: Dimension.font16,
                color: transparent ? Theme.of(context).primaryColor : Theme.of(context).cardColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}