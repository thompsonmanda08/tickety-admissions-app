import 'package:get/get.dart';
import 'package:tickety_admission/services/user_session.dart';

class HomeController extends GetxController {
  UserSessionService session = Get.find<UserSessionService>();
  var merchantId = ''.obs;
  var merchantPhone = ''.obs;
  var merchantName = ''.obs;
}
