import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxnow_beta/utils/colors.dart';
import 'package:taxnow_beta/utils/dimension.dart';
import 'package:taxnow_beta/widgets/app_text_field.dart';
import 'package:taxnow_beta/widgets/big_text.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Logo
          SizedBox(
            height: Dimensions.screenHeight * 0.05,
          ),
          Container(
            height: Dimensions.screenHeight * 0.25,
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 80,
                backgroundImage: AssetImage(
                  "assets/image/logo part 1.png",
                ),
              ),
            ),
          ),
          // Email
          AppTextField(
            textController: emailController,
            hintText: "Email",
            icon: Icons.email,
          ),
          // Password
          SizedBox(
            height: Dimensions.height20,
          ),
          AppTextField(
            textController: passwordController,
            hintText: "Password",
            icon: Icons.password_sharp,
          ),
          // Your Name
          SizedBox(
            height: Dimensions.height20,
          ),
          AppTextField(
            textController: nameController,
            hintText: "Name",
            icon: Icons.person,
          ),
          // Your Phone
          SizedBox(
            height: Dimensions.height20,
          ),
          AppTextField(
            textController: phoneController,
            hintText: "Phone",
            icon: Icons.phone,
          ),
          SizedBox(
            height: Dimensions.height20 + Dimensions.height20,
          ),
          Container(
            width: Dimensions.screenWidth / 2,
            height: Dimensions.screenHeight / 13,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: AppColors.mainColor,
            ),
            child: Center(
              child: BigText(
                text: "Sign up",
                size: Dimensions.font20 + Dimensions.font20 / 2,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          RichText(
            text: TextSpan(
                recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                text: "Have an account already?",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: Dimensions.font20,
                )),
          ),
        ],
      ),
    );
  }
}
