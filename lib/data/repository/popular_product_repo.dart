import 'package:get/get.dart';
import 'package:taxnow_beta/data/api/api_client.dart';
import 'package:taxnow_beta/utils/app_constants.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstants.DRINKS_URI);
  }
}
