import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SVGIcon extends StatelessWidget {
  const SVGIcon(
      {super.key, required this.iconColor, this.size, required this.icon});

  final String icon;
  final Color iconColor;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$icon.svg',
      width: size ?? 24,
      colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
    );
  }
}
