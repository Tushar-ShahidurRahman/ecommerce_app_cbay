// Created this class for encapsulating network call related functionalities.
import 'dart:convert';
import 'dart:developer';

import 'package:ecommerce_app_cbay/ui_presentation_layer/ui_state_manager/auth_controller.dart';
import 'package:http/http.dart';

import '../model/response_model.dart';
import '../utils/urls.dart';

class NetworkCaller {
  //Singleton architecture.
  NetworkCaller._();

  static Future<ResponseModel> getRequest({required String url}) async {
    try {
      final Response response = await get(Uri.parse(url), headers: {
        'Content-type' : 'application/json',
        'Accept': 'application/json',
        'token': AuthController.token.toString(),
      });
      log(AuthController.token ?? 'token is null in Auth controller');
      log(response.body);
      if (response.statusCode == 200) {
        return ResponseModel(
          statusCode: response.statusCode,
          isSuccess: true,
          bodyData: jsonDecode(response.body),
        );
      } else {
        return ResponseModel(
          statusCode: response.statusCode,
          isSuccess: false,
          bodyData: jsonDecode(response.body),
        );
      }
    } catch (e) {
      log(e.toString());
      return ResponseModel(
          statusCode: -1, isSuccess: false, bodyData: e.toString());
    }
  }
}
