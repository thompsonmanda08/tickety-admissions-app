import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tickety_admission/values/colors.dart';

class Empty extends StatelessWidget {
  const Empty({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/emptyIcon.svg',
          ),
          const SizedBox(height: 10.0),
          const Text(
            'No Transactions!',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              color: neutralColor900,
            ),
          ),
          const SizedBox(height: 10.0),
          const Text(
            'You have not made any payments yet.',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              color: neutralColor200,
            ),
          ),
        ],
      ),
    );
  }
}
