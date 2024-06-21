import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tickety_admission/values/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.onTap, this.backIconColor});
  final void Function()? onTap;
  final Color? backIconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/leftIcon.svg',
            width: 16,
            colorFilter: ColorFilter.mode(
                backIconColor ?? kPrimaryColor, BlendMode.srcIn),
          ),
          const SizedBox(width: 10),
          Text(
            'Back',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: backIconColor ?? kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
