// import 'package:ecommerce_app_cbay/ui_presentation_layer/utils/styles.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/screens/otp_verification_screen.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../custom_widgets/common_elevated_button.dart';
import '../custom_widgets/common_text_form_field_widget.dart';
import '../utils/styles.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailETController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', height: 80, width: 80),
            const SizedBox(height: 16),
            Text(
              'Welcome Back',
              style: screenTitleTextStyle,
            ),
            const SizedBox(height: 4),
            Text(
              'Please Enter Your Email Address',
              style: subTitleTextStyle,
            ),
            const SizedBox(
              height: 32,
            ),
            CommonTextFormFieldWidget(
              controller: _emailETController,
              hintText: 'Email',
              textInputType: TextInputType.emailAddress,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Email field should not be empty';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 8,
            ),
            CommonElevatedButton(
              title: 'Next',
              onTap: () {
                Get.to(OTPVerificationScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
