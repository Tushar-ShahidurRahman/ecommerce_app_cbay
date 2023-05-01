import 'package:ecommerce_app_cbay/ui_presentation_layer/screens/user_profile_screen.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../custom_widgets/common_elevated_button.dart';
import '../custom_widgets/common_text_form_field_widget.dart';
import '../utils/styles.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
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
              'Enter OTP Code',
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
            PinCodeTextField(
              length: 4,
              obscureText: false,
              animationType: AnimationType.fade,
              keyboardType: TextInputType.number,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              controller: TextEditingController(),
              pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 45,
                  fieldWidth: 45,
                  activeFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  selectedColor: Colors.green,
                  activeColor: primaryColor,
                  inactiveColor: primaryColor,
                  inactiveFillColor: Colors.white),
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              onCompleted: (v) {},
              onChanged: (value) {},
              appContext: context,
            ),
            const SizedBox(
              height: 8,
            ),
            CommonElevatedButton(
              title: 'Next',
              onTap: () {
                Get.to(const UserProfileScreen());
              },
            ),
            const SizedBox(height: 16),
            RichText(
              text: const TextSpan(
                  text: 'This code will expire within ',
                  style: TextStyle(fontSize: 14, color: softGreyColor),
                  children: [
                    TextSpan(
                        text: '120 s',
                        style: TextStyle(
                            fontSize: 13,
                            color: primaryColor,
                            fontWeight: FontWeight.w600)),
                  ]),
            ),
            TextButton(
              // style: TextButton.styleFrom(foregroundColor: softGreyColor),
              onPressed: () {

              },
              child: const Text(
                'Resend otp',
                style: TextStyle(
                  color: greyColor,
                  // color: greyColor.withOpacity(0.4)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
