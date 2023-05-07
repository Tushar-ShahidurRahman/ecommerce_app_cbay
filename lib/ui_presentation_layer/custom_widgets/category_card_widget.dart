import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(.2),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Icon(
                Icons.computer,
                size: 32,
                color: primaryColor.withOpacity(.5),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            name,
            textAlign: TextAlign.center,
            // overflow:TextOverflow.visible,
            style: const TextStyle(
                color: primaryColor,
                letterSpacing: 0.6,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
