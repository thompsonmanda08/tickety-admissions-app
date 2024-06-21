import 'package:get/get.dart';
import 'package:tickety_admission/services/login_service.dart';
import 'package:tickety_admission/services/user_session.dart';
import 'package:tickety_admission/ui/pages/login/controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginService>(LoginService());
    Get.put<UserSessionService>(UserSessionService());
    Get.put<LoginController>(LoginController());
  }
}
