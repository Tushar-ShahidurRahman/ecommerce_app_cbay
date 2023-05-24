import 'dart:async';

import 'package:ecommerce_app_cbay/ui_presentation_layer/screens/home_screen.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/screens/user_profile_screen.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/ui_state_manager/auth_controller.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../custom_widgets/common_elevated_button.dart';
import '../ui_state_manager/user_auth_controller.dart';
import '../utils/styles.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String email;

  const OTPVerificationScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController _otpETController = TextEditingController();
  int countdownSeconds = 120;
  Timer? countdownTimer;

  @override
  void initState() {
    super.initState();
    startCountdownTimer();
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

   void startCountdownTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if(countdownSeconds <= 0){
        countdownTimer?.cancel();
      }
      else{
        countdownSeconds--;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<UserAuthController>(builder: (userAuthController) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
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
                controller: _otpETController,
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
                height: 4,
              ),
              userAuthController.otpVerificationInProgress
                  ? const CircularProgressIndicator()
                  : CommonElevatedButton(
                      title: 'Next',
                      onTap: () async {
                        final otpResponseUI = await userAuthController.otpVerification(
                            widget.email, _otpETController.text);
                        if (otpResponseUI) {
                          Get.offAll(() => const HomeScreen());
                        } else {
                          Get.showSnackbar(

                            const GetSnackBar(
                              duration: Duration(seconds: 3),
                                title: 'Otp verification failed',
                                message:
                                    'Check your OTP once again before entering'),
                          );
                        }
                      },
                    ),
              const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                    text: 'This code will expire within ',
                    style: const TextStyle(fontSize: 14, color: softGreyColor),
                    children: [
                      TextSpan(
                          text: '$countdownSeconds s',
                          style: const TextStyle(
                              fontSize: 13,
                              color: primaryColor,
                              fontWeight: FontWeight.w600)),
                    ]),
              ),
              TextButton(
                // style: TextButton.styleFrom(foregroundColor: softGreyColor),
                onPressed: () {},
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
        );
      }),
    );
  }


}
