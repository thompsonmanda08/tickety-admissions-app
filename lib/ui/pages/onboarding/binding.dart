import 'package:get/get.dart';

import 'controller.dart';

class OnBoardingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<OnBoardingPageController>(OnBoardingPageController());
  }
}
