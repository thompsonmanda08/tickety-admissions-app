import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tickety_admission/ui/widgets/loader.dart';
import 'package:tickety_admission/values/colors.dart';

class ValidatingScreen extends StatelessWidget {
  const ValidatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Stack(
        children: [
          Transform.translate(
            offset: const Offset(10, 60),
            child: const Center(
              child: LoadingState(
                isWhite: true,
                width: 200,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: screenSize.width * 0.50,
              child: SvgPicture.asset(
                'assets/icons/logo.svg',
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
