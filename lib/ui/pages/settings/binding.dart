import 'package:get/get.dart';
import 'package:tickety_admission/services/user_session.dart';

class SettingsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserSessionService());
  }
}
