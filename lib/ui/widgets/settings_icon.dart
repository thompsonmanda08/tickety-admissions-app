import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tickety_admission/ui/widgets/button_2.dart';
import 'package:tickety_admission/values/colors.dart';

class SettingsIcon extends StatelessWidget {
  const SettingsIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed("/settings"),
      child: CircleAvatar(
        backgroundColor: kPrimaryColor.withOpacity(0.0575),
        minRadius: 24,
        maxRadius: 24,
        child: SvgPicture.asset(
          'assets/icons/settingsIcon.svg',
          colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
        ),
      ),
    );
  }
}
