import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tickety_admission/tools/helpers.dart';
import 'package:tickety_admission/ui/pages/signup/controller.dart';
import 'package:tickety_admission/ui/widgets/button.dart';
import 'package:tickety_admission/ui/widgets/text_input_form_field.dart';
import 'package:tickety_admission/values/colors.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});
  bool fieldsFilledAndValid() {
    if (controller.firstName.value.isNotEmpty &&
        controller.lastName.value.isNotEmpty &&
        controller.email.value.isNotEmpty &&
        controller.phone.value.isNotEmpty &&
        controller.pin.value.isNotEmpty) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: kPrimaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: ScrollConfiguration(
        behavior: NoGlowScrollBehavior(),
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/background.svg',
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.contain,
                    ),
                    Positioned(
                      top: 10,
                      left: 35,
                      right: 0,
                      child: SvgPicture.asset(
                        'assets/icons/logo-white.svg',
                      ),
                    ),
                    const Positioned(
                      top: 60,
                      left: 35,
                      right: 0,
                      child: Text(
                        'Hello there, welcome!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.normal,
                          color: neutralColor100,
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 100,
                      left: 35,
                      right: 0,
                      child: Text(
                        'Create and account and transact, \n its that simple.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: neutralColor100,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 220.0),
                          CustomTextInputField(
                            textInputType: TextInputType.text,
                            inputFieldName: "first_name",
                            labelText: "First Name",
                            handleOnChanged: (value) {
                              controller.firstName.value = value;
                            },
                          ),
                          const SizedBox(height: 20.0),
                          CustomTextInputField(
                            textInputType: TextInputType.text,
                            inputFieldName: "last_name",
                            labelText: "Last Name",
                            handleOnChanged: (value) {
                              controller.lastName.value = value;
                            },
                          ),
                          const SizedBox(height: 20.0),
                          CustomTextInputField(
                            textInputType: TextInputType.phone,
                            inputFieldName: "mobile_number",
                            labelText: "Mobile Number",
                            handleOnChanged: (value) {
                              controller.phone.value = value;
                            },
                          ),
                          const SizedBox(height: 20.0),
                          CustomTextInputField(
                            textInputType: TextInputType.emailAddress,
                            inputFieldName: "email",
                            labelText: "Email",
                            handleOnChanged: (value) {
                              controller.email.value = value;
                            },
                          ),
                          const SizedBox(height: 20.0),
                          CustomTextInputField(
                            textInputType: TextInputType.number,
                            maxLength: 5,
                            obscureText: true,
                            inputFieldName: "pin",
                            labelText: "Pin",
                            handleOnChanged: (value) {
                              controller.pin.value = value;
                            },
                          ),
                          const SizedBox(height: 20.0),
                          Obx(() {
                            bool isValid = fieldsFilledAndValid();
                            return CustomButton(
                              isDisabled: isValid,
                              text: 'Create Account',
                              isLoading: controller.isLoading.value,
                              handleOnClick: () {
                                controller.handleSignUp();
                              },
                            );
                          }),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account.',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  color: neutralColor400,
                                ),
                              ),
                              const SizedBox(width: 5.0),
                              GestureDetector(
                                onTap: () => Get.toNamed('/login'),
                                child: const Text(
                                  'Login!',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          const Text(
                            textAlign: TextAlign.center,
                            'Read our Privacy Policy and Terms and \n Conditions',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: neutralColor400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
