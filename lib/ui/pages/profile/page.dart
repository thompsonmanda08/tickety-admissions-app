import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tickety_admission/tools/helpers.dart';
import 'package:tickety_admission/ui/pages/profile/controller.dart';
import 'package:tickety_admission/ui/widgets/appbar.dart';
import 'package:tickety_admission/ui/widgets/button.dart';
import 'package:tickety_admission/ui/widgets/profile_card.dart';
import 'package:tickety_admission/ui/widgets/text_input_form_field.dart';
import 'package:tickety_admission/values/colors.dart';

// ignore: must_be_immutable
class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoGlowScrollBehavior(),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              const CustomAppBar(),
              const SizedBox(height: 10.0),
              Expanded(
                child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileCard(
                        name:
                            "${controller.session.firstName} ${controller.session.lastName}",
                        phone: controller.session.mobileNo,
                        firstName: controller.session.firstName,
                        lastName: controller.session.lastName,
                        admissions: 0,
                        points: 0,
                        rank: 0,
                      ),
                      const SizedBox(height: 30.0),
                      const Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: neutralColor900,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      CustomTextInputField(
                        textInputType: TextInputType.text,
                        inputFieldName: "full_name",
                        labelText: "Full Name",
                        initialValue:
                            "${controller.session.firstName} ${controller.session.lastName}",
                        handleOnChanged: (String value) {
                          // ignore: avoid_print
                          print("ID Number: $value");
                        },
                      ),
                      const SizedBox(height: 20.0),
                      CustomTextInputField(
                        textInputType: TextInputType.number,
                        maxLength: 13,
                        inputFieldName: "mobile_number",
                        labelText: "Mobile Number",
                        initialValue: controller.session.mobileNo,
                        handleOnChanged: (String value) {
                          // ignore: avoid_print
                          print("ID Number: $value");
                        },
                      ),
                      const SizedBox(height: 20.0),
                      const SizedBox(height: 20.0),
                      CustomButton(
                        text: 'Update Profile',
                        handleOnClick: () {},
                      ),
                      const SizedBox(height: 20.0),
                      Center(
                        child: GestureDetector(
                          onTap: () => controller.signUserOut(),
                          child: const Text(
                            'Log Out',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
