import 'package:get/get.dart';
import 'package:tickety_admission/services/user_session.dart';
import 'package:tickety_admission/tools/helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatusPageController extends GetxController {
  final UserSessionService _userSession = UserSessionService();

  @override
  void onInit() async {
    super.onInit();
  }
}
