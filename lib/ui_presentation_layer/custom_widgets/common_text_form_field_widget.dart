import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class CommonTextFormFieldWidget extends StatelessWidget {
  const CommonTextFormFieldWidget({
    required this.controller,
    required this.validator,
    super.key,
    required this.hintText,
    this.maxLines,
    this.textInputType,
  });

  final Function(String?) validator;
  final TextEditingController controller;
  final String hintText;
  final int? maxLines;
  final TextInputType? textInputType;
  // final TextAlign textAlign;
  // final TextAlignVertical? textAlignVertical;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: controller,
      validator: (String? value) {
        return validator(value);
      },
      maxLines: maxLines,
      keyboardType: textInputType,
      // textAlign: textAlign,
      // textAlignVertical: textAlignVertical,
      decoration: InputDecoration(

        hintText: hintText,

        hintStyle: const TextStyle(color: softGreyColor, ),
        contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6))),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 2),
          // borderRadius: BorderRadius.all(Radius.circular(4))
        ),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 2)),
      ),
    );
  }
}
