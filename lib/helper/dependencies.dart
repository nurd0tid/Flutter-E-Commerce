import 'package:get/get.dart';
import 'package:taxnow_beta/controller/popular_product_controller.dart';
import 'package:taxnow_beta/data/api/api_client.dart';
import 'package:taxnow_beta/data/repository/popular_product_repo.dart';

import '../utils/app_constants.dart';

Future<void> init() async {
  // Api Client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
  // Repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  // Controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
