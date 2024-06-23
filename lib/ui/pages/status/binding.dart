import 'package:get/get.dart';
import 'package:tickety_admission/services/user_session.dart';

import 'controller.dart';

class StatusPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(StatusPageController());
    Get.put(UserSessionService());
  }
}
