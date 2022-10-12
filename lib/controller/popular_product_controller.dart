import 'package:get/get.dart';
import 'package:taxnow_beta/data/repository/popular_product_repo.dart';

import '../models/products_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularPorductList = [];
  List<dynamic> get popularProductList => _popularPorductList;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      print("got products");
      _popularPorductList = [];
      _popularPorductList.addAll(Product.fromJson(response.body).products);
      print(_popularPorductList);
      update();
    } else {}
  }
}
