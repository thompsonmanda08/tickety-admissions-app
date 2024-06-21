import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tickety_admission/values/colors.dart';

class ContentDisplay extends StatelessWidget {
  final Color? firstTextColor;
  final Color? secondTextColor;
  final Color? color;
  final String? firstText;
  final String? secondText;
  const ContentDisplay(
      {
       super.key,
       this.color,
       this.firstTextColor,
       this.secondTextColor,
       this.firstText,
       this.secondText,
       });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$firstText',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: firstTextColor,
            ),
          ),
        secondText != null ? Text(
            '$secondText',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: secondTextColor,
            ),
          ) :  SvgPicture.asset(
            'assets/icons/rightIcon.svg',
            colorFilter: const ColorFilter.mode(
              kPrimaryColor,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}
