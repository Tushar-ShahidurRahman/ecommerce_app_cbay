import 'dart:developer';

import 'package:ecommerce_app_cbay/data/services/network_caller.dart';
import 'package:ecommerce_app_cbay/data/utils/urls.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/ui_state_manager/auth_controller.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  bool _wishListProductsInProgress = false;

  bool get wishListProductsInProgress => _wishListProductsInProgress;

  Future<bool> createWishList(int productId) async {
    _wishListProductsInProgress = true;
    update();
    final wishListResponseInCtlr =
        await NetworkCaller.getRequest(url: Urls.createWishListUrl(productId));
    _wishListProductsInProgress = false;
    if (wishListResponseInCtlr.isSuccess) {
      update();
      return true;
    } else {
      if(wishListResponseInCtlr.statusCode == 401) {
        Get.find<AuthController>().logOut();
      }
      // log(AuthController.token!);
      update();
      return false;
    }
  }
}
