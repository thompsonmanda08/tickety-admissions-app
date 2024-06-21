import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tickety_admission/ui/widgets/back_button.dart';
import 'package:tickety_admission/values/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({
    super.key,
    this.leading,
    this.titleWidget,
    this.title = '',
    this.trailing,
    this.background,
  });

  final String title;
  final Widget? leading;
  final Widget? trailing;
  final Widget? titleWidget;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: background,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // * LEFTSIDE
          leading ?? CustomBackButton(onTap: () => Get.back()),

          //  * CENTER
          Expanded(
              child: titleWidget == null
                  ? Transform.translate(
                      offset: const Offset(10, 0),
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: kPrimaryColor,
                        ),
                      ),
                    )
                  : const SizedBox.shrink()),

          // * RIGHTSIDE
          trailing ?? const SizedBox.shrink(),
        ],
      ),
    ));
  }

  @override
  Size get preferredSize => const Size(
        double.maxFinite, //width
        90, //height
      );

  @override
  Widget get child => throw UnimplementedError();
}
