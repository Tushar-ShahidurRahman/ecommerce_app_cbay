import 'package:ecommerce_app_cbay/data/model/product_by_category_model.dart';
import 'package:ecommerce_app_cbay/data/services/network_caller.dart';
import 'package:get/get.dart';

import '../../data/utils/urls.dart';

class ProductByRemarkController extends GetxController {
  bool _getPopularProductByRemarkInProgress = false;
  bool _getNewProductByRemarkInProgress = false;
  bool _getSpecialProductByRemarkInProgress = false;

  bool get getPopularProductByRemarkInProgress =>
      _getPopularProductByRemarkInProgress;
  bool get getNewProductByRemarkInProgress =>
      _getNewProductByRemarkInProgress;
  bool get getSpecialProductByRemarkInProgress =>
      _getSpecialProductByRemarkInProgress;

  ProductByCategoryModel _popularProduct = ProductByCategoryModel();
  ProductByCategoryModel _newProduct = ProductByCategoryModel();
  ProductByCategoryModel _specialProduct = ProductByCategoryModel();

  ProductByCategoryModel get popularProduct => _popularProduct;
  ProductByCategoryModel get newProduct => _newProduct;
  ProductByCategoryModel get specialProduct => _specialProduct;

  // Get popular product from the api and saves it in popular product model.
  Future<bool> getPopularProduct() async {
    _getPopularProductByRemarkInProgress = true;
    update();
    final popularProductResponseInCtlr =
        await NetworkCaller.getRequest(url: Urls.popularProductByRemarksUrl);
    _getPopularProductByRemarkInProgress = false;

    if (popularProductResponseInCtlr.isSuccess) {
      _popularProduct =
          ProductByCategoryModel.fromJson(popularProductResponseInCtlr.bodyData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
  // Get new product from the api and saves it in new product model.
  Future<bool> getNewProduct() async {
    _getNewProductByRemarkInProgress = true;
    update();
    final newProductResponseInCtlr =
        await NetworkCaller.getRequest(url: Urls.newProductByRemarksUrl);
    _getNewProductByRemarkInProgress = false;

    if (newProductResponseInCtlr.isSuccess) {
      _newProduct =
          ProductByCategoryModel.fromJson(newProductResponseInCtlr.bodyData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  // Get Special product from calling api and saves in Special product model.
  Future<bool> getSpecialProduct() async {
    _getSpecialProductByRemarkInProgress = true;
    update();
    final specialProductResponseInCtlr =
        await NetworkCaller.getRequest(url: Urls.specialProductByRemarksUrl);
    _getSpecialProductByRemarkInProgress = false;

    if (specialProductResponseInCtlr.isSuccess) {
      _specialProduct =
          ProductByCategoryModel.fromJson(specialProductResponseInCtlr.bodyData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
