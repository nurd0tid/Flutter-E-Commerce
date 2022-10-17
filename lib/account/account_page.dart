import 'package:flutter/material.dart';
import 'package:taxnow_beta/utils/colors.dart';
import 'package:taxnow_beta/utils/dimension.dart';
import 'package:taxnow_beta/widgets/app_icon.dart';
import 'package:taxnow_beta/widgets/big_text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: "Profile",
          size: 24,
          color: Colors.white,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(
          top: Dimensions.height20,
        ),
        child: Column(
          children: [
            AppIcon(
              icon: Icons.person,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: 75,
              size: Dimensions.height15 * 10,
            ),
          ],
        ),
      ),
    );
  }
}
