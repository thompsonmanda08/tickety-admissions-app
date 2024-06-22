import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Tile extends StatelessWidget {
  final Color color;
  final String statName1;
  final String statValue1;
  final String statName2;
  final String statValue2;
  final Color iconBGColor;
  final Color statNameColor;
  final Color statValueColor;

  const Tile({
    super.key,
    required this.color,
    required this.statName1,
    required this.statValue1,
    required this.statName2,
    required this.statValue2,
    required this.iconBGColor,
    required this.statNameColor,
    required this.statValueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
            decoration: ShapeDecoration(
              color: iconBGColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: SvgPicture.asset(
              'assets/icons/logo-icon.svg',
              width: 30,
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                statValue1,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: statValueColor,
                ),
              ),
              Text(
                statName1,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: statNameColor,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                statValue2,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: statValueColor,
                ),
              ),
              Text(
                statName2,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: statNameColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
