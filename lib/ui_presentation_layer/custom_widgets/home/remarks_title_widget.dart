import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/styles.dart';

class RemarksTitleWidget extends StatelessWidget {
  const RemarksTitleWidget({
    super.key,
    required this.remarksName,
    required this.onTapSeeAll,
  });

  final String remarksName;
  final VoidCallback onTapSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(remarksName,
            style: screenTitleTextStyle.copyWith(
                fontSize: 17, fontWeight: FontWeight.w600)),
        TextButton(
            onPressed: onTapSeeAll,
            child: Text(
              'See all',
              style: TextStyle(color: primaryColor),
            ))
      ],
    );
  }
}
