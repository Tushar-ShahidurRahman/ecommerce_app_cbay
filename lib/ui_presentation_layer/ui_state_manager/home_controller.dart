import 'package:ecommerce_app_cbay/data/model/slider_model.dart';
import 'package:ecommerce_app_cbay/data/services/network_caller.dart';
import 'package:ecommerce_app_cbay/data/utils/urls.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  bool _sliderInProgress = false;
  bool get sliderInProgress => _sliderInProgress;

  SliderModel _sliderModel = SliderModel();
  SliderModel get sliderModel => _sliderModel;

  Future<bool> getHomeSlider() async {
    _sliderInProgress = true;
    update();
    final sliderResponseInCtlr = await NetworkCaller.getRequest(url: Urls.productListSliderUrl);
    _sliderInProgress = false;

    if(sliderResponseInCtlr.isSuccess) {
      _sliderModel = SliderModel.fromJson(sliderResponseInCtlr.bodyData);
      update();
      return true;
    }
    else{
      update();
      return false;
    }
  }
}