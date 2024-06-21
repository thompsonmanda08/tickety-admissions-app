import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tickety_admission/values/colors.dart';
import 'controller.dart';

class SplashPage extends GetView<SplashPageController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onDoubleTap: () => Get.offNamed("/onboarding"),
              child: SizedBox(
                width: screenSize.width * 0.65,
                child: SvgPicture.asset('assets/icons/splash-logo.svg'),
              ),
            ), // Logo image path
          ),
          const SizedBox(height: 40),
          Container(
            width: 200,
            height: 50,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: Text(
                'SCANPAY',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Center(
            child: Text(
              'Your Perfect Payment Partner',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: kPrimaryColor,
                fontWeight: FontWeight.w300,
              ),
            ), // Logo image path
          ),
        ],
      ),
    );
  }
}
