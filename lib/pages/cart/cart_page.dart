import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxnow_beta/base/common_text_button.dart';
import 'package:taxnow_beta/base/no_data_page.dart';
import 'package:taxnow_beta/base/show_custom_snackbar.dart';
import 'package:taxnow_beta/controller/auth_controller.dart';
import 'package:taxnow_beta/controller/cart_controller.dart';
import 'package:taxnow_beta/controller/location_controller.dart';
import 'package:taxnow_beta/controller/order_controller.dart';
import 'package:taxnow_beta/controller/popular_product_controller.dart';
import 'package:taxnow_beta/controller/user_controller.dart';
import 'package:taxnow_beta/models/place_order_model.dart';
import 'package:taxnow_beta/pages/home/main_food_page.dart';
import 'package:taxnow_beta/routes/routes_helper.dart';
import 'package:taxnow_beta/utils/colors.dart';
import 'package:taxnow_beta/utils/dimension.dart';
import 'package:taxnow_beta/widgets/app_icon.dart';
import 'package:taxnow_beta/widgets/big_text.dart';
import 'package:taxnow_beta/pages/payment/payment_options_button.dart';
import 'package:taxnow_beta/widgets/small_text.dart';

import '../../controller/recommended_product_controller.dart';
import '../../utils/app_constants.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Icon
          Positioned(
            top: Dimensions.height20 * 3,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
                SizedBox(
                  width: Dimensions.width20 * 5,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            ),
          ),
          // Card ItemList
          GetBuilder<CartController>(builder: (_cartController) {
            return _cartController.getItems.length > 0
                ? Positioned(
                    top: Dimensions.height20 * 5,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: 0,
                    child: Container(
                      margin: EdgeInsets.only(
                        top: Dimensions.height15,
                      ),
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: false,
                        child: GetBuilder<CartController>(
                            builder: (cartController) {
                          var _cartList = cartController.getItems;
                          return ListView.builder(
                            itemCount: _cartList.length,
                            itemBuilder: (_, index) {
                              return Container(
                                width: double.maxFinite,
                                height: Dimensions.height20 * 5,
                                child: Row(
                                  children: [
                                    // Image Container
                                    GestureDetector(
                                      onTap: () {
                                        var popularIndex =
                                            Get.find<PopularProductController>()
                                                .popularProductList
                                                .indexOf(
                                                    _cartList[index].product!);
                                        if (popularIndex >= 0) {
                                          Get.toNamed(
                                              RouteHelper.getPopularFood(
                                                  popularIndex, "cartpage"));
                                        } else {
                                          var recommendedIndex = Get.find<
                                                  RecommendedProductController>()
                                              .recommendedProductList
                                              .indexOf(
                                                  _cartList[index].product!);
                                          if (recommendedIndex < 0) {
                                            Get.snackbar(
                                              "History product",
                                              "Product review is not available for history products!",
                                              backgroundColor:
                                                  AppColors.mainColor,
                                              colorText: Colors.white,
                                            );
                                          } else {
                                            Get.toNamed(
                                                RouteHelper.getRecommendedFood(
                                                    recommendedIndex,
                                                    "cartpage"));
                                          }
                                        }
                                      },
                                      child: Container(
                                        width: Dimensions.height20 * 5,
                                        height: Dimensions.height20 * 5,
                                        margin: EdgeInsets.only(
                                            bottom: Dimensions.height10),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                AppConstants.BASE_URL +
                                                    AppConstants.UPLOAD_URL +
                                                    cartController
                                                        .getItems[index].img!),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radius20),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    // Text Image
                                    SizedBox(
                                      width: Dimensions.width10,
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: Dimensions.height20 * 5,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            BigText(
                                              text: cartController
                                                  .getItems[index].name!,
                                              color: Colors.black54,
                                            ),
                                            SmallText(text: "Spicy"),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                BigText(
                                                  text: "\$ " +
                                                      cartController
                                                          .getItems[index]
                                                          .price!
                                                          .toString(),
                                                  color: Colors.redAccent,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                    top: Dimensions.height10,
                                                    bottom: Dimensions.height10,
                                                    left: Dimensions.width10,
                                                    right: Dimensions.width10,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Dimensions
                                                                .radius20),
                                                    color: Colors.white,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          cartController
                                                              .addItem(
                                                                  _cartList[
                                                                          index]
                                                                      .product!,
                                                                  -1);
                                                        },
                                                        child: Icon(
                                                            Icons.remove,
                                                            color: AppColors
                                                                .signColor),
                                                      ),
                                                      SizedBox(
                                                          width: Dimensions
                                                                  .width10 /
                                                              2),
                                                      BigText(
                                                          text: _cartList[index]
                                                              .quantity
                                                              .toString()),
                                                      SizedBox(
                                                          width: Dimensions
                                                                  .width10 /
                                                              2),
                                                      GestureDetector(
                                                        onTap: () {
                                                          cartController
                                                              .addItem(
                                                                  _cartList[
                                                                          index]
                                                                      .product!,
                                                                  1);
                                                        },
                                                        child: Icon(Icons.add,
                                                            color: AppColors
                                                                .signColor),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }),
                      ),
                    ),
                  )
                : NoDataPage(text: "Your cart is empty!");
          })
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (cartController) {
          return Container(
            height: Dimensions.bottomHeightBar + 50,
            padding: EdgeInsets.only(
              top: Dimensions.height10,
              bottom: Dimensions.height10,
              left: Dimensions.width20,
              right: Dimensions.width20,
            ),
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 * 2),
                topRight: Radius.circular(Dimensions.radius20 * 2),
              ),
            ),
            child: cartController.getItems.length > 0
                ? Column(
                    children: [
                      InkWell(
                        onTap: () => showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (_) {
                            return Column(
                              children: [
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.9,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                              Dimensions.radius20),
                                          topRight: Radius.circular(
                                              Dimensions.radius20),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 520,
                                            padding: EdgeInsets.only(
                                              left: Dimensions.width20,
                                              right: Dimensions.width20,
                                              top: Dimensions.height20,
                                            ),
                                            child: Column(
                                              children: [
                                                const PaymentOptionButton(
                                                  icon: Icons.money,
                                                  title: 'Cash on Delivery',
                                                  subTitle:
                                                      'You pay after getting the delivery',
                                                  index: 0,
                                                ),
                                                SizedBox(
                                                  height: Dimensions.height10,
                                                ),
                                                const PaymentOptionButton(
                                                  icon: Icons.paypal_outlined,
                                                  title: 'Digital Payment',
                                                  subTitle:
                                                      'Safer and faster way of payment',
                                                  index: 1,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                        child: SizedBox(
                          width: double.maxFinite,
                          child: CommonTextButton(text: "Payment Options"),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              top: Dimensions.height20,
                              bottom: Dimensions.height20,
                              left: Dimensions.width20,
                              right: Dimensions.width20,
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: Dimensions.width10 / 2),
                                BigText(
                                    text: "\$ " +
                                        cartController.totalAmount.toString()),
                                SizedBox(width: Dimensions.width10 / 2),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (Get.find<AuthController>().userLoggedIn()) {
                                if (Get.find<LocationController>()
                                    .addressList
                                    .isEmpty) {
                                  Get.toNamed(RouteHelper.getAddress());
                                } else {
                                  var location = Get.find<LocationController>()
                                      .getUserAddress();
                                  var cart =
                                      Get.find<CartController>().getItems;
                                  var user =
                                      Get.find<UserController>().userModel;
                                  PlaceOrderBody placeOrder = PlaceOrderBody(
                                    cart: cart,
                                    orderAmount: 100.0,
                                    orderNote: "Not about the food",
                                    address: location.address,
                                    latitude: location.latitude,
                                    longitude: location.longitude,
                                    contactPersonNumber: user!.phone,
                                    contactPersonName: user!.name,
                                    scheduleAt: '',
                                    distance: 10.0,
                                  );
                                  Get.find<OrderController>()
                                      .placeOrder(placeOrder, _callback);
                                }
                              } else {
                                Get.toNamed(RouteHelper.getSignIn());
                              }
                            },
                            child: CommonTextButton(text: "Check Out"),
                          ),
                        ],
                      )
                    ],
                  )
                : Container(),
          );
        },
      ),
    );
  }

  void _callback(bool isSuccess, String message, String orderID) {
    if (isSuccess) {
      Get.find<CartController>().clear();
      Get.find<CartController>().removeCartSharedPreference();
      Get.find<CartController>().addToHistory();
      Get.offNamed(RouteHelper.getPayment(
          orderID, Get.find<UserController>().userModel!.id));
    } else {
      showCustomSnackBar(message);
    }
  }
}
