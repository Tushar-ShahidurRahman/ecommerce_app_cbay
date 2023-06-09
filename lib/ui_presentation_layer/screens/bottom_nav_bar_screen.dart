import 'package:ecommerce_app_cbay/ui_presentation_layer/screens/cart_screen.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/screens/categories_screen.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/screens/home_screen.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/screens/wish_list_screen.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/ui_state_manager/bottom_navigation_bar_controller.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/ui_state_manager/category_controller.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/ui_state_manager/home_controller.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/ui_state_manager/product_by_remark_controller.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {

  @override
  void initState() {
    super.initState();
    Get.find<HomeController>().getHomeSlider();
    Get.find<CategoryController>().getCategoryData();
    Get.find<ProductByRemarkController>().getPopularProduct();
    Get.find<ProductByRemarkController>().getNewProduct();
    Get.find<ProductByRemarkController>().getSpecialProduct();
  }

  BottomNavigationBarController bottomNavBarController = Get.find<BottomNavigationBarController>();

  final List<Widget> _screens = [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    WishListScreen(),
    // It doesn't match with the item list length. That's why shows a problem
    // ProductDetailsScreen(),
    // ReviewScreen(),
  ];
  // int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BottomNavigationBarController>(
        builder: (controller) {
          return _screens[bottomNavBarController.selectedIndex];
        }
      ),
      bottomNavigationBar: GetBuilder<BottomNavigationBarController>(
        builder: (controller) {
          return BottomNavigationBar(
            onTap: (value) {
              bottomNavBarController.changePageWhenTapped(value);
                // setState(() {});
              // if (mounted) {
              //   setState(() {});
              // }
            },
            currentIndex: bottomNavBarController.selectedIndex,
            selectedItemColor: primaryColor,
            unselectedItemColor: softGreyColor,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.grid_view_outlined), label: 'Categories'),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
              BottomNavigationBarItem(icon: Icon(Icons.wallet_giftcard_sharp), label: 'Wish'),
            ],
          );
        }
      ),
    );
  }
}
