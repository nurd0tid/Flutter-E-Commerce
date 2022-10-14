import 'package:flutter/material.dart';
import 'package:taxnow_beta/controller/cart_controller.dart';
import 'package:taxnow_beta/controller/popular_product_controller.dart';
import 'package:taxnow_beta/pages/cart/cart_page.dart';
import 'package:taxnow_beta/pages/food/popular_food_detail.dart';
import 'package:taxnow_beta/pages/food/recommended_food_detail.dart';
import 'package:taxnow_beta/pages/home/food_page_body.dart';
import 'package:taxnow_beta/pages/home/main_food_page.dart';
import 'package:get/get.dart';
import 'package:taxnow_beta/pages/splash/splash_page.dart';
import 'package:taxnow_beta/routes/routes_helper.dart';
import 'controller/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Taxnow Beta',
          // home: SplashScreen(),
          initialRoute: RouteHelper.getSplashPage(),
          getPages: RouteHelper.routes,
        );
      });
    });
  }
}
