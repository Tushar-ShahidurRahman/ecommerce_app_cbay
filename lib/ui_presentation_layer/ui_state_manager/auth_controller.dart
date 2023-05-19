import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  String? token;

  Future<bool> isLoggedIn() async {
    await getToken();
    // The next line will return true,
    return token != null;
    // it is substitute of-
    // if(token == null) {
    //   return false;
    // } else {
    //   return true;
    // }
  }

  Future<void> saveToken(String userToken) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    token = userToken;
    await preference.setString('cbay_token', userToken);
  }

  Future<void> getToken() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    token = preference.getString('cbay_token');
  }

  Future<void> clearData() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    await preference.clear();
  }
}
