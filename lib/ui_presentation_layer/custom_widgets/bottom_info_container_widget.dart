import 'package:ecommerce_app_cbay/ui_presentation_layer/ui_state_manager/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../utils/app_color.dart';
import '../utils/styles.dart';
import 'common_elevated_button.dart';

class BottomInfoContainerWidget extends StatelessWidget {
  final String text;
  final String priceNumber;
  final String buttonTitleText;
  final VoidCallback onTap;

  const BottomInfoContainerWidget({
    super.key,
    required this.text,
    required this.priceNumber,
    required this.onTap,
    required this.buttonTitleText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 90,
      decoration: BoxDecoration(
          color: primaryColor.withOpacity(.15),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
          )),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  text,
                  style: screenTitleTextStyle.copyWith(
                      color: greyColor, fontSize: 16),
                ),
                // if(price?.isNotEmpty) {
                Text(
                  priceNumber,
                  style: screenTitleTextStyle.copyWith(
                    color: primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // }
              ],
            ),
            SizedBox(
                width: 140,
                child:
                GetBuilder<CartController>(
                  builder: (cartController) {
                    if(cartController.addToCartInProgress) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return CommonElevatedButton(title: buttonTitleText, onTap: onTap);
                  }
                ))
          ],
        ),
      ),
    );
  }
}
