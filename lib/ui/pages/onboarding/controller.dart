import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingPageController extends GetxController {
  PageController slideController = PageController();
  var currentIndex = 0.obs;

  storeOnboardInfo() async {
    // SET ONBOARDING VALUE
    const userOnboarded = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("userOnboarded", userOnboarded);
  }

  void setCurrentIndex(value) {
    currentIndex.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    slideController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    slideController.dispose();
    super.dispose();
  }
}

class UnbordingContent {
  String image;
  String discription;

  UnbordingContent({
    required this.image,
    required this.discription,
  });
}

List<UnbordingContent> contents = [
  UnbordingContent(
    image: 'assets/images/login-image.png',
    discription: "Its simple,\n Just Scan the QR code",
  ),
  UnbordingContent(
    image: 'assets/images/login-image.png',
    discription:
        "Enter the amount, confirm \n transaction \n That’s it. You are good to go.",
  ),
  UnbordingContent(
    image: 'assets/images/login-image.png',
    discription: "Quick, Easy and Free, \n get started now!",
  ),
];
