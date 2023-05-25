import 'package:ecommerce_app_cbay/ui_presentation_layer/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/productData.dart';
import '../ui_state_manager/bottom_navigation_bar_controller.dart';
import '../utils/app_color.dart';

class ProductCardWidget extends StatelessWidget {
   const ProductCardWidget({
    super.key, required this.product,
  });
  final ProductData product;

  @override
  Widget build(BuildContext context) {
    // maybe go to product detail page from here. Lets see...
    return SizedBox(
      width: 130,
      child: InkWell(
        onTap: () {
          Get.to(const ProductDetailsScreen());
          // Tried to show it from the
          // Get.find<BottomNavigationBarController>().changePageWhenTapped(4);

        },
        borderRadius: BorderRadius.circular(12),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          shadowColor: primaryColor.withOpacity(.3),
          child: Column(
            children: [
              Image.network(
                product.image ?? '',
                // "assets/images/demo_shoe.png",
                height: 100,
                width: 132,
                fit: BoxFit.scaleDown,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      // "Running shoe 345A",
                      product.title ?? '',
                      style: TextStyle(
                        color: greyColor.withOpacity(.9),
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // SizedBox(height:.2 ),
                         Text(
                          '\$${product.price ?? ''}',
                          style: const TextStyle(
                            color: primaryColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.6,
                            height: 1.2,
                          ),
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.amber,
                            ),
                            Text(
                              '${product.star ?? 0}',
                              style: TextStyle(
                                color: greyColor.withOpacity(.9),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(4)),
                          child: const Icon(
                            Icons.favorite_border,
                            size: 16,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
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
