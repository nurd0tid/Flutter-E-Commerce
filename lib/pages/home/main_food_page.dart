import 'package:flutter/material.dart';
import 'package:taxnow_beta/pages/home/food_page_body.dart';
import 'package:taxnow_beta/utils/dimension.dart';
import 'package:taxnow_beta/widgets/big_text.dart';
import 'package:taxnow_beta/widgets/small_text.dart';

import '../../utils/colors.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    // print(
    //     "current height is +" + MediaQuery.of(context).size.height.toString());
    return Scaffold(
      body: Column(
        children: [
          // Showing header
          Container(
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "Indonesia", color: AppColors.mainColor),
                      Row(
                        children: [
                          SmallText(text: "Jakarta", color: Colors.black54),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: Dimensions.height45,
                    height: Dimensions.height45,
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: Dimensions.iconSize24,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color: AppColors.mainColor,
                    ),
                  )
                ],
              ),
            ),
          ),
          // Showing Body Content
          // FoodPageBody(),
          Expanded(
              child: SingleChildScrollView(
            child: FoodPageBody(),
          )),
        ],
      ),
    );
  }
}
