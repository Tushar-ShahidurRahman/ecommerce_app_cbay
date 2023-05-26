import 'package:ecommerce_app_cbay/ui_presentation_layer/custom_widgets/category_card_widget.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/ui_state_manager/bottom_navigation_bar_controller.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/ui_state_manager/category_controller.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/ui_state_manager/product_by_remark_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/category_model.dart';
import '../ui_state_manager/product_controller.dart';

class CategoriesScreen extends StatelessWidget {
   CategoriesScreen({
    Key? key,
    // required this.categoryModel,
  }) : super(key: key);

  // @override
  BottomNavigationBarController bottomNavigationBarController =
      Get.find<BottomNavigationBarController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Categories',
        ),
        leading: IconButton(
          onPressed: () {
            bottomNavigationBarController.goToHomePage();
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<CategoryController>(builder: (categoryController) {
          if (categoryController.categoryDataInProgress) {
            return const Center(child: CircularProgressIndicator());
          }
          return RefreshIndicator(
            onRefresh: () async {
              Get.find<CategoryController>().getCategoryData();
            },
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemCount: categoryController.categoryModel.category?.length ?? 0,
                itemBuilder: (context, index) {
                  final category =
                      categoryController.categoryModel.category![index];
                  return CategoryCardWidget(
                    name: category.categoryName.toString(),
                    imgUrl: category.categoryImg.toString(),
                    categoryId: category.id ?? 0,
                    // (categoryModel.category?.categoryName ?? ''),
                  );
                }),
          );
        }),
      ),
    );
  }
}
