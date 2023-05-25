import 'package:ecommerce_app_cbay/ui_presentation_layer/custom_widgets/product_card_widget.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        // child: GridView.builder(
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 3,
        //     childAspectRatio: .73,
        //   ),
        //   itemCount: 30,
        //   itemBuilder: (context, index) {
        //     return const ProductCardWidget();
        //   },
        // ),
      ),
    );
  }
}
