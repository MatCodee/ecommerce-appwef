import 'package:ecommerce_app/base/show_custom_message.dart';
import 'package:ecommerce_app/controllers/auth_controlller.dart';
import 'package:ecommerce_app/models/auth_model.dart';
import 'package:ecommerce_app/utils/color_custom.dart';
import 'package:ecommerce_app/utils/dinemsion_page.dart';
import 'package:ecommerce_app/widgets/big_text.dart';
import 'package:ecommerce_app/widgets/input_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {


    var iconImages = ["google.png", "twitter.png"];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: Dimension.screenHeight * 0.1,
            ),
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
            // input
            InputFieldText(
                textController: emailController,
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
            InputFieldText(
                textController: nameController,
                hintText: "Name",
                icon: Icons.person),
            SizedBox(
              height: Dimension.height20,
            ),
            InputFieldText(
                textController: phoneController,
                hintText: "Phone",
                icon: Icons.phone),
            SizedBox(
              height: Dimension.height30,
            ),
            GestureDetector(
              onTap: () {
                print("Registration");
                _registration();
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
              height: Dimension.height10, 
            ),
            RichText(
                text: TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.back(),
                    text: "Have an account already?",
                    style: TextStyle(
                        color: Colors.grey[500], fontSize: Dimension.font20))),
            SizedBox(
              height: Dimension.height30,
            ),
            RichText(
                text: TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.back(),
                    text: "Sign up using one of the following methods",
                    style: TextStyle(
                        color: Colors.grey[500], fontSize: Dimension.font16))),
            Wrap(
              children: List.generate(
                  2,
                  (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: Dimension.radius30,
                          backgroundImage:
                              AssetImage("assets/icons/" + iconImages[index]),
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }


  void _registration() {
    var authController = Get.find<AuthController>();
    String name = nameController.text.trim();
    String phone = phoneController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if(name.isEmpty) {
      showCustomSnackBar("Type your name",title: "Name");
    } else if (phone.isEmpty) {
      showCustomSnackBar("Type your phone number",title: "Phone Number");
    } else if (email.isEmpty) {
      showCustomSnackBar("Type your email",title: "Email Address");

    } else if (GetUtils.isEmail(email)) {
      showCustomSnackBar("Type in a valid email address",title: "Valid Email Address");

    } else if (password.isEmpty) {
      showCustomSnackBar("Type your password",title: "Password");

    } else if (password.length < 6) {
      showCustomSnackBar("Password can not be less than six characters",title: "Password");
    } else {
      showCustomSnackBar("Perfect",title: "Perfect");
      SignUpBody signUpBody = SignUpBody(name: name, phone: phone, email: email, password: password);
      print(signUpBody);

      authController.registration(signUpBody).then((status) {
        if (status.isSuccess) {
          print("Success Registration");
        } else {
          showCustomSnackBar(status.message);
        }
      });

    }
  }
}
