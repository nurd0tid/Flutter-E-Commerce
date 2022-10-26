import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:taxnow_beta/controller/order_controller.dart';
import 'package:taxnow_beta/utils/dimension.dart';
import 'package:taxnow_beta/utils/styles.dart';

class PaymentOptionButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  final int index;
  const PaymentOptionButton({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (orderController) {
      return InkWell(
        onTap: () => orderController.setPaymentIndex(index),
        child: Container(
          padding: EdgeInsets.only(
            bottom: Dimensions.height10 / 2,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20 / 4),
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[200]!,
                  blurRadius: 5,
                  spreadRadius: 1,
                )
              ]),
          child: ListTile(
            leading: Icon(
              icon,
              size: 40,
              color: Theme.of(context).disabledColor,
            ),
            title: Text(
              title,
              style: robotoMedium.copyWith(
                fontSize: Dimensions.font20,
              ),
            ),
            subtitle: Text(
              subTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: robotoRegular.copyWith(
                color: Theme.of(context).disabledColor,
                fontSize: Dimensions.font16,
              ),
            ),
            trailing: Icon(
              Icons.check_circle,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      );
    });
  }
}
