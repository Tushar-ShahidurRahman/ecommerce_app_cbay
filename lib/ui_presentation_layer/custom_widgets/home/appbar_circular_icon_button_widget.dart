import 'package:flutter/material.dart';

import '../../utils/app_color.dart';

class AppBarCircularIconButtonWidget extends StatelessWidget {
  const AppBarCircularIconButtonWidget({
    super.key,
    required this.iconData,
    required this.onTap,
  });

  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(32),
      splashColor: primaryColor.withOpacity(.4),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
        child: CircleAvatar(
          backgroundColor: softGreyColor.withOpacity(.4),
          foregroundColor: Colors.black54,
          radius: 15,
          child: Icon(
            iconData,
            size: 20,
          ),
        ),
      ),
    );
  }
}