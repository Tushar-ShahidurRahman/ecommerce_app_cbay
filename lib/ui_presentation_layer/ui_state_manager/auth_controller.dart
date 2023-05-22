import 'dart:convert';

import 'package:ecommerce_app_cbay/data/model/profile_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  static String? _token;
  static ProfileData? _profileData;

  static String? get token => _token;
  static ProfileData? get userProfile => _profileData;

  Future<bool> isLoggedIn() async {
    await getToken();
    await getProfileDataFromStorage();
    // The next line will return true,
    return _token != null;
    // it is substitute of-
    // if(token == null) {
    //   return false;
    // } else {
    //   return true;
    // }
  }

  Future<void> saveToken(String userToken) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    _token = userToken;
    await preference.setString('cbay_token', userToken);
  }

  Future<void> saveProfileDataInStorage(ProfileData userProfile) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    _profileData = userProfile;
    await preference.setString('user_profile', userProfile.toJson().toString());
  }

  Future<void> getToken() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    _token = preference.getString('cbay_token');
  }

  Future<void> getProfileDataFromStorage() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    _profileData = ProfileData.fromJson(
        jsonDecode(preference.getString('user_profile') ?? '{}'));
  }

  Future<void> clearData() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    await preference.clear();
  }
}
