import 'package:flutter/material.dart';
import 'package:tickety_admission/values/colors.dart';


class QRDetails extends StatelessWidget {
  final String merchantName;
  const QRDetails({super.key, required this.merchantName});

  @override
  Widget build(BuildContext context) {
    String displayName = merchantName.length > 15
        ? '${merchantName.substring(0, 15)}...'
        : merchantName;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: neutralColor100,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1.0, color: neutralColor300),
      ),
      child: Column(
        children: [
          Text(
            displayName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: kPrimaryColor,
            ),
          ),
          const SizedBox(height: 10.0),
          Image.asset('assets/images/qr_code.png'),
        ],
      ),
    );
  }
}
