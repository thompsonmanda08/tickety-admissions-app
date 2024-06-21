import 'package:flutter_svg/flutter_svg.dart';
import 'package:tickety_admission/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class OnBoardingPage extends GetView<OnBoardingPageController> {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double bodyText = screenSize.width <= 400 ? 12 : 16;

    // * NAVIGATOR INDICATOR - DOTS BUILDER
    Widget buildDot(int index, context) {
      return Obx(
        () => Container(
          height: 6,
          width: controller.currentIndex.value == index ? 30 : 6,
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: kPrimaryColor,
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/onboarding-image.png',
            width: screenSize.width,
            fit: BoxFit.cover,
          ),
          PageView.builder(
            controller: controller.slideController,
            itemCount: contents.length,
            onPageChanged: (int index) {
              controller.setCurrentIndex(index);
            },
            itemBuilder: (_, i) {
              return Container(
                margin: EdgeInsets.only(bottom: screenSize.height * 0.15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      contents[i].discription,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: bodyText,
                        color: kPrimaryColor,
                        height: 1.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          // * BOTTOM NAV
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: screenSize.height * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // * Prev Button
                  Obx(
                    () => Expanded(
                      flex: 2,
                      child: controller.currentIndex.value > 0
                          ? TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: kPrimaryColor,
                              ),
                              onPressed: () {
                                // Get.offAllNamed("/welcome")
                                if (controller.currentIndex.value == 0) {
                                  return;
                                }
                                controller.slideController.previousPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn,
                                );
                              },
                              child: const Text(
                                'Prev',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                  // * Dots Indicator
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        contents.length,
                        (index) => buildDot(index, context),
                      ),
                    ),
                  ),
                  // * Next Button
                  Expanded(
                    flex: 2,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: kPrimaryColor,
                      ),
                      child: Obx(
                        () => Text(
                          controller.currentIndex.value == contents.length - 1
                              ? "Get Started"
                              : "Next", // Next Button is buggy - No Error given
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: controller.currentIndex.value ==
                                    contents.length - 1
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                      onPressed: () async {
                        if (controller.currentIndex.value ==
                            contents.length - 1) {
                          await controller.storeOnboardInfo();
                          Get.offAndToNamed("/welcome");
                        }
                        controller.slideController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                    ), //Empty Placeholder Widget!
                  ),
                ],
              ),
            ),
          ),
          // * SKIP BUTTON
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () async {
                await controller.storeOnboardInfo();
                Get.offAllNamed("/login");
              },
              child: Container(
                margin: const EdgeInsets.only(right: 20, top: 70),
                padding: const EdgeInsets.all(12),
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 30),
                    SvgPicture.asset(
                      'assets/icons/logo.svg',
                      width: 150,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    const Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
