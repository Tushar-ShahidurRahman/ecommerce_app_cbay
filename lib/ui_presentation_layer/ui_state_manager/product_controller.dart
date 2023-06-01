import 'package:ecommerce_app_cbay/data/model/product_by_category_model.dart';
import 'package:ecommerce_app_cbay/data/model/product_details_model.dart';
import 'package:ecommerce_app_cbay/data/services/network_caller.dart';
import 'package:get/get.dart';

import '../../data/model/product_by_category_model.dart';
import '../../data/utils/urls.dart';

class ProductController extends GetxController {
  bool _getProductByCategoryInProgress = false;
  bool _getProductDetailsByProductIdInProgress = false;

  ProductByCategoryModel _productByCategory = ProductByCategoryModel();
  ProductDetailsModel _productDetailsModel = ProductDetailsModel();

  bool get getProductByCategoryInProgress => _getProductByCategoryInProgress;

  bool get getProductDetailsByProductIdInProgress =>
      _getProductDetailsByProductIdInProgress;

  ProductByCategoryModel get productByCategory => _productByCategory;
  ProductDetailsModel get productDetailsModel => _productDetailsModel;

  // gets product by category id from the web by calling api
  Future<bool> getProductByCategoryId(int categoryId) async {
    _getProductByCategoryInProgress = true;
    final prodByCatResponseInCtlr = await NetworkCaller.getRequest(
        url: Urls.productByCategoryUrl(categoryId));
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

  // gets product by product id from the web by calling api
  Future<bool> getProductDetailsByProductId(int productId) async {
    _getProductDetailsByProductIdInProgress = true;
    final prodDetailsByIdResponseInCtlr = await NetworkCaller.getRequest(
        url: Urls.productDetailsByProductIdUrl(productId));
    _getProductDetailsByProductIdInProgress = false;

    if (prodDetailsByIdResponseInCtlr.isSuccess) {
      _productDetailsModel =
          ProductDetailsModel.fromJson(prodDetailsByIdResponseInCtlr.bodyData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
