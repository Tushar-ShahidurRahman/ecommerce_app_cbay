import 'package:flutter/material.dart';

import '../custom_widgets/common_elevated_button.dart';
import '../custom_widgets/common_text_form_field_widget.dart';
import '../utils/styles.dart';

class UserDetailInfoScreen extends StatefulWidget {
  const UserDetailInfoScreen({Key? key}) : super(key: key);

  @override
  State<UserDetailInfoScreen> createState() => _UserDetailInfoScreenState();
}

class _UserDetailInfoScreenState extends State<UserDetailInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png', height: 80, width: 80),
              const SizedBox(height: 16),
              Text(
                'Complete Profile',
                style: screenTitleTextStyle,
              ),
              const SizedBox(height: 4),
              Text(
                'Get started with us with your details',
                style: subTitleTextStyle,
              ),
              const SizedBox(
                height: 32,
              ),
              CommonTextFormFieldWidget(
                controller: TextEditingController(),
                hintText: 'First Name',
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'First name should not be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CommonTextFormFieldWidget(
                controller: TextEditingController(),
                hintText: 'Last Name',
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Last name should not be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CommonTextFormFieldWidget(
                controller: TextEditingController(),
                hintText: 'City',
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'City name should not be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CommonTextFormFieldWidget(
                controller: TextEditingController(),
                hintText: 'Mobile',
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Email field should not be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CommonTextFormFieldWidget(
                controller: TextEditingController(),
                maxLines: 5,
                // textAlign: TextAlign.center,
                // textAlignVertical: TextAlignVertical(y: 0.6),
                hintText: 'Shipping Address',
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Address should not be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              CommonElevatedButton(
                title: 'Complete',
                onTap: () {
                  // Get.offAll(HomeScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}