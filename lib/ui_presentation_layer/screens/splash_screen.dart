import 'package:ecommerce_app_cbay/ui_presentation_layer/screens/bottom_nav_bar_screen.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/screens/email_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_color.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) =>
        // Navigator.push(context,  MaterialPageRoute(
        //   builder: (context) => HomeScreen(),
        // )),
    Get.off(() => const BottomNavBarScreen())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          // child: Icon(Icons.shopping_bag_outlined, size: 150),
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.asset('assets/images/logo.png'),
            ),
          Column(
              children: const [
                CircularProgressIndicator(
                  color: primaryColor,
                ),
                // SizedBox(height: 25),
                Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    'Version 1.0',
                    style: TextStyle(color: greyColor, fontSize: 17,
                    letterSpacing: 0.5),
                  ),
                ),
              ],
            )
          ]),
    );
  }
}
