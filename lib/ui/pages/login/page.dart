import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tickety_admission/tools/helpers.dart';
import 'package:tickety_admission/ui/pages/login/controller.dart';
import 'package:tickety_admission/ui/widgets/button.dart';
import 'package:tickety_admission/ui/widgets/logo.dart';
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
                    SvgPicture.asset(
                      'assets/icons/background.svg',
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.contain,
                      colorFilter: const ColorFilter.mode(
                        kPrimaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    const Positioned(top: 35, left: 0, right: 0, child: Logo()),
                    const Positioned(
                      top: 90,
                      left: 0,
                      right: 0,
                      child: Text(
                        textAlign: TextAlign.center,
                        'Welcome to Tickey',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.normal,
                          color: neutralColor100,
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 130,
                      left: 0,
                      right: 0,
                      child: Text(
                        textAlign: TextAlign.center,
                        'Login to handle admissions and make ticket sales',
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
                          const SizedBox(height: 250.0),
                          CustomTextInputField(
                            textInputType: TextInputType.phone,
                            inputFieldName: "username",
                            labelText: "Username",
                            handleOnChanged: (value) {
                              controller.phone.value = value;
                            },
                          ),
                          const SizedBox(height: 20.0),
                          CustomTextInputField(
                            textInputType: TextInputType.text,
                            obscureText: true,
                            inputFieldName: "password",
                            labelText: "Password",
                            handleOnChanged: (value) {
                              controller.pin.value = value;
                            },
                          ),
                          const SizedBox(height: 20.0),
                          Obx(() {
                            bool isValid = fieldsFilledAndValid();
                            return CustomButton(
                              // isDisabled: isValid,
                              text: 'Login',
                              isLoading: controller.isLoading.value,
                              handleOnClick: () {
                                // controller.handleLogin();
                                Get.toNamed("/home");
                              },
                            );
                          }),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Unable to login?',
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
                                  'Contact Support',
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
                            'Powered by BGS',
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
