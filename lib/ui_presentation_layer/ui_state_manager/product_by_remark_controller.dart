import 'package:ecommerce_app_cbay/data/model/product_by_remark_model.dart';
import 'package:ecommerce_app_cbay/data/services/network_caller.dart';
import 'package:get/get.dart';

import '../../data/utils/urls.dart';

class ProductByRemarkController extends GetxController {
  bool _getPopularProductByRemarkInProgress = false;

  ProductByRemarkModel _popularProduct = ProductByRemarkModel();

  ProductByRemarkModel get popularProduct => _popularProduct;

  bool get getPopularProductByRemarkInProgress =>
      _getPopularProductByRemarkInProgress;

  Future<bool> getPopularProduct() async {
    _getPopularProductByRemarkInProgress = true;
    update();
    final popularProductResponseInCtlr =
        await NetworkCaller.getRequest(url: Urls.popularProductByRemarksUrl);
    _getPopularProductByRemarkInProgress = false;

    if (popularProductResponseInCtlr.isSuccess) {
      _popularProduct =
          ProductByRemarkModel.fromJson(popularProductResponseInCtlr.bodyData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
