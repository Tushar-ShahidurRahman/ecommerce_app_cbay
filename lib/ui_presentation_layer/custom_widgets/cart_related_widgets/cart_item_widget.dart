import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../stepper_widget.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/demo_shoe.png',
            width: 120,
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'New nike shoe',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: greyColor),
                          ),
                          Row(
                            children: const [
                              Text("Color : Green"),
                              SizedBox(width: 12),
                              Text("Size : XL"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_forever),
                      onPressed: () {},
                      color: softGreyColor,
                    ),
                  ],
                ),
                const SizedBox(width: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      '\$100',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    StepperWidget(),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
