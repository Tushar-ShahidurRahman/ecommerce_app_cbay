import 'package:ecommerce_app_cbay/data/model/slider_model.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/screens/categories_screen.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/screens/email_verification_screen.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/ui_state_manager/auth_controller.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/ui_state_manager/bottom_navigation_bar_controller.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/ui_state_manager/category_controller.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/ui_state_manager/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../custom_widgets/home/appbar_circular_icon_button_widget.dart';
import '../custom_widgets/home/home_carousel_widget.dart';
import '../custom_widgets/category_card_widget.dart';
import '../custom_widgets/home/remarks_title_widget.dart';
import '../custom_widgets/home/search_text_field.dart';
import '../custom_widgets/product_card_widget.dart';
import 'user_profile_screen.dart';

// I didn't change this HomeScreen class to Stateful widget.
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/images/logo_nav.png'),
            const Spacer(),
            AppBarCircularIconButtonWidget(
              iconData: Icons.person_outline,
              onTap: () {
                Get.find<AuthController>().isLoggedIn().then((value) {
                  if (value) {
                    // Todo: Need to create a ProfileScreen for user datails.
                    Get.to(() => const UserProfileScreen());
                  } else {
                    Get.to(const EmailVerificationScreen());
                  }
                });
              },
            ),
            AppBarCircularIconButtonWidget(
                iconData: Icons.call_outlined, onTap: () {}),
            AppBarCircularIconButtonWidget(
                iconData: Icons.add_alarm_outlined, onTap: () {}),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TextField(),
              const SearchTextField(),
              const SizedBox(
                height: 8,
              ),
              GetBuilder<HomeController>(builder: (homeController) {
                if (homeController.sliderInProgress) {
                  return const SizedBox(
                      height: 180,
                      child: Center(child: CircularProgressIndicator()));
                }
                return HomeCarouselWidget(
                    sliderModel: homeController.sliderModel);
              }),
              RemarksTitleWidget(
                remarksName: 'Categories',
                // when clicked here, user will be sent to categories screen.
                onTapSeeAll: () {
                  Get.find<BottomNavigationBarController>()
                      .changePageWhenTapped(1);
                },
              ),
              GetBuilder<CategoryController>(builder: (categoryController) {
                if (categoryController.categoryDataInProgress) {
                  return const SizedBox(
                    height: 90,
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: categoryController.categoryModel.category!
                          .map((category) {
                        return CategoryCardWidget(
                          name: category.categoryName.toString(),
                          imgUrl: category.categoryImg.toString(),
                        );
                      }).toList(),
                    ),
                  );
                }
              }),
              const SizedBox(height: 16),
              RemarksTitleWidget(
                remarksName: 'Popular',
                onTapSeeAll: () {},
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    ProductCardWidget(),
                    ProductCardWidget(),
                    ProductCardWidget(),
                    ProductCardWidget(),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              RemarksTitleWidget(
                remarksName: 'Special',
                onTapSeeAll: () {},
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    ProductCardWidget(),
                    ProductCardWidget(),
                    ProductCardWidget(),
                    ProductCardWidget(),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              RemarksTitleWidget(
                remarksName: 'New',
                onTapSeeAll: () {},
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    ProductCardWidget(),
                    ProductCardWidget(),
                    ProductCardWidget(),
                    ProductCardWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
