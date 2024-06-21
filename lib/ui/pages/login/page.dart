import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tickety_admission/tools/helpers.dart';
import 'package:tickety_admission/ui/pages/login/controller.dart';
import 'package:tickety_admission/ui/widgets/button.dart';
import 'package:tickety_admission/ui/widgets/text_input_form_field.dart';
import 'package:tickety_admission/values/colors.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});
  bool fieldsFilledAndValid() {
    if (controller.phone.value.isNotEmpty && controller.pin.value.isNotEmpty) {
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
                    Image.asset(
                      'assets/images/login-image.png',
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.contain,
                    ),
                    const Positioned(
                      top: 10,
                      left: 35,
                      right: 0,
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.normal,
                          color: neutralColor100,
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 50,
                      left: 35,
                      right: 0,
                      child: Text(
                        'Your session ended, Login to make a payment',
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
                          const SizedBox(height: 400.0),
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
                              text: 'Login',
                              isLoading: controller.isLoading.value,
                              handleOnClick: () {
                                controller.handleLogin();
                              },
                            );
                          }),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Don’t have an account?',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  color: neutralColor400,
                                ),
                              ),
                              const SizedBox(width: 5.0),
                              GestureDetector(
                                onTap: () => Get.toNamed('/signup'),
                                child: const Text(
                                  'Sign Up!',
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
