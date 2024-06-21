import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tickety_admission/ui/widgets/appbar.dart';
import 'package:tickety_admission/ui/widgets/search.dart';
import 'package:tickety_admission/values/colors.dart';
import 'controller.dart';

class SettingsPage extends GetView<SettingsPageController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: CustomAppBar(
        // background: kPrimaryColor,
        // title: "Settings",
        titleColor: Colors.white,
        backIconColor: Colors.white,
        trailing: SvgPicture.asset(
          'assets/icons/logo-app-icon.svg',
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(color: neutralColor300),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: GestureDetector(
                onDoubleTap: () => Get.offNamed("/onboarding"),
                child: Center(
                  child: SizedBox(
                    width: screenSize.width * 0.65,
                    child: SvgPicture.asset(
                      'assets/icons/logo.svg',
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                  ),
                ),
              ), // Logo image path
            ),
          ],
        ),
      ),
    );
  }
}
