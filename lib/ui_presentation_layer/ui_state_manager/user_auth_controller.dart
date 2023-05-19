import 'dart:developer';

import 'package:ecommerce_app_cbay/data/services/network_caller.dart';
import 'package:ecommerce_app_cbay/data/utils/urls.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class UserAuthController extends GetxController {
  bool _emailVerificationInProgress = false;
  bool _otpVerificationInProgress = false;

  bool get emailVerificationInProgress => _emailVerificationInProgress;

  bool get otpVerificationInProgress => _otpVerificationInProgress;

  Future<bool> emailVerification(String email) async {
    _emailVerificationInProgress = true;
  update();
    final response =
        await NetworkCaller.getRequest(url: Urls.userLoginUrl(email));
    _emailVerificationInProgress = false;
    if (response.isSuccess) {
      update();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> otpVerification(String email, String otp) async {
    _otpVerificationInProgress = true;
    update();
    final response =
        await NetworkCaller.getRequest(url: Urls.verifyOTPUrl(email, otp));
    _otpVerificationInProgress = false;
    if (response.isSuccess) {
      log(response.bodyData['data']);
      await Get.find<AuthController>().saveToken(response.bodyData['data']);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
