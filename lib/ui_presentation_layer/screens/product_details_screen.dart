import 'package:ecommerce_app_cbay/ui_presentation_layer/custom_widgets/common_elevated_button.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/custom_widgets/product_related_widgets/product_carousel_widget.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/screens/cart_screen.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/screens/review_screen.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/ui_state_manager/auth_controller.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/ui_state_manager/bottom_navigation_bar_controller.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/ui_state_manager/cart_controller.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/ui_state_manager/product_controller.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/ui_state_manager/wish_list_controller.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/utils/app_color.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../custom_widgets/bottom_info_container_widget.dart';
import '../custom_widgets/product_stepper_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;

  const ProductDetailsScreen({Key? key, required this.productId})
      : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<Color> colors = [];

  List<String> sizes = [];

  Color? _selectedColor;
  String? _selectedSize;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductController>()
          .getProductDetailsByProductId(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        leading: const BackButton(),
      ),
      body: GetBuilder<ProductController>(builder: (productController) {
        if (productController.getProductDetailsByProductIdInProgress) {
          return const Center(child: CircularProgressIndicator());
        }
        final productItemDetails =
            productController.productDetailsModel.productDetails!.first;
        final sizes = getSize(productItemDetails.size ?? '');
        final colors = getColor(productItemDetails.color ?? '');
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // product carousel widget here
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProductCarouselWidget(images: [
                      productItemDetails.img1 ?? '',
                      productItemDetails.img2 ?? '',
                      productItemDetails.img3 ?? '',
                      productItemDetails.img4 ?? '',
                    ]),
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
                                      productItemDetails.product?.title ??
                                          'No name given',
                                      // "Happy New Year Special Deal Save 30%",
                                      style: screenTitleTextStyle.copyWith(
                                          fontSize: 15),
                                    ),
                                    // This row is for the star, review button and love icon
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                              "${productItemDetails.product!.star}",
                                              style: TextStyle(
                                                color:
                                                    greyColor.withOpacity(.9),
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
                                        GetBuilder<WishListController>(
                                            builder: (wishListController) {
                                          if (wishListController
                                              .wishListProductsInProgress) {
                                            return const Center(
                                                child:
                                                    CircularProgressIndicator());
                                          }
                                          return InkWell(
                                            onTap: () {
                                              Get.find<WishListController>()
                                                  .createWishList(
                                                      productItemDetails
                                                          .productId!);
                                            },
                                            child: Container(
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
                                          );
                                        }),
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
                                          color:
                                              color == const Color(0xFFFFFFFF)
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
                            productItemDetails.des ?? '',
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
              priceNumber: '\$${productItemDetails.product?.price ?? 0}',
              buttonTitleText: 'Add to cart',
              onTap: () async {
                final result =
                    await Get.find<AuthController>().checkAuthState();
                if (result) {
                  if (_selectedColor != null && _selectedSize != null) {
                    Get.find<CartController>().addProductToCart(
                        productItemDetails.productId!,
                        _selectedSize!,
                        getHexCode(_selectedColor!));
                  } else {
                    // Get.snackbar('Message', 'Size and Color must be selected',
                    //     duration: const Duration(seconds: 3));
                    Get.showSnackbar(const GetSnackBar(
                        title: 'Message',
                        message: 'Size and Color must be selected',
                        duration: Duration(seconds: 3)));
                  }
                }
              },
              // );
            ),
          ],
        );
      }),
    );
  }

  // This getSize method splits the list on ',' first and then splits the last entry with '.'
  List<String> getSize(String size) {
    List<String> sizeNumber = size.split(',');

    List<String> differentSizes = sizeNumber
        .asMap()
        .entries
        .map((entry) {
          if (
              // entry.key == sizeNumber.length - 1 &&
              entry.value.contains('.')) {
            return entry.value.split('.');
            // .map((string) => string.replaceAll(',', ''))
            // .toList();
          }
          return [entry.value];
        })
        .expand((element) => element)
        .toList();

    return differentSizes; // Add the return statement here
  }

  // gets the color from the color string.
  List<Color> getColor(String color) {
    final productColor = color.split(',');
    List<Color> flutterColor = [];
    // productColor.forEach((color) {
    //   color = color.replaceAll('#', '0xFF');
    //   flutterColor.add(Color(int.parse(color)));
    // });
    // return flutterColor;
    // I can't use map() function here. why?
    //Because, i will have a side effect here(adding the color value in flutterColor list), but not returning
    // a straight forward list.

    for (color in productColor) {
      //replaceAll method returns a new modified color rather than changing the color's value in place.
      color = color.replaceAll('#', '0xFF');
      flutterColor.add(Color(int.parse(color)));
    }
    return flutterColor;
  }

  String getHexCode(Color color) {
    final colorString = color.toString().replaceAll('0xff', '#').replaceAll('Color(', '').replaceAll(')', '');
    return colorString;
  }
}
