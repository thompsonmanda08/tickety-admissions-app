import 'package:get/get.dart';
import 'package:tickety_admission/services/user_session.dart';
import 'package:tickety_admission/tools/helpers.dart';

class EventsController extends GetxController {
  UserSessionService session = Get.find<UserSessionService>();
  var phone = "".obs;
  var event = "".obs;
  var isLoading = false.obs;

  void handleChangeSessionEvent() {
    // CHANGE THE SESSION EVENT
    session.event = event.value;
    createLog("Session Event Changed: ${event.value}");
    Get.offAllNamed('/home');
  }
}
