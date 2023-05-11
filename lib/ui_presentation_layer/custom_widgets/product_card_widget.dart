import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // maybe go to product detail page from here. Lets see...
    return SizedBox(
      width: 130,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        shadowColor: primaryColor.withOpacity(.3),
        child: Column(
          children: [
            Image.asset(
              "assets/images/demo_shoe.png",
              height: 100,
              width: 132,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "Running shoe 345A",
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
                      const Text(
                        '\$366',
                        style: TextStyle(
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
                            '4.6',
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
    );
  }
}
