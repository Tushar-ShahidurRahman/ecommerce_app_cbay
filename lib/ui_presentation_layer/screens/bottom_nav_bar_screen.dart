import 'package:ecommerce_app_cbay/ui_presentation_layer/screens/cart_screen.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/screens/categories_screen.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/screens/home_screen.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/screens/wish_list_screen.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/utils/app_color.dart';
import 'package:flutter/material.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {

  final List<Widget> _screens = [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    WishListScreen(),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          _selectedIndex = value;
            // setState(() {});
          if (mounted) {
            setState(() {});
          }
        },
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: softGreyColor,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view_outlined), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.wallet_giftcard_sharp), label: 'Wish'),
        ],
      ),
    );
  }
}
