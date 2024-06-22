import 'package:flutter/material.dart';
import 'package:tickety_admission/values/colors.dart';

class TicketDetail extends StatelessWidget {
  const TicketDetail({
    super.key,
    required this.title,
    required this.detail,
    this.titleColor,
    this.detailColor,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final String title;
  final String detail;
  final Color? titleColor;
  final Color? detailColor;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          title,
          textAlign: crossAxisAlignment != CrossAxisAlignment.start
              ? TextAlign.end
              : TextAlign.left,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: neutralColor600,
            letterSpacing: 0,
          ),
        ),
        Text(
          detail,
          textAlign: crossAxisAlignment != CrossAxisAlignment.start
              ? TextAlign.end
              : TextAlign.left,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: neutralColor900,
              letterSpacing: 0,
              height: 1.5),
        ),
      ],
    );
  }
}
