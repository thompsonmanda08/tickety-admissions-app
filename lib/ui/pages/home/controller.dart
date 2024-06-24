import 'package:get/get.dart';
import 'package:tickety_admission/services/user_session.dart';
import 'package:tickety_admission/ui/pages/profile/controller.dart';
import 'package:tickety_admission/ui/pages/status/controller.dart';

class HomeController extends GetxController {
  UserSessionService session = Get.find<UserSessionService>();
  ProfileController profile = Get.find<ProfileController>();
  final StatusPageController statusController =
      Get.find<StatusPageController>();
  var merchantId = ''.obs;
  var merchantPhone = ''.obs;
  var merchantName = ''.obs;
}
