import 'package:get/get.dart';
import 'package:taxnow_beta/data/repository/popular_product_repo.dart';

class PopularProductController extends GetxService {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularPorductList = [];
}
