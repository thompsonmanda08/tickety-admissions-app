import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tickety_admission/ui/pages/profile/controller.dart';
import 'package:tickety_admission/ui/widgets/appbar.dart';
import 'package:tickety_admission/ui/widgets/button.dart';
import 'package:tickety_admission/ui/widgets/profile_card.dart';
import 'package:tickety_admission/ui/widgets/settings_icon.dart';
import 'package:tickety_admission/ui/widgets/text_input_form_field.dart';
import 'package:tickety_admission/values/colors.dart';

// ignore: must_be_immutable
class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    // ****************** SCREEN RENDERER ************************ /
    return Scaffold(
      appBar: CustomAppBar(
        trailing: SettingsIcon(
          onTap: () => Get.toNamed("/events"),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 60,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24.0),
              const ProfileCard(
                admissions: 0,
                points: 0,
                rank: 0,
              ),
              const SizedBox(height: 30.0),
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  'Profile',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: neutralColor900,
                      height: 2),
                ),
              ),

              CustomTextInputField(
                textInputType: TextInputType.text,
                inputFieldName: "full_name",
                labelText: "Full Name",
                isEnabled: false,
                initialValue:
                    "${controller.session.firstName} ${controller.session.lastName}",
                handleOnChanged: (String value) {
                  // ignore: avoid_print
                  print("ID Number: $value");
                },
              ),
              const SizedBox(height: 24.0),
              CustomTextInputField(
                textInputType: TextInputType.number,
                maxLength: 13,
                isEnabled: false,
                inputFieldName: "mobile_number",
                labelText: "Mobile Number",
                initialValue: controller.session.mobileNo,
                handleOnChanged: (String value) {
                  // ignore: avoid_print
                  print("ID Number: $value");
                },
              ),
              const SizedBox(height: 24.0),
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

              //
            ],
          ),
        ),
      ),
    );
  }
}
