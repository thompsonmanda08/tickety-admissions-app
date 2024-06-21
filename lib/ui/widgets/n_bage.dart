import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tickety_admission/values/colors.dart';

class NotificationBage extends StatelessWidget {
  const NotificationBage({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: neutralColor300,
      minRadius: 28,
      maxRadius: 28,
      child: SvgPicture.asset(
        'assets/icons/notificationIcon.svg',
      ),
    );
  }
}
