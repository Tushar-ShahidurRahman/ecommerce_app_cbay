import 'package:flutter/material.dart';

import 'ui_presentation_layer/screens/splash_screen.dart';

void main() {
  runApp(const CraftyBay());
}

class CraftyBay extends StatelessWidget {
  const CraftyBay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'An ecommerce app',
      home: SplashScreen(),
    );
  }
}
