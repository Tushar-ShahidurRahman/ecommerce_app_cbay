import 'package:ecommerce_app_cbay/ui_presentation_layer/custom_widgets/category_card_widget.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/custom_widgets/product_card_widget.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/screens/home_screen.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/ui_state_manager/bottom_navigation_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Wish List'),
          leading:
              IconButton(icon: const Icon(Icons.arrow_back), onPressed: () {
                Get.find<BottomNavigationBarController>().goToHomePage();
              }),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: .70,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return const ProductCardWidget();
            },
          ),
        ));
  }
}
