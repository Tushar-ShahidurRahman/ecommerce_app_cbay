import 'package:ecommerce_app_cbay/ui_presentation_layer/custom_widgets/product_card_widget.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/ui_state_manager/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  final int categoryId;

  const ProductListScreen({Key? key, required this.categoryId})
      : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<ProductController>().getProductByCategoryId(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<ProductController>(builder: (productController) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: .73,
            ),
            itemCount:
                productController.productByCategory.products?.length ?? 0,
            itemBuilder: (context, index) {
              final item = productController.productByCategory.products![index];
              return ProductCardWidget(
                product: item,
              );
            },
          );
        }),
      ),
    );
  }
}
