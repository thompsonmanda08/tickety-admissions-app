import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tickety_admission/ui/widgets/button_2.dart';
import 'package:tickety_admission/values/colors.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      width: screenSize.width * 0.50,
                      child: SvgPicture.asset(
                        'assets/icons/logo.svg',
                        colorFilter: const ColorFilter.mode(
                            Colors.white, BlendMode.srcIn),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Oops! Something went wrong!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Button(
                    text: "Retry",
                    backgroundColor: Colors.white,
                    color: kPrimaryColor,
                    onTap: () => Get.offAllNamed("/scan"),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
