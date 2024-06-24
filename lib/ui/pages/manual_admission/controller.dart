import 'package:get/get.dart';
import 'package:tickety_admission/services/user_session.dart';
import 'package:tickety_admission/ui/pages/status/controller.dart';

class ManualAdmissionController extends GetxController {
  final UserSessionService session = Get.find<UserSessionService>();
  final StatusPageController statusController =
      Get.find<StatusPageController>();
}
