import 'package:ecommerce_app_cbay/ui_presentation_layer/ui_state_manager/bottom_navigation_bar_controller.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/ui_state_manager/user_auth_controller.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/ui_state_manager/user_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ui_presentation_layer/screens/splash_screen.dart';
import 'ui_presentation_layer/ui_state_manager/auth_controller.dart';
import 'ui_presentation_layer/utils/app_color.dart';

void main() {
  runApp(const CraftyBay());
}

class CraftyBay extends StatelessWidget {
  const CraftyBay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GetXBinding(),
      debugShowCheckedModeBanner: false,
      title: 'An ecommerce app',
      home: const SplashScreen(),
      themeMode: ThemeMode.light,
      // Todo: Add theme toggle function between light and dark mode.
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            textStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              letterSpacing: 0.6,
            ),
          ),
        ),
        // textTheme: TextTheme
      ),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          shadowColor: Colors.grey,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
          iconTheme: IconThemeData(color: Colors.black, size: 18),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            textStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              letterSpacing: 0.6,
            ),
          ),
        ),
      ),
    );
  }
}

class GetXBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavigationBarController());
    Get.put(UserAuthController());
    Get.put(AuthController());
    Get.put(UserProfileController());
  }
}
