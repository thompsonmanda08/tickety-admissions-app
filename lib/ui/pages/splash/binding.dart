import 'package:get/get.dart';
import 'package:tickety_admission/services/user_session.dart';

import 'controller.dart';

class SplashPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashPageController());
    Get.put(UserSessionService());
  }
}
