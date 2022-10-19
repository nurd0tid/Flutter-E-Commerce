import 'package:get/get.dart';
import 'package:taxnow_beta/pages/address/add_address_page.dart';
import 'package:taxnow_beta/pages/auth/sign_in_page.dart';
import 'package:taxnow_beta/pages/auth/sign_up_page.dart';
import 'package:taxnow_beta/pages/cart/cart_page.dart';
import 'package:taxnow_beta/pages/food/popular_food_detail.dart';
import 'package:taxnow_beta/pages/home/main_food_page.dart';
import 'package:taxnow_beta/pages/splash/splash_page.dart';

import '../pages/food/recommended_food_detail.dart';
import '../pages/home/home_page.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String signIn = "/sign-in";
  static const String signUp = "/sign-up";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";
  static const String addAddress = "/add-address";

  static String getSplashPage() => '$splashPage';
  static String getSignIn() => '$signIn';
  static String getSignUp() => '$signUp';
  static String getInitial() => '$initial';
  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';
  static String getAddress() => '$addAddress';

  static List<GetPage> routes = [
    GetPage(
      name: signIn,
      page: () {
        return SignInPage();
      },
    ),
    GetPage(
      name: signUp,
      page: () {
        return SignUpPage();
      },
      transition: Transition.fade,
    ),
    GetPage(
      name: splashPage,
      page: () {
        return SplashScreen();
      },
    ),
    GetPage(
        name: initial,
        page: () {
          return HomePage();
        },
        transition: Transition.fade),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return PopularFoodDetail(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return RecommendedFoodDetail(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: cartPage,
      page: () {
        return CartPage();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: addAddress,
      page: () {
        return AddAddressPage();
      },
    ),
  ];
}
