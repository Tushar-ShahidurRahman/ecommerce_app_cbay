import 'package:ecommerce_app_cbay/data/model/category_model.dart';
import 'package:ecommerce_app_cbay/data/services/network_caller.dart';
import 'package:ecommerce_app_cbay/data/utils/urls.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  bool _categoryDataInProgress = false;
  CategoryModel _categoryModel = CategoryModel();

  bool get categoryDataInProgress => _categoryDataInProgress;

  CategoryModel get categoryModel => _categoryModel;

  Future<bool> getCategoryData() async {
    _categoryDataInProgress = true;
    update();
    final categoryResponseInCtlr =
        await NetworkCaller.getRequest(url: Urls.categoryListUrl);
    _categoryDataInProgress = false;
    if (categoryResponseInCtlr.isSuccess) {
      _categoryModel = CategoryModel.fromJson(categoryResponseInCtlr.bodyData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
