import 'package:ecommerce_app/base/show_custom_message.dart';
import 'package:ecommerce_app/controllers/auth_controlller.dart';
import 'package:ecommerce_app/pages/auth/sign_up_page.dart';
import 'package:ecommerce_app/pages/home/main_food_page.dart';
import 'package:ecommerce_app/routes/routers_helpers.dart';
import 'package:ecommerce_app/utils/color_custom.dart';
import 'package:ecommerce_app/utils/dinemsion_page.dart';
import 'package:ecommerce_app/widgets/big_text.dart';
import 'package:ecommerce_app/widgets/input_field.dart';
import 'package:ecommerce_app/widgets/small_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';


class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<AuthController>(builder: (authController) {
          return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: Dimension.screenHeight * 0.1),
            Container(
              height: 100,
              width: 100,
              margin: EdgeInsets.only(
                  bottom: Dimension.height20, top: Dimension.height20),
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://cdn.logojoy.com/wp-content/uploads/20220329171712/dating-app-logo-tinder.png"),
              ),
            ),
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(left: Dimension.font20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: "Hello",
                    size: 100,
                    color: Colors.black54,
                  ),
                  SmallText(
                      text: "Sign in yout account",
                      size: Dimension.font26,
                      color: Colors.black54),
                ],
              ),
            ),
            SizedBox(
              height: Dimension.height20,
            ),
            InputFieldText(
                textController: usernameController,
                hintText: "Email",
                icon: Icons.email),
            SizedBox(
              height: Dimension.height20,
            ),
            InputFieldText(
                textController: passwordController,
                hintText: "Password",
                icon: Icons.password_sharp),
            SizedBox(
              height: Dimension.height20,
            ),
            GestureDetector(
              onTap: () {
                _login(authController);
              },
              child: Container(
                width: Dimension.screenWidth / 2,
                height: Dimension.screenHeight / 13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.radius30),
                  color: AppColors.mainColor,
                ),
                child: Center(
                    child: BigText(
                  text: "Sign Up",
                  size: Dimension.font26,
                  color: Colors.white,
                )),
              ),
            ),
            SizedBox(
              height: Dimension.height30,
            ),
            RichText(
                text: TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.to(() => SignUpPage()),
                    text: "Dont have an account?",
                    style: TextStyle(
                        color: Colors.grey[500], fontSize: Dimension.font20))),
          ],
        ),
      );
        })
    );
  }

  void _login(AuthController authController) {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    if (username.isEmpty) {
      showCustomSnackBar("Type your email", title: "Email Address");
    }  else if (password.isEmpty) {
      showCustomSnackBar("Type your password", title: "Password");
    } else if (password.length < 6) {
      showCustomSnackBar("Password can not be less than six characters",
          title: "Password");
    } else {
      showCustomSnackBar("Perfect",isError: false, title: "Perfect");

      authController.login(username, password).then((status) {
        if (status.isSuccess) {
          print("Success Login");
          //Get.toNamed(RouterHelper.getInitial());
          //Get.to(MainFoodPage());
          Get.toNamed(RouterHelper.home);
        } else {
          showCustomSnackBar(status.message);
        }
      });
    }
  }
}
