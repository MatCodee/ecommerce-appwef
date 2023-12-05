
import 'package:ecommerce_app/utils/color_custom.dart';
import 'package:ecommerce_app/utils/dinemsion_page.dart';
import 'package:ecommerce_app/widgets/input_field.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {

    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();


    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            // input
            InputFieldText(textController: emailController, hintText: "Email", icon: Icons.email),
            SizedBox(height: Dimension.height20,),
            InputFieldText(textController: passwordController, hintText: "Password", icon: Icons.password_sharp),
            SizedBox(height: Dimension.height20,),
            InputFieldText(textController: nameController, hintText: "Name", icon: Icons.person),
            SizedBox(height: Dimension.height20,),
            InputFieldText(textController: phoneController, hintText: "Phone", icon: Icons.phone),

          ],
        ),
      ),
    );
  }
}