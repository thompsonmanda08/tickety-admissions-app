import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, this.width, this.color});

  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        'assets/icons/logo.svg',
        width: width ?? 150,
        colorFilter: ColorFilter.mode(
          color ?? Colors.white,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
