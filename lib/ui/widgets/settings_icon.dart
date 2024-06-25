import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tickety_admission/values/colors.dart';

class SettingsIcon extends StatelessWidget {
  const SettingsIcon({
    super.key,
    this.color = Colors.white,
    this.onTap,
    this.child,
    this.width = 28,
    this.icon = "logo-icon",
  });

  final Color color;
  final String icon;
  final double width;
  final Widget? child;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      constraints: const BoxConstraints(maxHeight: 60),
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
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
              child: child ??
                  SvgPicture.asset(
                    'assets/icons/$icon.svg',
                    width: width,
                    colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
