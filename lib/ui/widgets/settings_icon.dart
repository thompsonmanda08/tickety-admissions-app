import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tickety_admission/values/colors.dart';

class SettingsIcon extends StatelessWidget {
  const SettingsIcon({
    super.key,
    this.color = Colors.white,
    this.onTap,
  });

  final Color color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        // border: Border.all(width: 2, color: neutralColor100.withOpacity(0.25)),
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Material(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(48),
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap ?? () => Get.toNamed("/settings"),
            splashColor: neutralColor300.withOpacity(0.25),
            child: CircleAvatar(
              backgroundColor: neutralColor900.withOpacity(0.1),
              minRadius: 24,
              maxRadius: 24,
              child: SvgPicture.asset(
                'assets/icons/settingsIcon.svg',
                colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
