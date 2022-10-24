import 'package:get/get.dart';
import 'package:taxnow_beta/base/show_custom_snackbar.dart';
import 'package:taxnow_beta/routes/routes_helper.dart';

class ApiChecker {
  static void checkApi(Response response) {
    if (response.statusCode == 401) {
      Get.offNamed(RouteHelper.getSignIn());
    } else {
      showCustomSnackBar(response.statusText!);
    }
  }
}
