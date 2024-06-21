import 'package:get/get.dart';
import 'package:tickety_admission/services/user_session.dart';
import 'package:tickety_admission/tools/helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPageController extends GetxController {
  final UserSessionService _userSession = UserSessionService();

  @override
  void onInit() async {
    super.onInit();

    Future.delayed(const Duration(milliseconds: 3000), () async {
      // CHECK IF THE USER IS AUTHENTICATED
      // _userSession.authToken - Needs to Be Verified and Authenticated
      if (_userSession.authToken != "") {
        createLog(_userSession.authToken);
        return Get.offAllNamed("/login");
      }

      SharedPreferences prefs = await SharedPreferences.getInstance();
      final bool? userOnboarded = prefs.getBool("userOnboarded");

      if (userOnboarded != null && userOnboarded) {
        return Get.offAllNamed("/login");
      }

      Get.offAllNamed("/onboarding");
    });
  }
}
