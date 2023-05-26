import 'package:ecommerce_app_cbay/data/model/product_by_category_model.dart';
import 'package:ecommerce_app_cbay/data/services/network_caller.dart';
import 'package:get/get.dart';

import '../../data/model/product_by_category_model.dart';
import '../../data/utils/urls.dart';

class ProductController extends GetxController {
  bool _getProductByCategoryInProgress = false;
  ProductByCategoryModel _productByCategory = ProductByCategoryModel();

  bool get getProductByCategoryInProgress => _getProductByCategoryInProgress;

  ProductByCategoryModel get productByCategory => _productByCategory;

  Future<bool> getProductByCategory(int id) async {
    _getProductByCategoryInProgress = true;
    final prodByCatResponseInCtlr =
        await NetworkCaller.getRequest(url: Urls.productByCategoryUrl(id));
    _getProductByCategoryInProgress = false;

    if (prodByCatResponseInCtlr.isSuccess) {
      _productByCategory =
          ProductByCategoryModel.fromJson(prodByCatResponseInCtlr.bodyData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
