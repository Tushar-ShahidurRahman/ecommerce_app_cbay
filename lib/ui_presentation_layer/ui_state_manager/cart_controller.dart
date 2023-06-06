import 'package:ecommerce_app_cbay/data/services/network_caller.dart';
import 'package:ecommerce_app_cbay/data/utils/urls.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/ui_state_manager/auth_controller.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  bool _addToCartInProgress = false;

  bool get addToCartInProgress => _addToCartInProgress;

  // method for adding product to cart api
  Future<bool> addProductToCart(
      int productId, String size, String color) async {
    _addToCartInProgress = true;
    update();
    final responseInCartController =
        await NetworkCaller.postRequest(url: Urls.createCartListUrl, body: {
      "product_id": productId,
      "color": color,
      "size": size,
    });
    _addToCartInProgress = false;
    if (responseInCartController.isSuccess) {
      update();
      return true;
    } else {
      if (responseInCartController.statusCode == 401) {
        Get.find<AuthController>().logOut();
      }
      update();
      return false;
    }
  }
}
