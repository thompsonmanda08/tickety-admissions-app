import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tickety_admission/tools/helpers.dart';
import 'package:tickety_admission/ui/pages/login/controller.dart';
import 'package:tickety_admission/ui/widgets/button.dart';
import 'package:tickety_admission/ui/widgets/button_2.dart';
import 'package:tickety_admission/ui/widgets/main_header.dart';
import 'package:tickety_admission/ui/widgets/text_input_form_field.dart';
import 'package:tickety_admission/values/colors.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});
  bool fieldsFilledAndValid() {
    if (controller.authID.value.isNotEmpty &&
        controller.authPassword.value.isNotEmpty) {
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
                child: Column(
                  children: [
                    const MainHeader(
                      title: "Welcome to Tickety",
                      subtitle:
                          "Login to handle admissions and make ticket sales",
                    ),
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.65,
                        minHeight: MediaQuery.of(context).size.height * 0.5,
                      ),
                      // color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //  ************** LOGIN INPUT FIELDS *************** //
                            Column(
                              children: [
                                CustomTextInputField(
                                  inputFieldName: "login ID",
                                  labelText: "Login ID",
                                  initialValue: controller.authID.value,
                                  handleOnChanged: (value) {
                                    controller.authID.value = value;
                                  },
                                ),
                                const SizedBox(height: 20.0),
                                CustomTextInputField(
                                  textInputType: TextInputType.text,
                                  obscureText: true,
                                  inputFieldName: "password",
                                  labelText: "Password",
                                  handleOnChanged: (value) {
                                    controller.authPassword.value = value;
                                  },
                                ),
                                const SizedBox(height: 20.0),
                                Obx(() {
                                  bool isValid = fieldsFilledAndValid();
                                  return Button(
                                    isDisabled: isValid,
                                    // borderRadius: 24,
                                    text: 'Login',
                                    isLoading: controller.isLoading.value,
                                    onTap: () {
                                      controller.handleLogin();
                                      // Get.toNamed("/home");
                                    },
                                  );
                                }),
                                const SizedBox(height: 48.0),
                              ],
                            ),
                            //  ************** FOOTER CONTENT *************** //
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Unable to login?',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        color: neutralColor600,
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
                                SvgPicture.asset(
                                  width: 140,
                                  'assets/images/poweredby.svg',
                                ),
                              ],
                            )
                          ],
                        ),
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
