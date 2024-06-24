import 'package:get/get.dart';
import 'package:tickety_admission/services/user_session.dart';
import 'package:tickety_admission/tools/helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tickety_admission/ui/pages/manual_admission/controller.dart';

class StatusPageController extends GetxController {
  final UserSessionService _userSession = UserSessionService();
  final ManualAdmissionController admissions =
      Get.find<ManualAdmissionController>();

  @override
  void onInit() async {
    super.onInit();
  }
}
