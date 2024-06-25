import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tickety_admission/ui/pages/profile/controller.dart';
import 'package:tickety_admission/ui/widgets/appbar.dart';
import 'package:tickety_admission/ui/widgets/avatar.dart';
import 'package:tickety_admission/ui/widgets/profile_card.dart';
import 'package:tickety_admission/ui/widgets/settings_icon.dart';
import 'package:tickety_admission/values/colors.dart';

// ignore: must_be_immutable
class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ****************** SCREEN RENDERER ************************ /
    return Scaffold(
      appBar: CustomAppBar(
        leading: Avatar(
          firstName: controller.session.firstName,
          lastName: controller.session.lastName,
        ),
        titleWidget: const Center(
          child: Text(
            "Account Profile",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: neutralColor100,
            ),
          ),
        ),
        trailing: SettingsIcon(
          icon: "changeIcon",
          onTap: () => Get.offAllNamed("/events"),
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
              const ProfileCard(),
              const SizedBox(height: 60.0),
              // CustomTab(
              //   tabTitles: const ['My Stats', 'All Stats'],
              //   tabContent: const [
              //     Stats(),
              //     Stats(),
              //   ],
              // ),
              // const SizedBox(height: 30.0),
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
