import 'package:ecommerce_app_cbay/ui_presentation_layer/custom_widgets/common_elevated_button.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/custom_widgets/product_related_widgets/product_carousel_widget.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/screens/review_screen.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/ui_state_manager/bottom_navigation_bar_controller.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/utils/app_color.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../custom_widgets/bottom_info_container_widget.dart';
import '../custom_widgets/product_stepper_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<Color> colors = const [
    Color(0xFF000000),
    Color(0xFFEE1414),
    Color(0xFFFFF802),
    Color(0xFF02FF31),
    Color(0xFFFFFFFF),
    Color(0xFF028DFF),
  ];

  List<String> sizes = const ['S', 'L', 'XL', 'X', 'XXL'];

  Color _selectedColor = const Color(0xFF000000);
  String _selectedSize = 'L';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        leading: const BackButton(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // product carousel widget here
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductCarouselWidget(),
                  const SizedBox(height: 10),
                  // Text and Buttons rows
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          // mainAxisAlignment: ,
                          children: [
                            //Todo: wrap this column with extend widget
                            Expanded(
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Happy New Year Special Deal Save 30%",
                                    style: screenTitleTextStyle.copyWith(
                                        fontSize: 15),
                                  ),
                                  // This row is for the star, review button and love icon
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      // SizedBox(height:.2 ),
                                      Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            size: 16,
                                            color: Colors.amber,
                                          ),
                                          Text(
                                            '4.6',
                                            style: TextStyle(
                                              color: greyColor.withOpacity(.9),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 13),
                                      TextButton(
                                        onPressed: () {
                                          // Get.find<BottomNavigationBarController>().changePageWhenTapped(5);
                                        },
                                        child: const Text(
                                          'Reviews',
                                          style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.6,
                                            height: 1.2,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            color: primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: const Icon(
                                          Icons.favorite_border,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            // This wrap is for the increment and decrement part
                            const ProductStepperWidget(),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Color',
                          style: screenTitleTextStyle.copyWith(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: colors.map((color) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 4),
                              child: InkWell(
                                onTap: () {
                                  if (_selectedColor != color) {
                                    if (mounted) {
                                      _selectedColor = color;
                                      setState(() {});
                                    }
                                  }
                                },
                                borderRadius: BorderRadius.circular(20),
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: color,
                                  child: Visibility(
                                    visible: _selectedColor == color,
                                    child: Icon(Icons.check,
                                        color: color == const Color(0xFFFFFFFF)
                                            ? Colors.black
                                            : Colors.white),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Size',
                          style: screenTitleTextStyle.copyWith(fontSize: 16),
                        ),
                        Row(
                          children: sizes.map((size) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 4,
                              ),
                              child: InkWell(
                                onTap: () {
                                  if (_selectedSize != size) {
                                    if (mounted) {
                                      _selectedSize = size;
                                      setState(() {});
                                    }
                                  }
                                },
                                borderRadius: BorderRadius.circular(25),
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: Colors.black38,
                                  child: CircleAvatar(
                                    radius: 17,
                                    backgroundColor: _selectedSize == size
                                        ? primaryColor
                                        : Colors.white,
                                    child: Center(
                                      child: Text(
                                        size,
                                        style: TextStyle(
                                            color: _selectedSize == size
                                                ? Colors.white
                                                : greyColor),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Description',
                          style: screenTitleTextStyle.copyWith(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'description will come from the web. Api will provide us the necessary description.',
                          style: subTitleTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w500),
                          maxLines: 5,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomInfoContainerWidget(
            text: 'Price',
            priceNumber: '\$1000,',
            buttonTitleText: 'Add to cart',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

