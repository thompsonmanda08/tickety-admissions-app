import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tickety_admission/ui/widgets/svg_icon.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.onBackClick, this.backIconColor});

  final Color? backIconColor;
  final void Function()? onBackClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
        onBackClick!();
      },
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
    );
  }
}
