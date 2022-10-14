import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxnow_beta/controller/cart_controller.dart';
import 'package:taxnow_beta/controller/popular_product_controller.dart';
import 'package:taxnow_beta/data/api/api_client.dart';
import 'package:taxnow_beta/data/repository/cart_repo.dart';
import 'package:taxnow_beta/data/repository/popular_product_repo.dart';

import '../controller/recommended_product_controller.dart';
import '../data/repository/recommended_product_repo.dart';
import '../utils/app_constants.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);

  // Api Client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  // Repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));

  // Controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
