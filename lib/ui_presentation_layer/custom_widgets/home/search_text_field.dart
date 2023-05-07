import 'package:flutter/material.dart';

import '../../utils/app_color.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        fillColor: softGreyColor.withOpacity(0.1),
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8)),
        hintText: 'search',
        hintStyle: TextStyle(color: softGreyColor.withOpacity(0.7)),
        prefixIcon: const Icon(
          Icons.search,
          color: greyColor,
        ),
        // label: Row(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     Icon(
        //       Icons.search,
        //       color: greyColor,
        //       size: 25,
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
