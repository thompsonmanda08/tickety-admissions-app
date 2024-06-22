import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tickety_admission/ui/widgets/svg_icon.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.backIconColor});

  final Color? backIconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
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
