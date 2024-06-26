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
    discription: "Its simple, Scan the QR code \n to validate a Ticket",
  ),
  UnbordingContent(
    image: 'assets/images/login-image.png',
    discription:
        "Enter the ticket ID, confirm ticket \n That’s it. You are good to go.",
  ),
  UnbordingContent(
    image: 'assets/images/login-image.png',
    discription: "Perform Cash and Mobile Money \n ticket Sales on the go! ",
  ),
];
