import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ui_presentation_layer/screens/splash_screen.dart';
import 'ui_presentation_layer/utils/app_color.dart';

void main() {
  runApp(const CraftyBay());
}

class CraftyBay extends StatelessWidget {
  const CraftyBay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
