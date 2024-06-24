import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tickety_admission/ui/pages/profile/controller.dart';
import 'package:tickety_admission/ui/pages/reports/widgets/stats.dart';
import 'package:tickety_admission/ui/widgets/appbar.dart';
import 'package:tickety_admission/ui/widgets/profile_card.dart';
import 'package:tickety_admission/ui/widgets/settings_icon.dart';
import 'package:tickety_admission/ui/widgets/tab.dart';
import 'package:tickety_admission/values/colors.dart';

// ignore: must_be_immutable
class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ****************** SCREEN RENDERER ************************ /
    return Scaffold(
      appBar: CustomAppBar(
        trailing: SettingsIcon(
          onTap: () => Get.toNamed("/events"),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
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
                CustomTab(
                  tabTitles: const ['My Stats', 'All Stats'],
                  tabContent: const [
                    Stats(),
                    Stats(),
                  ],
                ),
                const SizedBox(height: 30.0),
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
      ),
    );
  }
}
