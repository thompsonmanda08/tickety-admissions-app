import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tickety_admission/ui/widgets/svg_icon.dart';
import 'package:tickety_admission/values/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.onBackClick, this.backIconColor});

  final Color? backIconColor;
  final void Function()? onBackClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Material(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(16),
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Get.back();
            onBackClick!();
          },
          splashColor: kPrimaryColor.withOpacity(0.1),
          child: Container(
            padding: const EdgeInsets.only(right: 12),
            constraints: const BoxConstraints(maxHeight: 64),
            height: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SVGIcon(
                  iconColor: backIconColor ?? Colors.white,
                  icon: "leftIcon",
                  size: 18,
                ),
                const SizedBox(width: 10),
                Text(
                  'Back',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: backIconColor ?? Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
